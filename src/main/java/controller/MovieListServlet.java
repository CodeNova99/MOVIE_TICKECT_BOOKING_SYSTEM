<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Movie Details - Cinema Book</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #ffffff;
      color: #222;
      margin: 0;
      padding: 0;
    }

    /* Navbar */
    .navbar {
      background-color: #ffffff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 15px 5%;
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: #e50914;
    }

    .navbar a {
      color: #222 !important;
      font-weight: 600;
    }

    .navbar a:hover {
      color: #e50914 !important;
    }


    /* Hero Section */
.movie-hero {
    position: relative;
    background-size: cover; /* Changed for better scaling */
    background-position: center;
    background-repeat: no-repeat;
    height: 550px; /* Slightly adjusted height */
    display: flex;
    align-items: flex-end;   /* 👈 Align items to the bottom */
    justify-content: flex-start; /* 👈 Align items to the left */
    color: white;
    border-radius: 20px;
    margin: 40px auto;
    max-width: 1100px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.3);
    overflow: hidden;
    padding: 40px;
    background-color: #000;
}

.movie-overlay {
    position: absolute;
    inset: 0;
    /* 👇 Added a gradient for better text readability at the bottom */
    background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 20%, transparent 80%);
    border-radius: 20px;
}

.movie-info {
    position: relative;
    z-index: 2;
    max-width: 700px;
    text-align: left; /* 👈 Align text to the left */
}

