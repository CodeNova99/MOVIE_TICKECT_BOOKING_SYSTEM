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
      overflow-x: hidden;
    }
    
             .back-btn {
        position: fixed;
        top: 100px;
        left: 50px;
        background-color: #e50914;
        color: #fff;
        border: none;
        padding: 10px 18px;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
        font-size: 1rem;
        z-index: 10000;
        transition: 0.3s;
    }

    .back-btn:hover {
        background-color: #ff4b2b;
        transform: scale(1.05);
    }


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
      background-size: cover;
      background-position: center;
      height: 550px;
      display: flex;
      align-items: flex-end;
      justify-content: flex-start;
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
      background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 20%, transparent 80%);
      border-radius: 20px;
    }

    .movie-info {
      position: relative;
      z-index: 2;
      max-width: 700px;
      text-align: left;
    }

    .tags span {
      display: inline-block;
      background-color: rgba(255, 255, 255, 0.2);
      border: 1px solid rgba(255, 255, 255, 0.4);
      color: #fff;
      padding: 5px 15px;
      margin-right: 10px;
      margin-bottom: 15px;
      border-radius: 15px;
      font-size: 0.9rem;
      font-weight: 500;
    }

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

    /* Trailer Popup */
    .trailer-container {
      position: fixed;
      top: 0;
      right: -100%;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.95);
      display: flex;
      align-items: center;
      justify-content: center;
      transition: right 0.6s ease;
      z-index: 9999;
    }

    .trailer-container.active {
      right: 0;
    }

    .trailer-container iframe {
      width: 80%;
      height: 70%;
      border-radius: 10px;
      box-shadow: 0 0 30px rgba(255, 255, 255, 0.3);
    }

    .close-trailer {
      position: absolute;
      top: 20px;
      right: 40px;
      font-size: 2rem;
      color: #fff;
      cursor: pointer;
      transition: 0.3s;
    }

    .close-trailer:hover {
      color: #e50914;
      transform: scale(1.1);
    }

    /* 📌 New Styling for Under Part */

    .movie-stats {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 40px;
      padding: 40px 20px;
      background-color: #f5f5f5;
      text-align: center;
    }

    .movie-stats div {
      flex: 1 1 150px;
    }

    .stat-number {
      font-size: 2rem;
      font-weight: 700;
      color: #e50914;
    }

    .plot-summary, .cast-crew {
      max-width: 1000px;
      margin: 50px auto;
      padding: 0 20px;
    }

    .plot-summary h2, .cast-crew h2 {
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 25px;
      color: #222;
      border-bottom: 3px solid #e50914;
      display: inline-block;
    }

    .plot-summary p {
      font-size: 1rem;
      line-height: 1.7;
      margin-bottom: 20px;
      color: #333;
    }

    .crew-section {
      margin-bottom: 30px;
    }

    .crew-member {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }

    .crew-member img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 50%;
      margin-right: 15px;
    }

    .main-cast {
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
    }

    .main-cast .crew-member {
      flex: 1 1 200px;
      background: #f9f9f9;
      padding: 15px;
      border-radius: 10px;
      transition: 0.3s ease;
    }

    .main-cast .crew-member:hover {
      background: #ffe8e6;
      transform: translateY(-3px);
    }

    footer {
      background-color: #f8f9fa;
      text-align: center;
      padding: 20px;
      font-size: 0.9rem;
      color: #777;
      border-top: 1px solid #ddd;
    }

    @media (max-width: 768px) {
      .movie-hero {
        height: auto;
        padding: 30px 20px;
      }

      .main-cast {
        flex-direction: column;
      }

      .crew-member {
        flex-direction: column;
        align-items: flex-start;
      }

      .crew-member img {
        margin-bottom: 10px;
      }
    }
  </style>
</head>

<body>

