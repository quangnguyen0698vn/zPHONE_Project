<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ZPHone - Điện thoại giá rẻ - Thông tin sản phẩm</title>
<!-- Bootstrap and Font Awesome -->
<jsp:include page="common/cssFramework.jsp" />
<!-- My Own style -->
<link rel="stylesheet" href="css/style.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="header.jsp" />

	<!-- MAIN -->
	<main class="container mt-auto">
		<h2 class="m-5 text-center">${product.name}</h2>
		<div class="row align-items-center justity-content-center">
			<div class="offset-md-2 col-md-4 col-12 mb-5 text-md-end text-center">
				<img
					src="${product.src}"
					class="img-fluid align-middle">
			</div>
			<div class="col-md-6 col-12 text-md-start text-center mb-3">
				<h3 class="text-danger m-2">$ ${product.price}</h3>
				<div style="white-space: pre-line;">
					${product.description}
				</div>
			</div>
		</div>
	</main>

	<!-- FOOTER -->

	<div class="mt-auto">
		<jsp:include page="footer.jsp" />
	</div>

	<!-- SCRIPT -->
	<!-- Bootstrap, FontAweSome and Jquery script -->
	<jsp:include
		page="common/javascriptFramework.jsp" />
</body>
</html>
