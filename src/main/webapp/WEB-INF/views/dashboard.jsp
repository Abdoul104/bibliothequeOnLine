<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | Dashboard</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- FontAwesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
       body {
            font-family: 'Poppins', sans-serif;
            padding-top: 70px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .main-content {
            flex: 1;
        }
        .dark-mode {
            background-color: #121212;
            color: white;
        }
        .table-dark th {
            background-color: #343a40 !important;
        }
        .toggle-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .theme-switch {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        .theme-switch input {
            display: none;
        }
        .theme-switch label {
            display: flex;
            align-items: center;
            background: #ccc;
            border-radius: 20px;
            padding: 5px 10px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .theme-switch input:checked + label {
            background: #222;
        }
        .theme-switch i {
            font-size: 1.2rem;
            margin: 0 5px;
        }
        .footer {
            position: relative;
            width: 100%;
        }
    </style>
</head>
<body>

<%
    // Connexion à la base de données
    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bibliotheque", "postgres", "PostgresqL@1602");

    // Récupération des statistiques
    Statement stmt = conn.createStatement();
    ResultSet rsUsers = stmt.executeQuery("SELECT COUNT(*) FROM utilisateurs");
    rsUsers.next();
    int totalUsers = rsUsers.getInt(1);

    ResultSet rsLivres = stmt.executeQuery("SELECT COUNT(*) FROM livres");
    rsLivres.next();
    int totalLivres = rsLivres.getInt(1);

    ResultSet rsEmprunts = stmt.executeQuery("SELECT COUNT(*) FROM emprunts");
    rsEmprunts.next();
    int totalEmprunts = rsEmprunts.getInt(1);

    // Récupération des livres par catégorie
    ResultSet rsCategories = stmt.executeQuery("SELECT genre, COUNT(*) FROM livres GROUP BY genre");
    String categories = "";
    String livresParCategorie = "";
    while (rsCategories.next()) {
        categories += "'" + rsCategories.getString(1) + "',";
        livresParCategorie += rsCategories.getInt(2) + ",";
    }
    conn.close();
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/"><i class="fas fa-book"></i> Bibliothèque en Ligne</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item px-2"><a class="nav-link" href="/"><i class="fas fa-home"></i> Accueil</a></li>
                <li class="nav-item px-2"><a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a></li>
                <li class="nav-item px-2"><a class="nav-link" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a></li>
                <li class="nav-item px-2"><a class="nav-link" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a></li>
                <li class="nav-item px-2"><a class="nav-link active" href="/dashboard"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Toggle Switch du mode sombre -->
            <div class="toggle-container mx-auto d-flex justify-content-center">
                <div class="theme-switch">
                    <input type="checkbox" id="darkModeToggle">
                    <label for="darkModeToggle">
                        <i class="fas fa-sun"></i>
                        <i class="fas fa-moon"></i>
                    </label>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>

<!-- ✅ Contenu principal -->
<div class="container mt-4 main-content">
    <h1 class="text-center"><i class="fas fa-chart-line"></i> Dashboard</h1>

    <div class="row g-4 mt-3">
        <div class="col-md-4">
            <div class="card text-white bg-primary shadow">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-users"></i> Utilisateurs</h5>
                    <p class="card-text fs-3"><%= totalUsers %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success shadow">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-book"></i> Livres</h5>
                    <p class="card-text fs-3"><%= totalLivres %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-danger shadow">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-list"></i> Emprunts</h5>
                    <p class="card-text fs-3"><%= totalEmprunts %></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Graphiques -->
    <div class="row mt-5">
        <div class="col-md-6 mx-auto mb-2">
            <div class="card shadow p-3">
                <h5 class="text-center"><i class="fas fa-chart-bar"></i> Livres par Catégorie</h5>
                <canvas id="livresCategorieChart"></canvas>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3 footer">
    <p>© 2025 Tous droits réservés - Bibliothèque en Ligne</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Mode sombre
    const toggleSwitch = document.getElementById("darkModeToggle");
    function setTheme(isDark) {
        document.body.classList.toggle("dark-mode", isDark);
        localStorage.setItem("theme", isDark ? "dark" : "light");
    }
    if (localStorage.getItem("theme") === "dark") {
        toggleSwitch.checked = true;
        setTheme(true);
    }
    toggleSwitch.addEventListener("change", () => setTheme(toggleSwitch.checked));

    // Graphique
    new Chart(document.getElementById("livresCategorieChart"), {
        type: 'bar',
        data: {
            labels: [<%= categories %>],
            datasets: [{
                label: "Livres",
                backgroundColor: "rgba(54, 162, 235, 0.5)",
                borderColor: "rgba(54, 162, 235, 1)",
                borderWidth: 1,
                data: [<%= livresParCategorie %>]
            }]
        }
    });
</script>

</body>
</html>
