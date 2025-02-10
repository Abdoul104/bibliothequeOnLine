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

     <!-- Fichier CSS personnalisé -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .main-content {
            flex: 1;
            margin-top: 80px; /* Ajuste cette valeur selon la hauteur de ta navbar */
        }
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
        .gif-container img {
            max-width: 100%;
            height: auto;
            margin: 10px 0;
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
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="container main-content">
        <!-- Bouton Retour en haut -->
        <a href="/livres" class="btn btn-secondary mb-3"><i class="fas fa-arrow-left"></i> Retour</a>

        <div class="card shadow p-4">
            <h2 class="text-center"><i class="fas fa-book"></i> ${livre.id == null ? 'Ajouter' : 'Modifier'} un Livre</h2>

            <form action="/livres/ajouter" method="post">
                <input type="hidden" name="id" value="${livre.id}">

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-heading"></i> Titre</label>
                    <input type="text" name="titre" class="form-control" required value="${livre.titre}">
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-user"></i> Auteur</label>
                    <input type="text" name="auteur" class="form-control" required value="${livre.auteur}">
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-layer-group"></i> Genre</label>
                    <input type="text" name="genre" class="form-control" required value="${livre.genre}">
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-calendar-alt"></i> Année de Publication</label>
                    <input type="number" name="anneePublication" class="form-control" required value="${livre.anneePublication}">
                </div>

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

    <!-- Footer Fixe en bas -->
    <footer class="bg-dark text-white text-center py-3 mt-4">
        <p>© 2025 Tous droits réservés - Bibliothèque en Ligne</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
