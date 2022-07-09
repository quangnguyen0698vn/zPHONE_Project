<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ZPHone - Điện thoại giá rẻ - About us</title>
<!-- Bootstrap and Font Awesome -->
<jsp:include page="common/cssFramework.jsp" />
<!-- My Own style -->
<link rel="stylesheet" href="css/style.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="header.jsp" />

	<!-- MAIN -->
	<main class="container mt-auto">
		<h2 class="m-5 text-center">ZPHONE - Điện thoại giá rẻ</h2>
		<p style="white-space: pre-line;" class="text-center">
			Đây là Project thuộc bài Assignment 03 
			Xây dựng một website bán điện thoại với những tính năng cơ bản
			Môn học Java Web Development (aka. PRJ321x_02_VN Phát triển ứng dụng Web)
			Chứng chỉ Doanh Nghiệp
			Sinh viên: Nguyễn Ngọc Quang
			All rights reserved. 
		</p>
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
