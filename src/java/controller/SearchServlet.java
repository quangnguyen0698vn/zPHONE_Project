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

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		if (category != null && category.equals("")) category = null;
		
		String destPage = "home.jsp";
		ProductDAO productDAO = new ProductDAO();
		String pageStr = request.getParameter("page");

		int page = 1;
		if (pageStr != null) {
			page = Integer.parseInt(pageStr);
		}

		int itemsPerPage = 6;
		int numberOfRecords = 0;
		if (category != null) {
			numberOfRecords = productDAO.getSearchWithBrandResultSize(keyword, category);
		} else {
			numberOfRecords = productDAO.getSearchResultSize(keyword);
		}
		int numberOfPages = (numberOfRecords - 1) / itemsPerPage + 1;
		int start = (page - 1) * itemsPerPage + 1;
		int end = Math.min(numberOfRecords, itemsPerPage * page);

		List<Product> products = null;
		if (category != null) {
			products = productDAO.searchProductsWithBrand(start, end, keyword, category);
		} else {
			products = productDAO.searchProducts(start, end, keyword);
		}

//		System.out.println("category = " + category);
//		System.out.println("page = " + page);
//		System.out.println("Number of Records: " + numberOfRecords);
//		System.out.println("Number of Pages: " + numberOfPages);
//		System.out.println("Product's size: " + products.size());
		
		String message = "Search Result with keyword: '" + keyword + "'";
		if (products.isEmpty()) {
			System.out.println("No results");
			message = "<span class=\"text-danger\">No Products Contain '" + keyword + "' in its name !</span>";
		} else {
			if(category != null) {
				message += " in the '"+ category.substring(0,1).toUpperCase() + category.substring(1) + "' collection: ";
			}
		}
		
		request.setAttribute("action", "search");
		request.setAttribute("active", "home");
		request.setAttribute("keyword", keyword);
		request.setAttribute("message", message);
		request.setAttribute("products", products);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", page);
		request.setAttribute("category", category);
		request.setAttribute("numberOfRecords", numberOfRecords);
		request.getRequestDispatcher(destPage).forward(request, response);
	}
}

