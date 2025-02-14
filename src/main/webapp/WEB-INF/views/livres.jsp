<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | Livres</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- FontAwesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="style.css"/>

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
            background-color: #343a40;
            color: white;
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
            width: 100%;
        }
    </style>
</head>
<body>

    <!-- Message de succès -->
    <c:if test="${not empty message}">
        <div id="message-toast" class="toast show position-fixed top-0 end-0 m-3 mt-5" role="alert">
            <div class="toast-header bg-success text-white">
                <strong class="me-auto">✅ Succès</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                ${message}
                <div class="progress mt-2">
                     <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: 100%; transition: width 5s;"></div>
                </div>
            </div>
        </div>
        <script>
            setTimeout(() => {
                document.getElementById('message-toast').style.display = 'none';
            }, 5000);
         </script>
    </c:if>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/"><i class="fas fa-book"></i> Bibliothèque en Ligne</a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link" href="/"><i class="fas fa-home"></i> Accueil</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link active" href="/livres"><i class="fas fa-book-open"></i> Livres</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a>
                    </li>
                    <li class="nav-item px-2"><a class="nav-link" href="/dashboard"><i class="fas fa-chart-line"></i> Dashboard</a></li>

                </ul>
            </div>
        </div>
    </nav>  

    <!-- Toggle Switch du mode sombre -->
        <div class="toggle-container mx-auto mb-4 d-flex justify-content-center">
            <div class="theme-switch">
                <input type="checkbox" id="darkModeToggle">
                <label for="darkModeToggle">
                    <i class="fas fa-sun"></i>
                    <i class="fas fa-moon"></i>
                </label>
            </div>
        </div>
    <!-- Contenu principal -->
    <div class="container main-content">
        <h2 class="text-center"><i class="fas fa-book-open"></i> Gestion des Livres</h2>
        
        <div class="d-flex justify-content-between align-items-center my-3">
            <a href="/livres/ajouter" class="btn btn-success"><i class="fas fa-plus"></i> Ajouter un Livre</a>
            <a href="/" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Retour</a>
        </div>

        <table class="table table-bordered table-hover">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Auteur</th>
                    <th>Genre</th>
                    <th>Année</th>
                    <th>Disponibilité</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="livre" items="${livres}">
                    <tr>
                        <td>bok_${livre.id}</td>
                        <td>${livre.titre}</td>
                        <td>${livre.auteur}</td>
                        <td>${livre.genre}</td>
                        <td>${livre.anneePublication}</td>
                        <td class="text-center">
                            <c:choose>
                                <c:when test ="${livre.disponible}">
                                    <i class="fas fa-check-circle text-success"></i>
                                    <span>Oui</span>
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-times-circle text-danger"></i>
                                    <span>Non</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-center">
                            <a href="/livres/modifier/${livre.id}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Modifier</a>
                            <a href="/livres/supprimer/${livre.id}" class="btn btn-danger btn-sm"
                               onclick="return confirm('Voulez-vous vraiment supprimer ce livre ?');">
                               <i class="fas fa-trash"></i> Supprimer
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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

        if (localStorage.getItem("theme") === "dark") {
            toggleSwitch.checked = true;
            setTheme(true);
        }

        toggleSwitch.addEventListener("change", () => {
            setTheme(toggleSwitch.checked);
        });
    </script>
</body>
</html>
