package com.ctbc.framework.crypto;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import jakarta.annotation.PostConstruct;
import javax.crypto.Cipher;
import javax.crypto.spec.OAEPParameterSpec;
import javax.crypto.spec.PSource;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

@Component
public class RsaCryptoService {
    private String publicKeySpkiBase64;

    private String privateKeyPkcs8Base64;

    @PostConstruct
    public void init() {
        try {
            ClassPathResource resource = new ClassPathResource("security/rsa-keys.properties");
            if (!resource.exists()) {
                throw new RuntimeException("RSA keys file not found: security/rsa-keys.properties");
            }
            try (InputStream is = resource.getInputStream()) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                byte[] buf = new byte[4096];
                int n;
                while ((n = is.read(buf)) != -1) {
                    baos.write(buf, 0, n);
                }
                String content = baos.toString(StandardCharsets.UTF_8.name());
                String pubSection;
                String priSection;
                int pubIdx = content.indexOf("publicKey=");
                int priIdx = content.indexOf("privateKey=");
                if (pubIdx == -1 || priIdx == -1) {
                    throw new RuntimeException("RSA keys file missing required fields: publicKey/privateKey");
                }
                pubSection = content.substring(pubIdx + "publicKey=".length(), priIdx);
                priSection = content.substring(priIdx + "privateKey=".length());
                String pub = sanitizeBase64(pubSection);
                String pri = sanitizeBase64(priSection);
                if (pub.isEmpty() || pri.isEmpty()) {
                    throw new RuntimeException("RSA keys are empty in rsa-keys.properties");
                }
                // Validate decodability
                Base64.getDecoder().decode(pub);
                Base64.getDecoder().decode(pri);
                publicKeySpkiBase64 = pub;
                privateKeyPkcs8Base64 = pri;
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to load RSA keys from file", e);
        }
    }

    private String sanitizeBase64(String raw) {
        if (raw == null) return "";
        String s = raw
            .replace("\"", "")
            .replace("“", "")
            .replace("”", "")
            .replace("'", "")
            .replace("\r", "")
            .replace("\n", "")
            .trim();
        // Remove any non-base64 characters except '='
        return s;
    }

    public String getPublicKeySpkiBase64() {
        return publicKeySpkiBase64;
    }

    public String decryptPKCS1(String cipherBase64) {
        try {
            byte[] priv = Base64.getDecoder().decode(privateKeyPkcs8Base64);
            PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(priv);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            PrivateKey privateKey = kf.generatePrivate(spec);
            // JSEncrypt uses PKCS1 v1.5 padding
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            byte[] ct = Base64.getDecoder().decode(cipherBase64);
            byte[] pt = cipher.doFinal(ct);
            return new String(pt, StandardCharsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException("Password decrypt failed", e);
        }
    }

    public String decryptOAEP256(String cipherBase64) {
        try {
            byte[] priv = Base64.getDecoder().decode(privateKeyPkcs8Base64);
            PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(priv);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            PrivateKey privateKey = kf.generatePrivate(spec);
            Cipher cipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-256AndMGF1Padding");
            OAEPParameterSpec oaep256 = new OAEPParameterSpec("SHA-256", "MGF1", MGF1ParameterSpec.SHA256, PSource.PSpecified.DEFAULT);
            cipher.init(Cipher.DECRYPT_MODE, privateKey, oaep256);
            byte[] ct = Base64.getDecoder().decode(cipherBase64);
            byte[] pt = cipher.doFinal(ct);
            return new String(pt, StandardCharsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException("Password decrypt failed");
        }
    }
}
