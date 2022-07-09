<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ZPHone - Điện thoại giá rẻ</title>
<!-- Bootstrap and Font Awesome -->
<jsp:include page="common/cssFramework.jsp" />
<!-- My Own style -->
<link rel="stylesheet" href="css/style.css" />
</head>
<body class="d-flex flex-column min-vh-100">

	<jsp:include page="header.jsp" />

	<jsp:include page="body.jsp" />

	<div class="mt-auto">
		<jsp:include page="footer.jsp" />
	</div>

	<!-- SCRIPT -->
	<!-- Bootstrap, FontAweSome and Jquery script -->
	<jsp:include page="common/javascriptFramework.jsp" />

	<!-- JQuery Validator -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
		integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<!-- Validate Sign Up Form -->
	<script src="js/signup-app.js"></script>

</body>
</html>
