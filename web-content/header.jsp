<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- NAVIGATION -->
<header class="bg-secondary flex-column">
	<!-- FIRST ROW  -->
	<div
		class="navbar navbar-expand-md navbar-dark flex-column bg-secondary py-2 mb-3">
		<div class="container py-2 mb-1">
			<div class="mb-2">
				<a href="<%=request.getContextPath()%>" class="navbar-brand"> <span><i
						class="fa-solid fa-mobile-screen fa-2x"></i></span> <span>ZPHone</span>
				</a>
			</div>

			<div class="d-flex flex-grow-1">
				<div class="dropdown">
					<button
						class="btn btn-outline-dark text-white dropdown-toggle text-capitalize"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<c:if test="${category == null}">Categories</c:if>
						<c:if test="${category != null}">${category}</c:if>
					</button>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="viewPage?category=apple">Apple</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="viewPage?category=samsung">Samsung</a></li>
						<li><a class="dropdown-item" href="viewPage?category=xiaomi">Xiaomi</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="viewPage">All Brands</a></li>
					</ul>
				</div>

				<form class="input-group">
					<c:if test="${category == null}">
						<input type="text" class="form-control" name="category" hidden />
					</c:if>
					<c:if test="${category != null}">
						<input type="text" class="form-control" name="category"
							value="${category}" hidden />
					</c:if>


					<input type="search" id="form1" class="form-control" name="keyword"
						placeholder="What are you looking for?" value="${keyword}" />

					<button type="submit" formmethod="GET" formaction="search"
						class="btn btn-primary">Search</button>
				</form>
			</div>


		</div>
	</div>

	<!-- SECOND ROW -->
	<nav class="navbar navbar-expand-md navbar-dark flex-column bg-dark">
		<div class="container">
			<button class="navbar-toggler ms-auto" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarBlock"
				aria-controls="navbarBlock" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse py-2" id="navbarBlock">
				<ul class="navbar-nav">
					<li class="nav-item align-self-center"><a href="home"
						class="navbar-brand invisible"> <i
							class="fa-solid fa-mobile-screen fa-2x"></i> ZPHone
					</a></li>
					<li class="nav-item p-1 align-self-center"><c:if
							test="${active == 'home'}">
							<a href="home" class="nav-link active">
						</c:if> <c:if test="${active != 'home'}">
							<a href="home" class="nav-link">
						</c:if> Home</a></li>
					<li class="nav-item p-1 align-self-center"><c:if
							test="${active == 'product'}">
							<a href="#" class="nav-link active">
						</c:if> <c:if test="${active != 'product'}">
							<a href="#" class="nav-link">
						</c:if> Products</a></li>
					<li class="nav-item p-1 align-self-center"><c:if
							test="${active == 'aboutus'}">
							<a href="aboutus" class="nav-link active">
						</c:if> <c:if test="${active != 'aboutus'}">
							<a href="aboutus" class="nav-link">
						</c:if> About us</a></li>
				</ul>
				<c:if test="${sessionScope.email == null}">
					<div class="ms-auto p-1">
						<a href="login.jsp" class="btn btn-success">Login</a>
					</div>
					<div class="p-1">
						<a href="#" class="btn btn-warning" data-bs-toggle="modal"
							data-bs-target="#addUserModal" id="openSignupForm"> Sign Up </a>
					</div>
				</c:if>
				
				<c:if test="${sessionScope.email != null}">
					<div class="ms-auto p-1 text-white">
						<i class="fas fa-user"></i> Welcome ${sessionScope.email}
					</div>
					<div class="p-1">
						<a href="logout" class="btn btn-warning">Logout</a>
					</div>
				</c:if>

			</div>
		</div>
	</nav>
</header>