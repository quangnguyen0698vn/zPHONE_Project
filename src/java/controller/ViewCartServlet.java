package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ViewCartServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(true);
			if (session.getAttribute("cart") == null) {
				session.setAttribute("cart", new Cart());
			}
				
			Cart cart = (Cart) session.getAttribute("cart");
			
			request.setAttribute("items", cart.getItems());
			request.setAttribute("totalAmount", cart.getAmount());
			request.setAttribute("totalQuantity", cart.getQuantity());
			request.getRequestDispatcher("viewCart.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
