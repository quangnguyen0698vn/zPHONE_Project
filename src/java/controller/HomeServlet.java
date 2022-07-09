package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet({ "", "/viewPage", "/home" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destPage = "home.jsp";
		ProductDAO productDAO = new ProductDAO();
		String pageStr = request.getParameter("page");
		String category = request.getParameter("category");

		int page = 1;
		if (pageStr != null) {
			page = Integer.parseInt(pageStr);
		}

		int itemsPerPage = 6;
		int numberOfRecords = 0;
		if (category != null) {
			numberOfRecords = productDAO.getNumberOfRecordsWithBrand(category);
		} else {
			numberOfRecords = productDAO.getNumberOfRecords();
		}
		int numberOfPages = (numberOfRecords - 1) / itemsPerPage + 1;
		int start = (page - 1) * itemsPerPage + 1;
		int end = Math.min(numberOfRecords, itemsPerPage * page);

		List<Product> products = null;
		if (category != null) {
			products = productDAO.getProductsWithBrand(start, end, category);
		} else {
			products = productDAO.getProducts(start, end);
		}

		System.out.println("category = " + category);
		System.out.println("page = " + page);
		System.out.println("Number of Records: " + numberOfRecords);
		System.out.println("Number of Pages: " + numberOfPages);
		System.out.println("Product's size: " + products.size());
		
		String message = "List Products: ";
		if (numberOfRecords == 0) {
			message = "No Products Found! Maybe there's a problem with database";
		}
		
		request.setAttribute("action", "viewPage");
		request.setAttribute("active", "home");
		request.setAttribute("message", message);
		request.setAttribute("products", products);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", page);
		request.setAttribute("category", category);
		request.setAttribute("numberOfRecords", numberOfRecords);
		
		if (request.getParameter("payment") != null) {
			String result = request.getParameter("payment");
			if (result.equals("success")) {
				String paymentSuccess = "Your payment has been aprroved! Now you can continue shopping...";
				request.setAttribute("paymentSuccess", paymentSuccess);
			}
		}
		
		request.getRequestDispatcher(destPage).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	
	
}
