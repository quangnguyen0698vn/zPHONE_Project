package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;
import util.HashGenerationException;
import util.HashGeneratorUtils;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		//request.getSession(true).invalidate();

		// collect data from a login form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean rememberMe = request.getParameter("rememberMe") != null;

		HttpSession session = request.getSession(true);
		AccountDAO accountDAO = new AccountDAO();
		if (rememberMe) {
			// set cookie
			Cookie loginCookie = new Cookie("loggedInUser", email);
			// set life span... total number of seconds
			// I setup as 7 days
			loginCookie.setMaxAge(60 * 60 * 24 * 7);
			// send cookie to browser
			response.addCookie(loginCookie);
		}

		// encrupt the password
		try {
			password = HashGeneratorUtils.generateSHA256(password);
		} catch (HashGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Account account = accountDAO.login(email, password);
		if (email != null && account != null) {
			// set session
			session.setAttribute("email", email);
			session.setAttribute("address", account.getAddress());
			// login is valid, now redirect to index page of admin
			if (account.getRole() == 1) {
				response.sendRedirect("admin/index.jsp");
				return;
			}
			else {
				response.sendRedirect("home");
				return;
			}
		} else {
			session.setAttribute("error", "Wrong email or password. Please try again!");
			response.sendRedirect("login.jsp");
			return;
		}
	}
}
