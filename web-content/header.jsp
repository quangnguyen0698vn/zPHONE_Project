<!-- NAVIGATION -->
    <header class="bg-secondary flex-column">
      <!-- FIRST ROW  -->
      <div
        class="navbar navbar-expand-md navbar-dark flex-column bg-secondary py-2 mb-3"
      >
        <div class="container py-2 mb-1">
          <div class="mb-2">
            <a href="home.jsp" class="navbar-brand">
              <span><i class="fa-solid fa-mobile-screen fa-2x"></i></span>
              <span>ZPHone</span>
            </a>
          </div>
          <div class="input-group">
            <button
              class="btn btn-outline-dark text-white dropdown-toggle"
              type="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Categories
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">iPhone</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#">Samsung</a></li>
              <li><a class="dropdown-item" href="#">Xiaomi</a></li>
            </ul>
            <input
              type="search"
              class="form-control"
              placeholder="What are you looking for?"
              aria-label="Search input"
            />
            <button type="submit" class="btn btn-primary">Search</button>
          </div>
        </div>
      </div>

      <!-- SECOND ROW -->
      <nav class="navbar navbar-expand-md navbar-dark flex-column bg-dark">
        <div class="container">
          <button
            class="navbar-toggler ms-auto"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarBlock"
            aria-controls="navbarBlock"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse py-2" id="navbarBlock">
            <ul class="navbar-nav">
              <li class="nav-item align-self-center">
                <a href="home.jsp" class="navbar-brand invisible">
                  <i class="fa-solid fa-mobile-screen fa-2x"></i> ZPHone
                </a>
              </li>
              <li class="nav-item p-1 align-self-center">
                <a href="home.jsp" class="nav-link active">Home</a>
              </li>
              <li class="nav-item p-1 align-self-center">
                <a href="#" class="nav-link">Products</a>
              </li>
              <li class="nav-item p-1 align-self-center">
                <a href="#" class="nav-link">About us</a>
              </li>
            </ul>
            <div class="ms-auto p-1">
              <a href="login.jsp" class="btn btn-warning">Login</a>
            </div>
            <div class="p-1">
              <a href="#" class="btn btn-success">Sign Up</a>
            </div>
          </div>
        </div>
      </nav>
    </header>