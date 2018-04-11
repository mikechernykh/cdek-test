package dev.chernykh.delivery.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInit extends AbstractAnnotationConfigDispatcherServletInitializer {
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }
    
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{AppConfig.class};
    }
    
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
