package model;

public class Entreprise {
    private int id;  // Ajout de l'ID
    private String nomEntreprise;
    private String adressEnt;
    private String dateCreation;
    private double chiffreAffaire;

    // ✅ Constructeur par défaut
    public Entreprise() {
    }

    // ✅ Constructeur avec paramètres
    public Entreprise(int id, String nomEntreprise, String adressEnt, String dateCreation, double chiffreAffaire) {
        this.id = id;
        this.nomEntreprise = nomEntreprise;
        this.adressEnt = adressEnt;
        this.dateCreation = dateCreation;
        this.chiffreAffaire = chiffreAffaire;
    }

    // ✅ Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomEntreprise() {
        return nomEntreprise;
    }

    public void setNomEntreprise(String nomEntreprise) {
        this.nomEntreprise = nomEntreprise;
    }

    public String getAdressEnt() {
        return adressEnt;
    }

    public void setAdressEnt(String adressEnt) {
        this.adressEnt = adressEnt;
    }

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    public double getChiffreAffaire() {
        return chiffreAffaire;
    }

    public void setChiffreAffaire(double chiffreAffaire) {
        this.chiffreAffaire = chiffreAffaire;
    }

    // ✅ Méthode toString() pour afficher les infos de l'entreprise
    @Override
    public String toString() {
        return "Entreprise{" +
                "id=" + id +
                ", nomEntreprise='" + nomEntreprise + '\'' +
                ", adressEnt='" + adressEnt + '\'' +
                ", dateCreation='" + dateCreation + '\'' +
                ", chiffreAffaire=" + chiffreAffaire +
                '}';
    }
}
