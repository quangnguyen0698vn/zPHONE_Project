package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import model.Cart;
import model.Order;
import model.OrderDetail;

@WebServlet("/pay")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public PayServlet() {
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("this pay servlet is called");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession(true);
			if (session.getAttribute("cart") == null) {
				response.sendRedirect("home");
				return;
			}
			Cart cart = (Cart) session.getAttribute("cart");			
			String discountCode = request.getParameter("discount");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			
			Order order = new Order();
			order.setAddress(address);
			order.setDiscountCode(discountCode);
			order.setUserEmail(email);
					
			OrderDAO orderDAO = new OrderDAO();
			
			orderDAO.placeOrder(order, cart);
			
			session.setAttribute("cart", null);
			response.sendRedirect("home?payment=success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
