<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ZPHone - Điện thoại giá rẻ - Xem giỏ hàng</title>
<!-- Bootstrap and Font Awesome -->
<jsp:include page="common/cssFramework.jsp" />
<!-- My Own style -->
<link rel="stylesheet" href="css/style.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="header.jsp" />

	<main class="container mt-auto mb-5 pb-5">
		<h2 class="m-3 text-center">Your Cart:</h2>

		<table class="table table-striped table-hover table-responsive mb-5">
			<thead>
				<tr>
					<td>Product Name</td>
					<td>Price</td>
					<td>Quantity</td>
					<td>Amount</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${items}" var="item">
					<tr>
						<td>${item.name}</td>
						<td>${item.price}</td>
						<td>${item.number}</td>
						<td><fmt:formatNumber maxFractionDigits="2"
								value="${item.price * item.number}" /></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">Total:</td>
					<td>${totalQuantity}</td>
					<td>${totalAmount}</td>
				</tr>
			</tfoot>
		</table>

		<h2 class="m-3 text-center">Your Information:</h2>

		<div class="row">
			<div class="col-md-10 offset-md-1 col-12">
				<form id="orderForm">
					<div class="input-group">
						<div class="input-group-prepend col-md-4">
							<span class="input-group-text col-12">Your Email:</span>
						</div>
						<c:if test="${sessionScope.email == null}">
							<input type="email" name="email" class="form-control"
								placeholder="Enter Your Email" />
						</c:if>
						<c:if test="${sessionScope.email != null}">
							<input type="email" name="email" class="form-control"
								value="${sessionScope.email}" placeholder="Enter Your Email" />
						</c:if>
					</div>

					<div class="input-group">
						<div class="input-group-prepend col-md-4">
							<span class="input-group-text col-12">Your Address:</span>
						</div>
						<c:if test="${sessionScope.address == null}">
							<input type="text" name="address" class="form-control"
								placeholder="Enter Your Address" />
						</c:if>
						<c:if test="${sessionScope.address != null}">
							<input type="text" name="address" class="form-control"
								value="${sessionScope.address}" placeholder="Enter Your Address" />
						</c:if>
					</div>

					<div class="input-group">
						<div class="input-group-prepend col-md-4">
							<span class="input-group-text col-12">Your Discount Code:</span>
						</div>
						<input type="text" name="discountCode" class="form-control"
							placeholder="Enter Your Discount Code (If Any)" />
					</div>

					<div class="d-flex">
						<a href="javascript: history.go(-1)"
							class="btn btn-primary btn-lg mt-4"> Back to SHOP more! </a>

						<button type="submit" class="btn btn-success btn-lg mt-4 ms-auto"
							formmethod="POST" formaction="pay">Pay NOW!</button>
					</div>

				</form>
			</div>
		</div>
	</main>

	<!-- FOOTER -->

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
	<script>
		$(document).ready(function() {
			$("#orderForm").validate({
				rules : {
					email : {
						required : true,
						email : true,
					},
					address : {
						required : true
					}
				},

				messages : {
					email : {
						required : "Email cannot be empty",
						email : "Wrong Email Syntax",
					},
					address : "Address cannot be empty",
				}
			});
		});
	</script>
</body>
</html>
