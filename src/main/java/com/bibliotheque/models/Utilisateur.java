package com.bibliotheque.models;

// import java.util.List;
// import java.util.ArrayList;
import jakarta.persistence.*;

@Entity
@Table(name = "utilisateurs")
public class Utilisateur {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // @OneToMany(mappedBy = "utilisateur", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    // private List<Livre> livres = new ArrayList<>();

    @Column(nullable = false)
    private String nom;

    @Column(nullable = false, unique = true)
    private String email;

    private String numeroTelephone;

    // Constructeur
    public Utilisateur() {}

    public Utilisateur(String nom, String email, String numeroTelephone) {
        this.nom = nom;
        this.email = email;
        this.numeroTelephone = numeroTelephone;
    }

    // Getters and Setters
    
    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getNom(){
        return nom;
    }

    public void setNom(String nom){
        this.nom  = nom;
    }

    public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public String getnumeroTelephone(){
        return numeroTelephone;
    }

    public void setnumeroTelephone(String numeroTelephone){
        this.numeroTelephone = numeroTelephone;
    }

}