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
                        <a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link active" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a>
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
        <a href="/utilisateurs" class="btn btn-secondary mb-3"><i class="fas fa-arrow-left"></i> Retour</a>

        <div class="card shadow p-4">
            <h2 class="text-center"><i class="fas fa-user"></i> ${utilisateur.id == null ? 'Ajouter' : 'Modifier'} un Utilisateur</h2>

            <form action="/utilisateurs/ajouter" method="post">
                <input type="hidden" name="id" value="${utilisateur.id}">

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-user"></i> Nom</label>
                    <input type="text" name="nom" class="form-control" required value="${utilisateur.nom}">
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="email" class="form-control" required value="${utilisateur.email}">
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-phone"></i> Numéro de Téléphone</label>
                    <input type="text" name="numeroTelephone" class="form-control" required value="${utilisateur.numeroTelephone}">
                </div>

                <button type="submit" class="btn btn-success w-100">
                    <i class="fas fa-save"></i> ${utilisateur.id == null ? 'Enregistrer' : 'Mettre à Jour'}
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
