package com.netbiscuits.mvcdemo.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class DeviceTypeFilter implements Filter {
    private final static String NETBISCUITS_IS_DESKTOP_HEADER = "X-DeviceParam-DeviceIsDesktopBrowser";
    private final static String NETBISCUITS_CAN_TACTILE_HEADER = "X-DeviceParam-TactileCanTactile";
    public FilterConfig filterConfig;
    
    public void doFilter(final ServletRequest request, final ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hsr = (HttpServletRequest)request;

        if (isHeaderSetToTrue(hsr.getHeader(NETBISCUITS_IS_DESKTOP_HEADER))) {
            request.setAttribute("presentationType", "html");
        } else if (isHeaderSetToTrue(hsr.getHeader(NETBISCUITS_CAN_TACTILE_HEADER))) {
            request.setAttribute("presentationType", "tactile");
        } else {
            request.setAttribute("presentationType", "biscuitml");
        } 
               
        chain.doFilter(request, response);     
    }
    
    public void init(final FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }
    
    public void destroy() {
    }   
    
    private boolean isHeaderSetToTrue(String headerValue) {
        return (headerValue == null ? false : headerValue.equalsIgnoreCase("true"));
    }
}
