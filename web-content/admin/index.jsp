<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="cssFramework.jsp"/>
    <title>ZPHone Dashboard</title>
  </head>

  <body class="d-flex flex-column min-vh-100">
    
    <!-- NAVIGATION -->
    <jsp:include page="navigation.jsp" />
    
	<!-- HEADER -->
	<header id="main-header" class="py-2 bg-primary text-white">
	  <div class="container">
	    <div class="row">
	      <div class="col-md-6">
	        <h1><i class="fas fa-cog"></i>Dashboard</h1>
	      </div>
	    </div>
	  </div>
	</header>
	
    <!-- ACTIONS -->
    <section id="actions" class="py-4 mb-4 bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 mb-2">
            <a
              href="#"
              class="btn btn-primary btn-block"
              data-bs-toggle="modal"
              data-bs-target="#addPostModal"
            >
              <i class="fas fa-plus"></i> Add Product
            </a>
          </div>

          <div class="col-lg-8 text-end">
            <a
              href="#"
              class="btn btn-warning btn-block"
              data-bs-toggle="modal"
              data-bs-target="#addUserModal"
            >
              <i class="fas fa-plus"></i> Add User
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- PRODUCTS -->
    <section id="products">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 col-12 mb-5">
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
                      <td class="align-middle">
                        <a
                          href="#"
                          class="btn btn-secondary"
                          data-bs-toggle="modal"
                          data-bs-target="#addPostModal"
                        >
                          <i class="fas fa-pencil-alt"></i> Edit
                        </a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-12">
            <div class="card text-center bg-primary text-white mb-3">
              <div class="card-body">
                <h3>Products</h3>
                <h4 class="display-4"><i class="fas fa-pencil-alt"></i> 1</h4>
                <a href="posts.html" class="btn btn-outline-light btn-sm"
                  >View</a
                >
              </div>
            </div>

            <div class="card text-center bg-warning text-white mb-3">
              <div class="card-body">
                <h3>Users</h3>
                <h4 class="display-4"><i class="fas fa-users"></i> 2</h4>
                <a href="users.html" class="btn btn-outline-light btn-sm"
                  >View</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- FOOTER -->
    <jsp:include page="footer.jsp"/>

    <!-- MODALS -->

    <!-- ADD PRODUCT MODAL -->
    <jsp:include page="addProductModal.jsp" />

    <!-- ADD USER MODAL -->
    <jsp:include page="addUserModal.jsp" />

    <!-- Bootstrap, FontAweSome and Jquery script -->
    <jsp:include page="javascriptFramework.jsp"/>

    <script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

    <script>
      CKEDITOR.replace("editor1");
    </script>
  </body>
</html>
