package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/viewProduct")
public class ViewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewProductServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String destPage = "product.jsp";
		ProductDAO productDAO = new ProductDAO();
		Product item = productDAO.getProduct(id);
		
		request.setAttribute("product", item);
		request.setAttribute("active", "product");
		request.getRequestDispatcher(destPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
