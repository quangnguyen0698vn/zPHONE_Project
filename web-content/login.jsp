<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.getSession(true);
// Get the user object
String user = (String) session.getAttribute("user");
// if user is not null, redirect to the admin dashboard
if (user != null) {
	// request.getRequestDispatcher("admin/index.jsp").forward(request, response);
	response.sendRedirect("admin/index.jsp");
} else {
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
	if (cookie.getName().equals("loggedInUser")) {
		user = (String) cookie.getValue();
		// System.out.println("Cookie is loaded");
		break;
	}
		}
	}
	user = (user == null) ? "" : user;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ZPHone - Điện thoại giá rẻ</title>

<!-- Bootstrap and Font Awesome -->
<jsp:include
	page="common/cssFramework.jsp" />
<!-- My Own style -->
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/login-style.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- SIMPLE LOGIN FORM -->
	<main class="container mt-auto mb-auto">
		<div class="row gx-5">
			<div
				class="col-md-6 col-12 mb-3 d-flex align-items-center justity-content-center">
				<img
					src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
					alt="A Phone" class="img-fluid img-thumbnail d-block" />
			</div>

			<div class="col-md-6 col-12 mb-3">
				<div class="login-form bg-light mt-4 p-4">
					<form action="<%=request.getContextPath() + "/login"%>"
						method="POST" class="row g-3" id="loginForm">
						<h4>Welcome Back</h4>
						<div class="col-12">
							<label>Username</label> <input type="text" name="username"
								class="form-control" placeholder="Username" value="<%=user%>" />
						</div>
						<div class="col-12">
							<label>Password</label> <input type="password" name="password"
								class="form-control" placeholder="Password" />
						</div>
						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									name="rememberMe" /> <label
									class="form-check-label" for="rememberMe"> Remember me</label>
							</div>
						</div>
						<%
						String error = (String) session.getAttribute("error");
						if (error != null) {
							out.println("<div class=\"col-12\">");
							out.println("<p class=\"text-danger\">" + error + "</p>");
							out.println("</div>");
							session.setAttribute("error", null);
						}
						%>
						<div class="col-12">
							<button type="submit" class="btn btn-warning float-end">
								Login</button>
						</div>
					</form>
					<hr class="mt-4" />
					<div class="col-12">
						<p class="text-center mb-0">
							Have not account yet? <a href="#">Signup</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="footer.jsp" />

	<!-- Bootstrap, FontAweSome and Jquery script -->
	<jsp:include
		page="common/javascriptFramework.jsp" />
	<script src="js/login-app.js"></script>
</body>
</html>
