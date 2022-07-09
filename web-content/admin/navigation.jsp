<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
  <div class="container">
    <a href="<%=request.getContextPath()%>" class="navbar-brand">Zphone</a>
    <button
      class="navbar-toggler"
      data-bs-toggle="collapse"
      data-bs-target="#navbarCollapse"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div
      class="collapse navbar-collapse justify-content-between"
      id="navbarCollapse"
    >
      <ul class="navbar-nav">
        <li class="nav-item px-2">
          <a href="home" class="nav-link active">Dashboard</a>
        </li>

        <li class="nav-item px-2">
          <a href="products.jsp" class="nav-link">Products</a>
        </li>

        <li class="nav-item px-2">
          <a href="users.jsp" class="nav-link">Users</a>
        </li>
      </ul>

      <ul class="navbar-nav">
        <li class="nav-item dropdown mr-3">
          <a
            href="#"
            class="nav-link dropdown-toggle"
            data-bs-toggle="dropdown"
          >
            <i class="fas fa-user"></i> Welcome <%= (String) session.getAttribute("email") %>
          </a>
        </li>
        <li class="nav-item">
          <a href="<%=request.getContextPath()%>/logout" class="nav-link">
            <i class="fas fa-user-times"></i> Logout
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

