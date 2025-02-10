package com.bibliotheque.models;

import jakarta.persistence.*;

@Entity
@Table(name = "livres")
public class Livre {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // @ManyToOne
    // @JoinColumn(name = "Utilisateur_id")
    // private Utilisateur utilisateur;

    @Column(nullable = false)
    private String titre;

    @Column(nullable = false)
    private String auteur;

    private String genre;
    private int anneePublication;
    private boolean disponible = true; // Par défaut, le livre est disponible

    // Constructeur
    public Livre() {}

    public Livre(String titre, String auteur, String genre, int anneePublication, boolean disponible) {
        this.titre = titre;
        this.auteur = auteur;
        this.genre = genre;
        this.anneePublication = anneePublication;
        this.disponible = disponible;
    }
     // Getters and Setters
     public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getTitre(){
        return titre;
    }
    
    public void setTitre(String titre){
        this.titre = titre;
    }

    public String getAuteur(){
        return auteur;
    }

    public void setAuteur(String auteur){
        this.auteur = auteur;
    }

    public String getGenre(){
        return genre;
    }

    public void setGenre(String genre){
        this.genre = genre;
    }

    public int getAnneePublication(){
        return anneePublication;
    }

    public void setAnneePublication(int anneePublication){
        this.anneePublication = anneePublication;
    }

    public boolean isDisponible(){
        return disponible;
    }
      
    public void setDisponible(boolean disponible){
        this.disponible = disponible;
    }
}