<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | Accueil</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- FontAwesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            padding-top: 70px; /* Ajustement pour éviter d'être caché sous la navbar */
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .main-content {
            flex: 1; /* Permet au contenu de s'étendre sans cacher le footer */
        }
        .dark-mode {
            background-color: #121212;
            color: white;
        }
        .toggle-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .gif-container img {
            max-width: 100%;
            height: auto;
            margin: 10px 0;
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
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/"><i class="fas fa-book"></i> Bibliothèque en Ligne</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item px-2"><a class="nav-link active" href="/"><i class="fas fa-home"></i> Accueil</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/dashboard"><i class="fas fa-chart-line"></i> Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="container text-center main-content">

        <!-- Toggle Switch du mode sombre -->
        
        <div class="toggle-container mx-auto d-flex justify-content-center">
            <div class="theme-switch">
                <input type="checkbox" id="darkModeToggle">
                <label for="darkModeToggle">
                    <i class="fas fa-sun"></i>
                    <i class="fas fa-moon"></i>
                </label>
            </div>
            
        </div>

        <h1 class="mt-5">📚 Bienvenue dans la Bibliothèque en Ligne</h1>
        <p>Gérez facilement vos livres, utilisateurs et emprunts.</p>

        <!-- Images GIF -->
        <div class="d-flex justify-content-center gap-3 flex-wrap">
            <img src="https://media.giphy.com/media/WDwvLqHU1Uta6YfQLO/giphy.gif" alt="Bibliothèque animée" class="img-fluid" style="max-width: 300px;">
            <img src="https://media.giphy.com/media/k9nostndMP8nwTxK5U/giphy.gif" alt="Bienvenue dans la bibliothèque" class="img-fluid" style="max-width: 300px;">
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 footer">
        <p>© 2025 Tous droits réservés - Bibliothèque en Ligne</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        const toggleSwitch = document.getElementById("darkModeToggle");

        function setTheme(isDark) {
            document.body.classList.toggle("dark-mode", isDark);
            localStorage.setItem("theme", isDark ? "dark" : "light");
        }

        // Vérifier l'état du mode sombre au chargement
        if (localStorage.getItem("theme") === "dark") {
            toggleSwitch.checked = true;
            setTheme(true);
        }

        // Gérer le changement de mode
        toggleSwitch.addEventListener("change", () => {
            setTheme(toggleSwitch.checked);
        });
    </script>
</body>
</html>
