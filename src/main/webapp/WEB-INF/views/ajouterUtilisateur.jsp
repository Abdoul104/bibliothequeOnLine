    <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | ${utilisateur.id == null ? 'Ajouter' : 'Modifier'} un Utilisateur</title>

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

    <!-- Navbar Fixe -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/"><i class="fas fa-book"></i> Bibliothèque en Ligne</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item px-2 mx-1"><a class="nav-link" href="/"><i class="fas fa-home"></i> Accueil</a></li>
                    <li class="nav-item px-2 mx-1"><a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a></li>
                    <li class="nav-item px-2 mx-1"><a class="nav-link active" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a></li>
                    <li class="nav-item px-2 mx-1"><a class="nav-link" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a></li>
                    <li class="nav-item px-2"><a class="nav-link" href="/dashboard"><i class="fas fa-chart-line"></i> Dashboard</a></li>

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
            </div>
    <!-- Contenu principal -->
    <div class="container main-content">
        <a href="/utilisateurs" class="btn btn-secondary mb-3"><i class="fas fa-arrow-left"></i> Retour</a>

        <div class="card shadow p-4">
            <h2 class="text-center"><i class="fas fa-user"></i> ${utilisateur.id == null ? 'Ajouter' : 'Modifier'} un Utilisateur</h2>

            <form id="utilisateurForm" action="/utilisateurs/ajouter" method="post" novalidate>
                <input type="hidden" name="id" value="${utilisateur.id}">

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-user"></i> Nom</label>
                    <input type="text" name="nom" class="form-control" required value="${utilisateur.nom}">
                    <div class="invalid-feedback">Le nom ne doit contenir que des lettres et des espaces.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="email" class="form-control" required value="${utilisateur.email}">
                    <div class="invalid-feedback">Veuillez entrer une adresse e-mail valide.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-phone"></i> Numéro de Téléphone</label>
                    <input type="text" name="numeroTelephone" class="form-control" required value="${utilisateur.numeroTelephone}">
                    <div class="invalid-feedback">Le numéro doit contenir uniquement des chiffres (8-15 caractères).</div>
                </div>

                <button type="submit" class="btn btn-success w-100">
                    <i class="fas fa-save"></i> ${utilisateur.id == null ? 'Enregistrer' : 'Mettre à Jour'}
                </button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-4">
        <p>© 2025 Tous droits réservés - Bibliothèque en Ligne</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript -->
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
            const form = document.getElementById("utilisateurForm");
            const nomInput = form.querySelector("input[name='nom']");
            const emailInput = form.querySelector("input[name='email']");
            const telInput = form.querySelector("input[name='numeroTelephone']");
            
            const regexNom = /^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/;
            const regexTel = /^[0-9\s]{8,20}$/; // Autorise les chiffres et espaces (8-20 caractères)

            // Validation des champs
            function validateInput(input, regex) {
                const errorMsg = input.nextElementSibling;
                if (!regex.test(input.value.trim())) {
                    input.classList.add("is-invalid");
                    errorMsg.style.display = "block";
                } else {
                    input.classList.remove("is-invalid");
                    errorMsg.style.display = "none";
                }
            }

            function validateEmail(input) {
                const errorMsg = input.nextElementSibling;
                if (!input.validity.valid) {
                    input.classList.add("is-invalid");
                    errorMsg.style.display = "block";
                } else {
                    input.classList.remove("is-invalid");
                    errorMsg.style.display = "none";
                }
            }

            nomInput.addEventListener("input", () => validateInput(nomInput, regexNom));
            emailInput.addEventListener("input", () => validateEmail(emailInput));
            telInput.addEventListener("input", () => validateInput(telInput, regexTel));

            // Validation du formulaire
            form.addEventListener("submit", function (event) {
                let valid = true;

                if (!regexNom.test(nomInput.value.trim())) {
                    validateInput(nomInput, regexNom);
                    valid = false;
                }
                if (!emailInput.validity.valid) {
                    validateEmail(emailInput);
                    valid = false;
                }
                if (!regexTel.test(telInput.value.trim())) {
                    validateInput(telInput, regexTel);
                    valid = false;
                }

                if (!valid) {
                    event.preventDefault();
                }
            });
        });
    </script>

</body>
</html>
