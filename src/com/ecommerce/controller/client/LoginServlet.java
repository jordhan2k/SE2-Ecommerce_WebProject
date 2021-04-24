package com.ecommerce.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import com.ecommerce.service.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
	
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("account") != null) {
			resp.sendRedirect(req.getContextPath() + "/waiting");
			return;
		}
		
		//Check cookie for remember me 
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			System.out.println("doGet " + cookies.length);
		}
		
		if(cookies != null) { //if cookies exist
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("username")) { 
					String username = cookie.getValue(); //get cookie value
					session = req.getSession(true);
					session.setAttribute("account", userService.getUserByUsername(username)); //add new session
					resp.sendRedirect(req.getContextPath() +  "/waiting");
					return;
				}
			}
		}
		
		//if session and cookies do not exist, redirect to login page
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/customer/login.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String alertMsg = "";
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		boolean isRememberMe = false;
		String remember = req.getParameter("remember");
  
		System.out.println(remember);
		if(remember != null && remember.equals("on")) {
			isRememberMe = true;
		}
		
		if(username.isEmpty() || password.isEmpty()) {
			alertMsg ="Username and password can't be empty!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/view/client/login.jsp").forward(req, resp);
		}
		
		UserService userService = new UserServiceImpl();
		
		User user = userService.login(username, password);
		
		if (user != null) {
			HttpSession session = req.getSession(true);
			session.setAttribute("account", user);
			System.out.println("doPost: Session");
			System.out.println("doPost: "+ isRememberMe);
			if(isRememberMe) {
				saveRememberMe(resp, username);
			}
			resp.sendRedirect(req.getContextPath() + "/waiting");
		} else {
			alertMsg = "Wrong username or password";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/view/client/login.jsp").forward(req, resp);
			
		}
		
	}
	
	private void saveRememberMe(HttpServletResponse resp, String username) {
		Cookie cookie = new Cookie("username", username);
		System.out.println("saveRememberMe: " + cookie.getName());
		cookie.setMaxAge(60*60);
		resp.addCookie(cookie);
	}
	
}
