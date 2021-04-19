package com.ecommerce.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.User;

/**
 * Servlet Filter implementation class AdminSecurity
 */
@WebFilter("/admin/*")
public class AdminSecurity implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("account");
		
		if(user != null && user.getRoleID() ==1) {
			chain.doFilter(request, response);
		}else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
		
		
	}

	

}
