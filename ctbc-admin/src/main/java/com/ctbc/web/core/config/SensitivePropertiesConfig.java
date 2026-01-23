package com.ctbc.web.core.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = "classpath:security/env-config.properties", ignoreResourceNotFound = true)
public class SensitivePropertiesConfig {
}
