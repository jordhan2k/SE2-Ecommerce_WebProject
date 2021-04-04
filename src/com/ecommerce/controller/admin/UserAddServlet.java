package com.ecommerce.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import com.ecommerce.service.impl.UserServiceImpl;

/**
 * @overview UserAddServlet is a controller servlet used to handle the use
 *           case of Adding a new User to the database
 * @author Tus
 *
 */
@WebServlet("/admin/user/add")
public class UserAddServlet extends HttpServlet{
	UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String eString = req.getParameter("e");
		if(eString != null) {
			if (eString.equals("1")) {
				req.setAttribute("errMsg", "Username existed");
			}
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/user-add.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		
		try {
			List<FileItem> items = servletFileUpload.parseRequest(req);
			for(FileItem item : items) {
				if(item.getFieldName().equals("email")) {
					user.setEmail(item.getString());
				}else if (item.getFieldName().equals("username")) {
					user.setUsername(item.getString());
				}else if (item.getFieldName().equals("fullname")) {
					user.setFullname(item.getString());
				}else if (item.getFieldName().equals("password")) {
					user.setPassword(item.getString());
				}else if (item.getFieldName().equals("mobile")) {
					user.setMobile(item.getString());
				}else if (item.getFieldName().equals("address")) {
					user.setAddress(item.getString());
				}else if (item.getFieldName().equals("gender")) {
					user.setGender(item.getString());
				}else if (item.getFieldName().equals("dob")) {
					user.setDob(Date.valueOf(item.getString()));
				}else if (item.getFieldName().equals("roleID")) {
					user.setRoleID(Integer.parseInt(item.getString()));
				}
			}
			
			userService.insertUser(user);
			
			resp.sendRedirect(req.getContextPath() + "/admin/user/list");
		}catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/admin/user/add?e=1");
		}
		
	}
	
	
	

}
