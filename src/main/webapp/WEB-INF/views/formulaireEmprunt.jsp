<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bibliothèque | <c:if test="${emprunt.id == null}">Ajouter</c:if><c:if test="${emprunt.id != null}">Modifier</c:if> un Emprunt</title>

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
                    <li class="nav-item">
                        <a class="nav-link" href="/"><i class="fas fa-home"></i> Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/livres"><i class="fas fa-book-open"></i> Livres</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/utilisateurs"><i class="fas fa-users"></i> Utilisateurs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/emprunts"><i class="fas fa-list"></i> Emprunts</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="container main-content">
        <!-- Bouton Retour en haut -->
        <a href="/emprunts" class="btn btn-secondary mb-3"><i class="fas fa-arrow-left"></i> Retour</a>

        <div class="card shadow p-4">
            <h2 class="text-center"><i class="fas fa-book-reader"></i> 
                <c:if test="${emprunt.id == null}">Ajouter</c:if>
                <c:if test="${emprunt.id != null}">Modifier</c:if> un Emprunt
            </h2>

            <form action="/emprunts/sauvegarder" method="post">
                <input type="hidden" name="id" value="${emprunt.id}">

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-user"></i> Utilisateur</label>
                    <select name="utilisateurId" class="form-control" required>
                        <c:forEach var="utilisateur" items="${utilisateurs}">
                            <option value="${utilisateur.id}" ${emprunt.utilisateur.id == utilisateur.id ? 'selected' : ''}>
                                ${utilisateur.nom}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-book"></i> Livre</label>
                    <select name="livreId" class="form-control" required>
                        <c:forEach var="livre" items="${livres}">
                            <option value="${livre.id}" ${emprunt.livre.id == livre.id ? 'selected' : ''}>
                                ${livre.titre}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-calendar-alt"></i> Date de Retour Prévue</label>
                    <input type="date" name="dateRetourPrevue" class="form-control" required value="${emprunt.dateRetourPrevue}">
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-hourglass-half"></i> Statut</label>
                    <select name="statut" class="form-control">
                        <option value="En cours" ${emprunt.statut == 'En cours' ? 'selected' : ''}>En cours</option>
                        <option value="Terminé" ${emprunt.statut == 'Terminé' ? 'selected' : ''}>Terminé</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100">
                    <i class="fas fa-save"></i> Enregistrer
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
