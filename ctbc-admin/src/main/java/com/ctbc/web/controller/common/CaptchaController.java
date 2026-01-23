package com.ctbc.web.controller.common;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.code.kaptcha.Producer;

import jakarta.annotation.Resource;

import com.ctbc.common.config.ProjectConfig;
import com.ctbc.common.constant.CacheConstants;
import com.ctbc.common.constant.Constants;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.core.redis.RedisCache;
import com.ctbc.common.utils.sign.Base64;
import com.ctbc.common.utils.uuid.IdUtils;
import com.ctbc.system.service.ISysConfigService;

/**
 * 验证码操作处理
 * 
 * @author ruoyi
 */
@RestController
public class CaptchaController
{
    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisCache redisCache;
    
    @Autowired
    private ISysConfigService configService;
    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode() {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled)
        {
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr, code;
        BufferedImage image;

        // 生成验证码
        String captchaType = ProjectConfig.getCaptchaType();
        if ("math".equals(captchaType))
        {
            String capText = captchaProducerMath.createText();
            capStr = capText.substring(0, capText.lastIndexOf("@"));
            code = capText.substring(capText.lastIndexOf("@") + 1);
            image = captchaProducerMath.createImage(capStr);
        }
        else if ("char".equals(captchaType))
        {
            capStr = code = captchaProducer.createText();
            image = captchaProducer.createImage(capStr);
        }
        else
        {
            // 默认使用字符验证码
            capStr = code = captchaProducer.createText();
            image = captchaProducer.createImage(capStr);
        }

        redisCache.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            if (image == null)
            {
                return AjaxResult.error("验证码生成失败");
            }
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e)
        {
            return AjaxResult.error("验证码生成失败: " + e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }
}
