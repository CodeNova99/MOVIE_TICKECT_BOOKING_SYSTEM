<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Cinema Book</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fff;
            color: #000;
        }

        .navbar {
            background-color: #fff;
            border-bottom: 2px solid #e5e5e5;
            padding: 15px 50px;
        }
        .navbar-brand {
            font-weight: 800;
            font-size: 1.6rem;
            color: red;
        }
        .search-bar {
            width: 40%;
        }
        .nav-link {
            color: #000 !important;
            font-weight: 600;
            margin-left: 15px;
        }
        .nav-link:hover {
            color: red !important;
        }

        .image-gallery {
            position: relative;
            background: #e5e5e5;
            height: 350px;
            overflow: hidden;
            margin: 30px auto;
        }
        .carousel-item img {
            height: 350px;
            object-fit: cover;
            width: 100%;
        }
        .carousel-caption {
            background: rgba(0,0,0,0.6);
            border-radius: 10px;
            padding: 10px 20px;
        }

        .section-title {
            font-weight: bold;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .section-title a {
            text-decoration: none;
            color: #000;
            font-weight: 600;
        }
        .section-title a:hover {
            color: red;
        }

            .movie-card {
        background-color: #FFFFFF;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 10px rgba(0,0,0,0.4);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        text-align: center;
    }
        .movie-card:hover {
            transform: scale(1.03);
        }
        .movie-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        .movie-info {
            background-color: #000;
            color: #fff;
            font-size: 0.8rem;
            padding: 5px 10px;
            display: flex;
            justify-content: space-between;
        }
        .movie-title {
            text-align: center;
            font-weight: 600;
            margin: 10px 0;
        }
        
.view-btn {
  display: inline-block;
  margin: 10px auto; /* ✅ Add top margin and center horizontally */
  padding: 8px 16px;
  background: linear-gradient(135deg, #e50914, #ff4b2b);
  color: #fff;
  text-decoration: none;
  font-weight: bold;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(229, 9, 20, 0.4);
  transition: all 0.3s ease-in-out;
}

.view-btn:hover {
  background: linear-gradient(135deg, #ff4b2b, #ff6a00);
  box-shadow: 0 0 20px rgba(255, 75, 43, 0.7);
  transform: scale(1.08);
  color: #fff;
}
        footer {
            background-color: #333;
            color: #ccc;
            padding: 25px 0;
            margin-top: 50px;
        }
        footer .icon-box {
            text-align: center;
        }
        footer i {
            font-size: 1.8rem;
            color: red;
        }
        footer p {
            font-size: 0.9rem;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">CINEMA BOOK</a>
    <form class="d-flex mx-auto search-bar" id="searchForm">
        <input class="form-control me-2" id="searchInput" type="search" placeholder="Search movies...">
        <button class="btn btn-dark" type="submit">Search</button>
    </form>
    <div>
        <a href="userDashboard.jsp" class="mx-3 text-dark fw-bold text-decoration-none">Home</a>
        <a href="login.jsp" class="mx-3 text-dark fw-bold text-decoration-none">Logout</a>
    </div>
</nav>

<!-- ===== IMAGE GALLERY ===== -->
<div id="galleryCarousel" class="carousel slide image-gallery" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://assets-in.bmscdn.com/discovery-catalog/events/et00429289-zpwhxvksvs-landscape.jpg" alt="Joker 2">
            <div class="carousel-caption"><h5>NARSHIMA</h5></div>
        </div>
        <div class="carousel-item">
            <img src="https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/xxlarge/coolie-et00395817-1755153511.jpg" alt="Dune Part 2">
            <div class="carousel-caption"><h5>COOLIE</h5></div>
        </div>
        <div class="carousel-item">
            <img src="https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/xxlarge/kantara-a-legend-chapter-1-et00377351-1760336092.jpg" alt="Deadpool & Wolverine">
            <div class="carousel-caption"><h5>KANTRA</h5></div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#galleryCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bg-dark rounded-circle"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#galleryCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon bg-dark rounded-circle"></span>
    </button>
</div>

<!-- ===== RECOMMENDED MOVIES ===== -->
<div class="container my-5" id="moviesSection">
    <div class="section-title">
        <h6 style="font-weight: bold; font-size: 1.2rem;">RECOMMENDED MOVIES</h6>
        <a href="allRecommendedMovies.jsp">See All &gt;</a>
    </div>

    <div class="row row-cols-2 row-cols-md-5 g-3 movie-container">
        <!-- Movie 1 -->
        <div class="col movie-card-item">
            <div class="movie-card">
                <img src="https://i.pinimg.com/736x/8c/dc/66/8cdc6614d0828cd1dc439c17e63ec4f4.jpg" alt="Maa">
                <div class="movie-info"><span>Rating: 8.6</span><span>Votes: 210k</span></div>
                <div class="movie-title">Maa</div>
                <a href="Maa.jsp" class="view-btn">View Details</a>
            </div>
        </div>

        <!-- Movie 2 -->
        <div class="col movie-card-item">
            <div class="movie-card">
                <img src="https://i.pinimg.com/736x/80/32/e5/8032e5659576b6a8b636f9c64e6283a3.jpg" alt="WAR 2">
                <div class="movie-info"><span>Rating: 8.3</span><span>Votes: 250k</span></div>
                <div class="movie-title">WAR 2</div>
                <a href="WAR 2.jsp" class="view-btn">View Details</a>
            </div>
        </div>

        <!-- Movie 3 -->
        <div class="col movie-card-item">
            <div class="movie-card">
                <img src="https://i.pinimg.com/736x/df/b4/57/dfb45725b45f4d079e0f3e2e4b8d91bb.jpg" alt="Baaghi 4">
                <div class="movie-info"><span>Rating: 8.2</span><span>Votes: 180k</span></div>
                <div class="movie-title">Baaghi 4</div>
                <a href="Baaghi 4.jsp" class="view-btn">View Details</a>
            </div>
        </div>

        <!-- Movie 4 -->
        <div class="col movie-card-item">
            <div class="movie-card">
                <img src="https://i.pinimg.com/736x/69/10/62/691062eb4bbbad1f19e35d73ca2a6623.jpg" alt="Bhool Bhulaiyaa 3">
                <div class="movie-info"><span>Rating: 7.9</span><span>Votes: 170k</span></div>
                <div class="movie-title">Bhool Bhulaiyaa 3</div>
                <a href="Bhool Bhulaiyaa 3.jsp" class="view-btn">View Details</a>
            </div>
        </div>

        <!-- Movie 5 -->
        <div class="col movie-card-item">
            <div class="movie-card">
                <img src="https://i.pinimg.com/736x/68/aa/2d/68aa2dd0b5f013f26f523b1fc68b1b45.jpg" alt="Mirai">
                <div class="movie-info"><span>Rating: 8.1</span><span>Votes: 140k</span></div>
                <div class="movie-title">Mirai</div>
                <a href="Mirai.jsp" class="view-btn">View Details</a>
            </div>
        </div>
    </div>
</div>

<!-- ===== COMING SOON ===== -->
<div class="container mb-5">
    <div class="section-title">
        <h6 style="font-weight: bold; font-size: 1.2rem;">COMMING SOON MOVIES</h6>
        
    </div>

    <div class="row row-cols-2 row-cols-md-5 g-3">
        <div class="col">
            <div class="movie-card">
                <img src="https://m.media-amazon.com/images/I/81s6DUyQCZL._AC_SL1500_.jpg" alt="Venom 3">
                <div class="movie-info"><span>Rating: --</span><span>Votes: --</span></div>
                <div class="movie-title">Venom 3: The Last Dance</div>
                <a href="#" class="view-btn">View Details</a>
            </div>
        </div>
        <div class="col">
            <div class="movie-card">
                <img src="https://m.media-amazon.com/images/I/81V5xiy2vUL._AC_SL1500_.jpg" alt="Inside Out 2">
                <div class="movie-info"><span>Rating: 8.0</span><span>Votes: 50k</span></div>
                <div class="movie-title">Inside Out 2</div>
                <a href="#" class="view-btn">View Details</a>
            </div>
        </div>
        <div class="col">
            <div class="movie-card">
                <img src="https://m.media-amazon.com/images/I/81W5uGVzFGL._AC_SL1500_.jpg" alt="Gladiator 2">
                <div class="movie-info"><span>Rating: --</span><span>Votes: --</span></div>
                <div class="movie-title">Gladiator II</div>
                <a href="#" class="view-btn">View Details</a>
            </div>
        </div>
        <div class="col">
            <div class="movie-card">
                <img src="https://m.media-amazon.com/images/I/81cD8zPQlFL._AC_SL1500_.jpg" alt="Wicked">
                <div class="movie-info"><span>Rating: --</span><span>Votes: --</span></div>
                <div class="movie-title">Wicked</div>
                <a href="#" class="view-btn">View Details</a>
            </div>
        </div>
        <div class="col">
            <div class="movie-card">
                <img src="https://m.media-amazon.com/images/I/81o7l8C7toL._AC_SL1500_.jpg" alt="Moana 2">
                <div class="movie-info"><span>Rating: --</span><span>Votes: --</span></div>
                <div class="movie-title">Moana 2</div>
                <a href="#" class="view-btn">View Details</a>
            </div>
        </div>
    </div>
</div>


<!-- ===== FOOTER ===== -->
<footer>
    <div class="container">
        <div class="row text-center">
            <div class="col icon-box">
                <i class="bi bi-headset"></i>
                <p>24/7 Customer Care</p>
            </div>
            <div class="col icon-box">
                <i class="bi bi-ticket-perforated"></i>
                <p>Resend Booking Confirmation</p>
            </div>
            <div class="col icon-box">
                <i class="bi bi-envelope"></i>
                <p>Subscribe to Newsletter</p>
            </div>
        </div>
    </div>
</footer>

<!-- ===== SCRIPTS ===== -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // ✅ SEARCH FUNCTIONALITY
  const searchForm = document.getElementById('searchForm');
  const searchInput = document.getElementById('searchInput');
  const movieCards = document.querySelectorAll('.movie-card-item');

  searchForm.addEventListener('submit', (e) => {
    e.preventDefault(); // prevent form refresh
    const searchTerm = searchInput.value.trim().toLowerCase();

    movieCards.forEach(card => {
      const title = card.querySelector('.movie-title').innerText.toLowerCase();
      if (title.includes(searchTerm) || searchTerm === "") {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  });
</script>

</body>
</html>
