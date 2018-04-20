package com.cisau.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.cisau.common.constants.CommonConstants;

public class SessionFilter implements Filter {

private static final Logger LOGGER = LogManager.getLogger();
	
	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		// 请求的URI
		String uri = request.getRequestURI();
//		String referer = request.getHeader("Referer");
		String ajaxHeader = request.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);
//		LOGGER.info("SessionFilter-getRequestURI:" + request.getRequestURI());
//		LOGGER.info("SessionFilter-referer:" + referer);
//		LOGGER.info("SessionFilter-isAjax:" + isAjax);
		
		// 用户已经登录
		if (request.getSession().getAttribute(CommonConstants.LOGIN_USER) != null) {

			filterChain.doFilter(servletRequest, servletResponse);
			return;
		} else {
			// 用户未登录时，可以访问的页面URL，过滤掉
			List<String> exceptionURLs = new ArrayList<String>();
			exceptionURLs.add("login");
			exceptionURLs.add("register");
			exceptionURLs.add("web-resources");
			// 是否包含未登录也可访问的URL
			boolean hasRight = false;
			for (String exceptionURL : exceptionURLs) {
				if (uri.indexOf(exceptionURL) > -1) {
					hasRight = true;
				}
			}
			if (hasRight) {
				filterChain.doFilter(servletRequest, servletResponse);
				return;
			} else if(isAjax) {
				LOGGER.info("SessionFilter：用户未登录时，异步访问[" + uri + "]页面！");
				response.getWriter().write("session-invalidate");
			} else {
				// 用户未登录时，访问其他页面时，强制登录
				LOGGER.info("SessionFilter：用户未登录访问[" + uri + "]强制跳转到登录页面！");
				String path = request.getContextPath();
				response.sendRedirect(path + "/login");
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
	}
}
