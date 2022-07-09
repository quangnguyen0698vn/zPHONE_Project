package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignupServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		// get data from signUpForm
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String originalPassword = password;
		// encrypt the password
		try {
			password = HashGeneratorUtils.generateSHA256(password);
		} catch (HashGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		// if email is not duplicated
		AccountDAO accountDAO = new AccountDAO();
		if (!accountDAO.checkDuplicatedEmail(email)) {
			accountDAO.createAccount(email, password, name, address, phone);
			request.setAttribute("email", email);
			request.setAttribute("password", originalPassword);
			request.getRequestDispatcher("login").forward(request, response);
		} else {
			String message = "The account with email '" +
					email + "' is already exist! Cannot create new account!";
			request.setAttribute("errorMessage", message);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	}
}
