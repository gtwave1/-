package com.zeroPoint.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class UserProFileFilter
 */
public class UserProFileFilter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String name = (String) req.getSession().getAttribute("sessionUser");
		if(name != null){
			chain.doFilter(request, response);
			return;
		}
		name = (String) req.getSession().getAttribute("sessionZeroPoint");
		if(name != null){
			chain.doFilter(request, response);
			return;
		}
		name = (String) req.getSession().getAttribute("sessionAdmin");
		if(name != null){
			chain.doFilter(request, response);
		}else{
			req.getRequestDispatcher("/welcome.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
