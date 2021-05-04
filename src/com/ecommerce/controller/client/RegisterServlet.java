package com.ecommerce.controller.client;

import java.io.IOException;
import java.sql.Date;

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
import com.ecommerce.tools.MailTools;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
		
		//Check session
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("account") != null) {
			resp.sendRedirect(req.getContextPath() + "/waiting");
			return;
		}
		
		//Check cookies
		Cookie[] cookies = req.getCookies();
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
		
		///Redirect to register page
		resp.sendRedirect(req.getContextPath() +"/login");
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String fullname = req.getParameter("fullname");
			String mobile = req.getParameter("mobile");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			String gender = req.getParameter("gender");
			System.out.println("hihi" + username);
			Date dob = Date.valueOf(req.getParameter("dob"));
			
			UserService service = new UserServiceImpl();
			String alertMsg = "";
			
			if(service.checkExistUsername(username)) {
				alertMsg = "Username alredy exist!";
				req.setAttribute("alerrt", alertMsg);
				req.getRequestDispatcher("/view/customer/login.jsp").forward(req, resp);
			}
			
			if(service.checkExistEmail(email)) {
				alertMsg = "Email alredy exist!";
				req.setAttribute("alerrt", alertMsg);
				req.getRequestDispatcher("/view/customer/login.jsp").forward(req, resp);
			}
			
			if(service.checkExistMobile(mobile)) {
				alertMsg = "Phone number alredy exist!";
				req.setAttribute("alerrt", alertMsg);
				req.getRequestDispatcher("/view/customer/login.jsp").forward(req, resp);
			}
			
			boolean isSuccess = service.register(username, password, fullname, mobile, email, address, gender, dob);
			
			if(isSuccess) {
				MailTools mail = new MailTools();
				String text = "<h4>Dear "+ fullname+ ",</h4>"
							+ "<p>Thank you for joining Lapeki Store. Wish you have nice time with us</p>"
							+ "<p>Our best, <br>"
							+ "Lapeki Team</p>";
				mail.sendMail(email, "Lapeka Shop", text);
				req.setAttribute("alert", alertMsg);
				resp.sendRedirect(req.getContextPath() + "/login");
			}else {
				alertMsg = "System error";
				req.setAttribute("alerrt", alertMsg);
				req.getRequestDispatcher("/view/customer/register.jsp").forward(req, resp);
			}
	}
}
