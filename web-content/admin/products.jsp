<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap and Fontawesome -->
    <jsp:include page='../common/cssFramework.jsp'/>
<!-- My Own style -->
<link rel="stylesheet" href="..css/admin-style.css" />
<title>ZPHone Dashboard - Products</title>
</head>

<body class="d-flex flex-column min-vh-100">

	<!-- NAVIGATION -->
	<jsp:include page="navigation.jsp" />

	<!-- HEADER -->
	<header id="main-header" class="py-2 bg-primary text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>
						<i class="fas fa-pencil-alt"></i> Products
					</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- SEARCH -->
	<section id="search" class="py-4 mb-4 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-6">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search Products..." />
						<div class="input-group-append">
							<button class="btn btn-primary">Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- PRODUCTS -->
	<section id="products">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-header">
							<h4>Latest Products</h4>
						</div>
						<div class="table-responsive">
							<table class="table table-striped table-hover">
								<thead class="thead-dark">
									<tr>
										<th class="align-middle">#</th>
										<th class="align-middle">Product Name</th>
										<th class="align-middle">Product Price</th>
										<th class="align-middle">Product Type</th>
										<th class="align-middle">Product Brand</th>
										<th class="align-middle">Date</th>
										<th class="align-middle"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="align-middle">1</td>
										<td class="align-middle">iPhone 11 Pro Max 512GB</td>
										<td class="align-middle">43.99</td>
										<td class="align-middle">cellphone</td>
										<td class="align-middle">Apple</td>
										<td class="align-middle">July 5 2022</td>
										<td class="align-middle"><a href="#"
											class="btn btn-secondary" data-bs-toggle="modal"
											data-bs-target="#addPostModal">
												<i class="fas fa-pencil-alt"></i> Edit
										</a></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- PAGINATION -->
						<nav class="ml-4">
							<ul class="pagination">
								<li class="page-item disabled"><a href="#"
									class="page-link">Previous</a></li>
								<li class="page-item active"><a href="#" class="page-link">1</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">2</a></li>
								<li class="page-item"><a href="#" class="page-link">3</a></li>
								<li class="page-item"><a href="#" class="page-link">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- MODALS -->

	<!-- ADD PRODUCT MODAL -->
	<jsp:include page="addProductModal.jsp" />

	<!-- FOOTER -->
	<jsp:include page="footer.jsp" />
	<!-- Bootstrap, FontAweSome and Jquery script -->
	<jsp:include
		page='../common/javascriptFramework.jsp' />

	<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

	<script>
		CKEDITOR.replace("editor1");
	</script>

</body>
</html>
