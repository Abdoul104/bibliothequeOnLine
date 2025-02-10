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

    <!-- Fichier CSS personnalisé -->
    <link rel="stylesheet" href="style.css"/>
    
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
                        <a class="nav-link active" href="/"><i class="fas fa-home "></i> Accueil</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a>
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
    <div class="container text-center main-content">
        <h1 class="mt-5">📚 Bienvenue dans la Bibliothèque en Ligne</h1>
        <p>Gérez facilement vos livres, utilisateurs et emprunts.</p>

        <!-- Image GIF -->
        <div class="gif-container">
            <img src="https://media.giphy.com/media/WDwvLqHU1Uta6YfQLO/giphy.gif" alt="Bibliothèque animée" class="img-fluid">
            <img src="https://media.giphy.com/media/k9nostndMP8nwTxK5U/giphy.gif" alt="Élève lisant un livre" class="img-fluid">
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-4 fixed-bottom">
        <p>© 2025 Tous droits réservés - Bibliothèque en Ligne </p>
        

    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
