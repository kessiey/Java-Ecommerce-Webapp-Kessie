package com.learn.servlets;

import java.io.IOException;


import java.io.PrintWriter;
import java.net.URLEncoder;

import com.learn.Dao.UserDao;
import com.learn.entities.User;
import com.learn.helper.FactoryProvider;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out= response.getWriter()){
		String email= request.getParameter("email");
		String password= request.getParameter("pass");
		UserDao userdao= new UserDao(FactoryProvider.getFactory());
		User user= userdao.getUserByEmailandPassword(email, password);
		HttpSession httpsession= request.getSession();
		
		if(user== null) {
			httpsession.setAttribute("message", "Invalid details. Try Again!");
			response.sendRedirect("login.jsp");
			return;
			
		}
		else {
			 
			    if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				else if (user.getUserType().equals("normal")) {
					String message = "Login successful. Welcome " + user.getUserName();
				    response.sendRedirect("loggedin.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
				    return;
				   
				   
				}else {
					System.out.println("Unidentified");
				}
           }
		HttpSession httpSession= request.getSession();
		httpSession.setAttribute("current-user", user);
		
	} catch(Exception e) {
		
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
