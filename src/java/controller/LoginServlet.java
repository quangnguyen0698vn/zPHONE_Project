package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginServlet() {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		
		request.getSession(true).invalidate();

		// collect data from a login form
		String user = request.getParameter("username");
		String password = request.getParameter("password");
		boolean rememberMe = request.getParameter("rememberMe") != null;

		Account account = new Account();
		account.setName(user);
		account.setPwd(password);
		
		// make sure that email is valid
		String regexMail = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
		String regexPassword = "[a-zA-Z0-9_!@#$%^&*]+";
		HttpSession session = request.getSession(true);
		
		
		if (!password.matches(regexPassword) || !user.matches(regexMail)) {
			session.setAttribute("error", "invalid syntax");
			response.sendRedirect("login.jsp");
			return;
		}
		
		// read information of account in web.xml
		String uid = getServletContext().getInitParameter("username");
		String pwd = getServletContext().getInitParameter("password");
		
		if (user != null && account.getPwd().equals(pwd) && account.getName().equalsIgnoreCase(uid)) {
			if (rememberMe) {
				// set cookie
				Cookie loginCookie = new Cookie("loggedInUser", user);
				// set life span... total number of seconds
				// set 120s for easily testing the app
				loginCookie.setMaxAge(60*2);
				// send cookie to browser
				response.addCookie(loginCookie);
			}
			// set session
			session.setAttribute("user", user);
			// login is valid, now redirect to index page of admin
			response.sendRedirect("admin/index.jsp");
			return;
		} else {
			session.setAttribute("error", "Wrong username or password. Please try again!");
			response.sendRedirect("login.jsp");
			return;
		}
	}
}