<button class="back-btn" onclick="window.location.href='userDashboard.jsp'">← Back</button>


  <!-- Navbar -->
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
  <section class="movie-hero" style="background-image: url('https://i.pinimg.com/736x/e8/f8/44/e8f844f033a6b1db144a813d1b3a46a1.jpg');">
    <div class="movie-overlay"></div>
    <div class="movie-info text-white">
      <h1>Maa</h1>
      <div class="d-flex align-items-center my-2">
        <span class="rating-stars"><i class="bi bi-star-fill"></i> 5.0/10</span>
        <span class="mx-3 badge bg-warning text-dark">U/A</span>
        <span>• 133 min • 2025</span>
      </div>

      <div class="tags">
        <span>Mythological</span>
        <span>Horror</span>
        <span>Drama</span>
      </div>

      <p class="movie-description">
        When Ambika and her daughter move to their ancestral village after a tragic loss, they awaken an ancient demonic curse. 
        To protect her child, Ambika must embrace her divine wrath and become Goddess Kali to battle the evil threatening their souls.
      </p>

      <div class="buttons">
        <button class="btn btn-book" id="bookNow">🎟 Book Tickets Now</button>
        <button class="btn btn-trailer" id="watchTrailer">▶ Watch Trailer</button>
      </div>
    </div>
  </section>

  <!-- Trailer Section -->
  <div class="trailer-container" id="trailerPopup">
    <span class="close-trailer" id="closeTrailer">&times;</span>
    <iframe id="trailerVideo" src="" frameborder="0" allowfullscreen></iframe>
  </div>
  
  <!-- Stats Section -->
  <div class="movie-stats">
    <div>
      <div class="stat-number">2.8M</div>
      <p>User Reviews</p>
    </div>
    <div>
      <div class="stat-number">94%</div>
      <p>Critics Score</p>
    </div>
    <div>
      <div class="stat-number">1.2M</div>
      <p>Watchlisted</p>
    </div>
    <div>
      <div class="stat-number">456</div>
      <p>Booked Today</p>
    </div>
  </div>


  <!-- Plot Summary -->
  <section class="plot-summary">
    <h2>Plot Summary</h2>
    <p>
      Set in a gleaming London skyscraper, the film introduces Joey Locke, an apathetic ex-soldier who now works as a window cleaner. She's forced to bring her older, autistic brother, Michael, to her high-rise workplace at One Canada Square.
    </p>
    <p>
      The situation spirals out of control when a group of radical environmental activists, "Earth Revolution," storm a lavish gala on the building's upper floors, taking 300 hostages, including Michael, to expose the corruption of the energy company's executives.
    </p>
    <p>
     As the initially moral cause is hijacked by an extremist within the group who is ready to murder everyone, Joey—stranded 50 stories up on the building's facade—becomes the only person capable of infiltrating the building and using her specialized military and climbing skills to outwit the terrorists and save her brother and the hostages.
    </p>
  </section>

  <!-- Cast & Crew -->
  <section class="cast-crew">
    <h2>Cast & Crew</h2>

    <div class="crew-section mb-4">
      <h5>Director</h5>
      <div class="crew-member">
        <img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Christopher_Nolan_Cannes_2018.jpg" alt="Martin Campbell">
        <div>
          <strong>Martin Campbell</strong><br>
          <p>Director, Writer, Producer</p>
        </div>
      </div>
    </div>

    <div class="crew-section">
      <h5>Main Cast</h5>
      <div class="main-cast">
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/f/f3/Christian_Bale-7835.jpg" alt="Daisy Ridley">
          <div>
            <strong>Daisy Ridley</strong><br>
            <p>Joey Locke</p>
          </div>
        </div>
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/6/63/Heath_Ledger_%282%29.jpg" alt="Clive Owen">
          <div>
            <strong>Clive Owen</strong><br>
            <p>Marcus Blake / antagonist lead</p>
          </div>
        </div>
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/d/d0/Aaron_Eckhart_2008.jpg" alt="Taz Skylar">
          <div>
            <strong>Taz Skylar</strong><br>
            <p>Noah (activist-turned-insurgent)</p>
          </div>
        </div>
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/0/0f/Maggie_Gyllenhaal_2018.jpg" alt="Maggie Gyllenhaal">
          <div>
            <strong>Maggie Gyllenhaal</strong><br>
            <p>Rachel Dawes</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  

  <!-- Footer -->
  <footer>
    &copy; 2025 Cinema Book — Your Ultimate Movie Ticket Partner 🎬
  </footer>

  <!-- JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // 🎟 Redirect to booking page
    document.getElementById('bookNow').addEventListener('click', function() {
      window.location.href = 'booking.jsp';
    });

    // ▶ Show trailer popup
    const trailerBtn = document.getElementById('watchTrailer');
    const trailerPopup = document.getElementById('trailerPopup');
    const trailerVideo = document.getElementById('trailerVideo');
    const closeTrailer = document.getElementById('closeTrailer');

    trailerBtn.addEventListener('click', () => {
      trailerPopup.classList.add('active');
      trailerVideo.src = "assets/trailer_Videos/Maa.mp4"; // 🔥 Replace with official trailer link
    });

    closeTrailer.addEventListener('click', () => {
      trailerPopup.classList.remove('active');
      trailerVideo.src = ""; // stop video playback
    });
  </script>
</body>
</html>
