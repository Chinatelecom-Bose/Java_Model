package com.ctbc;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * web容器中进行部署
 * 
 * @author ruoyi
 */
public class RuoYiServletInitializer extends SpringBootServletInitializer
{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application)
    {
        return application.sources(RuoYiApplication.class);
    }

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        throw new UnsupportedOperationException("Unimplemented method 'onStartup'");
    }
}
