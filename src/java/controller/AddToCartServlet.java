package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Cart;
import model.Product;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			HttpSession session = request.getSession(true);
			String idStr = request.getParameter("id");
			String action = request.getParameter("action");
			
			Cart cart = null;
			if (action != null) {
				if (session.getAttribute("cart") == null) {
					session.setAttribute("cart", new Cart());
				}
				int id = Integer.parseInt(idStr);
				cart = (Cart) session.getAttribute("cart");
				
				if (action.equalsIgnoreCase("add")) {
					Product product = new ProductDAO().getProduct(id);
					cart.add(Product.oneItemOf(product));
				}
				
				if (action.equalsIgnoreCase("remove")) {
					cart.remove(id);
				}
			}
			
			response.sendRedirect("viewCart");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