.tags span {
  display: inline-block;
  background-color: rgba(255, 255, 255, 0.2); /* Semi-transparent background */
  border: 1px solid rgba(255, 255, 255, 0.4); /* Subtle border */
  color: #fff;
  padding: 5px 15px; /* Adds space inside the tag */
  margin-right: 10px; /* Adds space between tags */
  margin-bottom: 15px; /* Adds space below the tags */
  border-radius: 15px; /* Makes the corners rounded */
  font-size: 0.9rem;
  font-weight: 500;
}


    /* Buttons */
    .btn-book, .btn-trailer {
      font-weight: 600;
      padding: 12px 25px;
      border-radius: 10px;
      margin-right: 10px;
      transition: 0.3s ease;
    }

    .btn-book {
      background: linear-gradient(135deg, #e50914, #ff4b2b);
      color: #fff;
      border: none;
    }

    .btn-book:hover {
      background: linear-gradient(135deg, #ff4b2b, #ff6a00);
      transform: scale(1.05);
      box-shadow: 0 0 20px rgba(255, 75, 43, 0.6);
    }

    .btn-trailer {
      background-color: #fff;
      border: 2px solid #e50914;
      color: #e50914;
    }

    .btn-trailer:hover {
      background-color: #e50914;
      color: #fff;
      transform: scale(1.05);
    }

    /* Stats Section */
    .movie-stats {
      display: flex;
      justify-content: center;
      gap: 80px;
      background-color: #fff;
      padding: 40px 0;
      text-align: center;
    }

    .movie-stats .stat-number {
      font-size: 2rem;
      font-weight: 700;
      color: #e50914;
    }

    .movie-stats p {
      margin: 0;
      color: #555;
      font-weight: 500;
    }

    /* Plot Summary */
    .plot-summary {
      max-width: 900px;
      margin: 50px auto;
      padding: 0 20px;
    }

    .plot-summary h2 {
      font-weight: 700;
      margin-bottom: 20px;
      font-size: 1.8rem;
    }

    .plot-summary p {
      color: #444;
      line-height: 1.8;
      margin-bottom: 20px;
    }

    /* Cast & Crew */
    .cast-crew {
      max-width: 900px;
      margin: 50px auto;
      padding: 0 20px;
    }

    .cast-crew h2 {
      font-weight: 700;
      margin-bottom: 30px;
      font-size: 1.8rem;
    }

    .crew-section h5 {
      font-weight: 600;
      margin-bottom: 20px;
      color: #222;
    }

    .crew-member {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }

    .crew-member img {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
      box-shadow: 0 0 10px rgba(0,0,0,0.15);
    }

    .crew-member strong {
      color: #000;
    }

    .crew-member p {
      margin: 0;
      color: #666;
      font-size: 0.9rem;
    }

    .main-cast {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
    }

    /* Footer */
    footer {
      background-color: #f8f9fa;
      text-align: center;
      padding: 20px;
      font-size: 0.9rem;
      color: #777;
      border-top: 1px solid #ddd;
    }
  </style>
</head>
<body>

  <nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">CINEMA BOOK</a>
    <form class="d-flex mx-auto search-bar">
      <input class="form-control me-2" type="search" placeholder="Search movies...">
      <button class="btn btn-danger" type="submit">Search</button>
    </form>
    <div>
      <a href="userDashboard.jsp" class="mx-3 text-decoration-none">Home</a>
      <a href="login.jsp" class="mx-3 text-decoration-none">Logout</a>
    </div>
  </nav>

  <!-- Hero Section -->
<section class="movie-hero" style="background-image: url('https://www.example.com/bhoolbhulaiyaa3-hero-image.jpg');">
  <div class="movie-overlay"></div>
  <div class="movie-info text-white">

    <h1>Bhool Bhulaiyaa 3</h1>
    <div class="d-flex align-items-center my-2">
      <span class="rating-stars"><i class="bi bi-star-fill"></i> 7.5/10</span>
      <span class="mx-3 badge bg-warning text-dark">U/A</span>
      <span>• 145 min • 2025</span>
    </div>
    
    <div class="tags">
      <span>Horror</span>
      <span>Comedy</span>
      <span>Mystery</span>
    </div>

    <p class="movie-description">
      A haunted mansion, a cryptic curse, and a new mystery to solve — in this spine-chilling yet hilarious sequel, 
      the characters must face a new series of eerie events with an unexpected twist. The stakes are higher, and the laughs 
      are even bigger in *Bhool Bhulaiyaa 3*.
    </p>

    <div class="buttons">
      <button class="btn btn-book">🎟 Book Tickets Now</button>
      <button class="btn btn-trailer">▶ Watch Trailer</button>
    </div>
  </div>
</section>

<!-- Stats Section -->
<div class="movie-stats">
  <div>
    <div class="stat-number">50K+</div>
    <p>User Reviews</p>
  </div>
  <div>
    <div class="stat-number">82%</div>
    <p>Critics Score</p>
  </div>
  <div>
    <div class="stat-number">80%</div>
    <p>Watchlisted</p>
  </div>
  <div>
    <div class="stat-number">500</div>
    <p>Booked Today</p>
  </div>
</div>

<!-- Plot Summary -->
<section class="plot-summary">
  <h2>Plot Summary</h2>
  <p>
    Following the mysterious events from the previous films, the characters return to solve a new paranormal puzzle in the 
    haunted mansion, uncovering secrets that were buried for centuries. This time, the ghostly forces are more powerful, 
    and the comedy is sharper than ever. 
  </p>
  <p>
    As the characters navigate their way through the increasingly bizarre and dangerous occurrences, they realize that 
    they must confront their fears, face the supernatural, and solve the dark mystery that has plagued the mansion 
    for generations.
  </p>
  <p>
    With suspense, comedy, and spine-tingling thrills, *Bhool Bhulaiyaa 3* keeps you on the edge of your seat — 
    laughing, screaming, and craving more.
  </p>
</section>

<!-- Cast & Crew -->
<section class="cast-crew">
  <h2>Cast & Crew</h2>

  <div class="crew-section mb-4">
    <h5>Director</h5>
    <div class="crew-member">
      <img src="https://upload.wikimedia.org/wikipedia/commons/a/a6/Anees_Bazmee.jpg" alt="Anees Bazmee">
      <div>
        <strong>Anees Bazmee</strong><br>
        <p>Director</p>
      </div>
    </div>
  </div>

  <div class="crew-section">
    <h5>Main Cast</h5>
    <div class="main-cast">
      <div class="crew-member">
        <img src="https://upload.wikimedia.org/wikipedia/commons/e/e0/Akshay_Kumar_2018.jpg" alt="Akshay Kumar">
        <div>
          <strong>Akshay Kumar</strong><br>
          <p>Vikram Singh Rathore</p>
        </div>
      </div>
      <div class="crew-member">
        <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/Kareena_Kapoor_2015.jpg" alt="Kareena Kapoor">
        <div>
          <strong>Kareena Kapoor</strong><br>
          <p>Avni Chaturvedi</p>
        </div>
      </div>
      <div class="crew-member">
        <img src="https://upload.wikimedia.org/wikipedia/commons/1/1a/Tabu_2017.jpg" alt="Tabu">
        <div>
          <strong>Tabu</strong><br>
          <p>Shanti</p>
        </div>
      </div>
      <div class="crew-member">
        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a1/Paresh_Rawal.jpg" alt="Paresh Rawal">
        <div>
          <strong>Paresh Rawal</strong><br>
          <p>Chhote Pandit</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  &copy; 2025 Cinema Book — Your Ultimate Movie Ticket Partner 🎬
</footer>





  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
