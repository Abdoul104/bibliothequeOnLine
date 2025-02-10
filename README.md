# 📚 Gestion de Bibliothèque en Ligne  

### 👨‍💻 Concepteurs :  
- **Abdoul Rachid BISSARE**  
- **Esai KOTCHONI**  

## 🚀 Description du Projet  

Ce projet a pour objectif de développer une plateforme web intuitive de **gestion de bibliothèque en ligne** permettant la location de livres. Il a été conçu avec **Java et Spring Boot**, en intégrant des technologies modernes pour la persistance des données et une interface utilisateur dynamique.  

L’application explore des concepts clés tels que :  
- **Les services REST** avec Spring Boot  
- **La persistance des données** avec JPA/Hibernate  
- **Une interface simple et responsive** avec **JSP + Bootstrap**  
- **Une base de données relationnelle PostgreSQL**  

---

## 📌 Fonctionnalités  

L’application permet de :  

### 📖 Gestion des Livres  
✅ Ajouter un livre  
✅ Modifier les informations d’un livre  
✅ Supprimer un livre  
✅ Consulter la liste des livres disponibles  

Chaque livre possède les attributs suivants :  
- **Titre**  
- **Auteur**  
- **Genre**  
- **Année de publication**  
- **Disponibilité** (✔️ Oui / ❌ Non)  

### 👤 Gestion des Utilisateurs  
✅ Ajouter un utilisateur  
✅ Modifier un utilisateur  
✅ Supprimer un utilisateur  
✅ Consulter la liste des utilisateurs  

Chaque utilisateur possède :  
- **Nom**  
- **Email**  
- **Numéro de téléphone**  

### 📚 Gestion des Emprunts  
✅ Un utilisateur peut **emprunter un livre**  
✅ Suivi des **dates d’emprunt et de retour prévu**  
✅ Suivi du **statut des emprunts** (En cours / Terminé)  
✅ Rendre un livre  

Un emprunt est caractérisé par :  
- **Utilisateur associé**  
- **Livre emprunté**  
- **Date d’emprunt**  
- **Date de retour prévue**  
- **Statut** (En cours / Terminé)  

---

## 🎨 Interface Utilisateur  

L’application utilise **Bootstrap** pour améliorer l’expérience utilisateur avec :  
- 📌 **Un menu de navigation clair et intuitif** 
- 🛠 **Des interfaces fluides et modernes**  

---

## 🛠 Technologies Utilisées  

| Technologie         | Usage |
|---------------------|-----------------------------|
| **Java 21**        | Développement backend |
| **Spring Boot**    | Framework Java pour API REST |
| **JPA / Hibernate** | Persistance des données |
| **PostgreSQL**      | Base de données |
| **JSP**            | Interface utilisateur |
| **Bootstrap**      | Design responsive et moderne |
| **FontAwesome**    | Icônes pour améliorer l'UI |
| **REST Client (VS Code)** | Test des API REST |

---

## 📦 Installation et Lancement  

### 📥 **1. Prérequis**  
- Java 21 installé  
- PostgreSQL ou MySQL installé  
- Maven installé  

### 🚀 **2. Cloner le projet**  
```bash
git clone https://github.com/name_repot
cd name_folder

# 🛠 3. Configurer la base de données

# Modifiez application.properties pour adapter les paramètres PostgreSQL/MySQL :

spring.datasource.url=jdbc:postgresql://localhost:5432/bibliotheque
spring.datasource.username=VOTRE_USER
spring.datasource.password=VOTRE_MOT_DE_PASSE
spring.jpa.hibernate.ddl-auto=update

# ▶ 4. Démarrer l’application

#  Lancer l’application avec Maven :

mvn spring-boot:run

# L’application sera accessible sur http://localhost:8080 🚀