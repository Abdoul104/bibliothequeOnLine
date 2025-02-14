<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | ${livre.id == null ? 'Ajouter' : 'Modifier'} un Livre</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- FontAwesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

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

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/"><i class="fas fa-book"></i> Bibliothèque en Ligne</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item px-2"><a class="nav-link" href="/"><i class="fas fa-home"></i> Accueil</a></li>
                    <li class="nav-item px-2"><a class="nav-link active" href="/livres"><i class="fas fa-book-open"></i> Livres</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a></li>
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
    <div class="container main-content mb-4">
        <a href="/livres" class="btn btn-secondary mb-3"><i class="fas fa-arrow-left"></i> Retour</a>

        <div class="card shadow p-4">
            <h2 class="text-center"><i class="fas fa-book"></i> ${livre.id == null ? 'Ajouter' : 'Modifier'} un Livre</h2>

            <form action="/livres/ajouter" method="post" id="livreForm" novalidate>
                <input type="hidden" name="id" value="${livre.id}">

                <!-- Champ Titre -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-heading"></i> Titre</label>
                    <input type="text" name="titre" class="form-control" required value="${livre.titre}">
                    <div class="invalid-feedback">Veuillez entrer un titre valide.</div>
                </div>

                <!-- Champ Auteur -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-user"></i> Auteur</label>
                    <input type="text" name="auteur" class="form-control" required value="${livre.auteur}">
                    <div class="invalid-feedback">Veuillez entrer un nom d'auteur valide.</div>
                </div>

                <!-- Champ Genre -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-layer-group"></i> Genre</label>
                    <input type="text" name="genre" class="form-control" required value="${livre.genre}">
                    <div class="invalid-feedback">Veuillez entrer un genre valide.</div>
                </div>

                <!-- Champ Année de Publication -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-calendar-alt"></i> Année de Publication</label>
                    <input type="number" name="anneePublication" class="form-control" required value="${livre.anneePublication}" min="1000" max="2025">
                    <div class="invalid-feedback">Veuillez entrer une année valide (ex: 2000).</div>
                </div>

                <!-- Disponibilité -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-check-circle"></i> Disponibilité</label>
                    <select name="disponible" class="form-select">
                        <option value="true" ${livre.disponible ? 'selected' : ''}>📗 Disponible</option>
                        <option value="false" ${!livre.disponible ? 'selected' : ''}>📕 Indisponible</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100">
                    <i class="fas fa-save"></i> ${livre.id == null ? 'Enregistrer' : 'Mettre à Jour'}
                </button>
            </form>
        </div>
    </div>

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

        document.addEventListener("DOMContentLoaded", function () {

            // Sélection du formulaire et des champs Auteur et Genre
            const form = document.getElementById("livreForm");
            const auteurInput = document.querySelector("input[name='auteur']");
            const genreInput = document.querySelector("input[name='genre']");
            const regexTexte = /^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/; // Lettres + espaces uniquement

            // Validation de l'Auteur
            auteurInput.addEventListener("input", function () {
                if (!regexTexte.test(auteurInput.value)) {
                    auteurInput.classList.add("is-invalid");
                    auteurInput.nextElementSibling.textContent = "Le nom de l'auteur ne peut contenir que des lettres et des espaces.";
                } else {
                    auteurInput.classList.remove("is-invalid");
                    auteurInput.nextElementSibling.textContent = "";
                }
            });

            // Validation du Genre
            genreInput.addEventListener("input", function () {
                if (!regexTexte.test(genreInput.value)) {
                    genreInput.classList.add("is-invalid");
                    genreInput.nextElementSibling.textContent = "Le genre ne peut contenir que des lettres et des espaces.";
                } else {
                    genreInput.classList.remove("is-invalid");
                    genreInput.nextElementSibling.textContent = "";
                }
            });

            // Validation du formulaire avant soumission
            form.addEventListener("submit", function (event) {
                if (!form.checkValidity() || !regexTexte.test(auteurInput.value) || !regexTexte.test(genreInput.value)) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add("was-validated");
            });
        });
</script>


</body>
</html>
