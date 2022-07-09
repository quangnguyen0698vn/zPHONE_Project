<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<main class="container py-3">
	<c:if test="${paymentSuccess != null}">
		<p class="text-success">${paymentSuccess}</p>
	</c:if>
	<c:if test="${errorMessage != null}">
		<p class="text-danger">${errorMessage}</p>
	</c:if>
	<h2 class="display-5 pb-3">${message}</h2>
	<div class="row gx-5">
		<section class="col-lg-9 col-md-12">
			<div class="row gx-4">
				<c:forEach items="${products}" var="product" varStatus="status">
					<div class="col-lg-4 col-md-4 col-sm-6 pb-5">
						<div class="card">
							<a href="viewProduct?id=${product.id}"> <img
								src="${product.src}" alt="${product.name}"
								class="img-fluid card-img-top" />
							</a>
						</div>
						<div class="card-body">
							<h5 class="card-title text-muted text-uppercase">${product.type}</h5>
							<h6 class="card-subtitle mb-3 text-primary">
								<a href="viewProduct?id=${product.id}"
									class="text-decoration-none"> ${product.name} </a>
							</h6>
							<h6 class="card-subtitle mb-2 text-danger">$
								${product.price}</h6>
							<p class="text-end">
								<a href="addToCart?id=${product.id}&action=add"
									class="btn btn-primary btn-sm">Add To Cart</a>
							</p>
						</div>
					</div>
				</c:forEach>

				<c:if test="${category == null}">
					<c:set var="cat" value=""></c:set>
				</c:if>
				<c:if test="${category != null}">
					<c:set var="cat" value="&category=${category}"></c:set>
				</c:if>

				<c:if test="${keyword == null}">
					<c:set var="key" value=""></c:set>
				</c:if>
				<c:if test="${keyword != null}">
					<c:set var="key" value="&keyword=${keyword}"></c:set>
				</c:if>
				<!-- PAGINATION -->
				<c:if test="${numberOfRecords > 0}">
					<nav aria-label="Search results pages" class="row m-3">
						<ul class="pagination">
							<c:if test="${currentPage == 1}">
								<li class="page-item disabled"><a href="#"
									class="page-link">Previous</a></li>
							</c:if>

							<c:if test="${currentPage > 1}">
								<li class="page-item"><a
									href="${action}?page=${currentPage-1}${cat}${key}"
									class="page-link">Previous</a></li>
							</c:if>

							<c:forEach var="i" begin="1" end="${numberOfPages}" step="1">
								<c:if test="${i == currentPage}">
									<li class="page-item active" aria-current="page"><a
										href="${action}?page=${i}${cat}${key}" class="page-link">
											${i} <span class="visually-hidden">(current)</span>
									</a></li>
								</c:if>
								<c:if test="${i != currentPage}">
									<li class="page-item"><a
										href="${action}?page=${i}${cat}${key}" class="page-link">${i}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${currentPage == numberOfPages}">
								<li class="page-item disabled"><a href="#"
									class="page-link">Next</a></li>
							</c:if>

							<c:if test="${currentPage < numberOfPages}">
								<li class="page-item"><a
									href="${action}?page=${currentPage+1}${cat}${key}"
									class="page-link">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</c:if>
		</section>

		<!-- ADD USER MODAL -->
		<jsp:include page="signUpForm.jsp" />
		
		<aside class="col-lg-3 col-md-12">
			<div class="card shopping-cart mb-5">
				<div class="card-body">
					<h5 class="card-title">Shopping Cart</h5>
					<p class="card-text">Please click the button below to see the
						detailed list and check-out</p>
				</div>
				<!-- 
				<ul class="list-group list-group-flush">
					<li class="list-group-item">An item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
				</ul>
				 -->
				<div class="card-body">
					<a href="viewCart" class="btn btn-success card-link">Check Out</a>
				</div>
			</div>

			<!-- BELOW FUNCTION ARE NOT IN DEVELOPMENT YET -->
			<!-- 
			<div class="card top-product mb-2">
				<div class="card-body">
					<h5 class="card-title">Top Products: </h5>
				</div>
				<div class="container">
					<div class="row">
						<div class="card col-lg-12 col-md-6">
							<img
								src="https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg"
								alt="A Mobile Phone" class="img-best-seller card-img-top mt-3" />
							<div class="card-body text-center">
								<h5 class="card-title text-muted">Cellphone</h5>
								<h6 class="card-subtitle mb-3 text-primary"><a>iPhone Xs 64GB
								</h6>
							</div>
						</div>

						<div class="card col-lg-12 col-md-6">
							<img
								src="https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg"
								alt="A Mobile Phone" class="img-best-seller card-img-top mt-3" />
							<div class="card-body text-center">
								<h5 class="card-title text-muted">Cellphone</h5>
								<h6 class="card-subtitle mb-3 text-primary">iPhone Xr 128GB
								</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			 -->
	</div>
	</aside>
	</div>
</main>