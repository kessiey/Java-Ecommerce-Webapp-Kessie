package com.learn.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.entities.User;
import com.learn.helper.FactoryProvider;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	response.setContentType("text/html;charset=UTF-8");
    	try (PrintWriter out = response.getWriter()) {
				String userName= request.getParameter("user_name");
				String userPassword= request.getParameter("user_pass");
				String userEmail= request.getParameter("user_email");
				String userPhone= request.getParameter("user_phone");
				String userAddress= request.getParameter("user_address");
				
				User user= new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress);
				Session hibernateSession= FactoryProvider.getFactory().openSession();
				Transaction tx= hibernateSession.beginTransaction();
				int userId= (int) hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
				HttpSession httpSession = request.getSession();
	            httpSession.setAttribute("message", "Registration successful!");

	            // Redirect to login.jsp after successful registration
	            response.sendRedirect("commonfile.jsp");
				
			}catch(Exception e) {
				e.printStackTrace();
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
