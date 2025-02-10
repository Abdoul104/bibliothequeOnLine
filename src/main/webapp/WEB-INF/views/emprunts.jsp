<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | Emprunts</title>

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
                        <a class="nav-link" href="/"><i class="fas fa-home"></i> Accueil</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a>
                    </li>
                    <li class="nav-item px-2 mx-1">
                        <a class="nav-link active" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav> 

    <!-- Contenu principal -->
    <div class="container main-content">
        <h2 class="text-center mt-5"><i class="fas fa-list"></i> Gestion des Emprunts</h2>
        
        <div class="d-flex justify-content-between align-items-center my-3">
            <a href="/emprunts/ajouter" class="btn btn-success"><i class="fas fa-plus"></i> Nouvel Emprunt</a>
            <a href="/" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Retour</a>
        </div>

        <table class="table table-bordered table-hover">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Utilisateur</th>
                    <th>Livre</th>
                    <th>Date Emprunt</th>
                    <th>Date Retour Prévue</th>
                    <th>Statut</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emprunt" items="${emprunts}">
                    <tr>
                        <td>bol_${emprunt.id}</td>
                        <td>${emprunt.utilisateur.nom}</td>
                        <td>${emprunt.livre.titre}</td>
                        <td>${emprunt.dateEmprunt}</td>
                        <td>${emprunt.dateRetourPrevue}</td>
                        <td>
                            <span class="badge ${emprunt.statut eq 'Terminé' ? 'bg-success' : 'bg-danger'}">
                                ${emprunt.statut}
                            </span>
                        </td>
                        <td class="text-center">
                            <a href="/emprunts/modifier/${emprunt.id}" class="btn btn-warning btn-sm">
                                <i class="fas fa-edit"></i> Modifier
                            </a>
                            <a href="/emprunts/rendre/${emprunt.id}" class="btn btn-success btn-sm">
                                <i class="fas fa-check"></i> Rendre
                            </a>
                            <%-- <a href="/emprunts/supprimer/${emprunt.id}" class="btn btn-danger btn-sm"
                               onclick="return confirm('Supprimer cet emprunt ?');">
                               <i class="fas fa-trash"></i> Supprimer
                            </a> --%>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Footer Fixe en bas -->
    <footer class="bg-dark text-white text-center py-3 fixed-bottom">
        <p>© 2025 Tous droits réservés - Bibliothèque en Ligne</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
