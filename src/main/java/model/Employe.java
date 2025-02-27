package model;

public class Employe {
    private int matricule;
    private String nomEmp;
    private String prenomEmp;
    private String fonctionEmp;
    private String serviceEmp;
    private String dateEmbauche;
    private String sexeEmp;
    private double salaireBase;
    private int entrepriseId;

    // ✅ Constructeur par défaut
    public Employe() {
    }

    // ✅ Constructeur avec paramètres
    public Employe(int matricule, String nomEmp, String prenomEmp, String fonctionEmp, String serviceEmp, String dateEmbauche, String sexeEmp, double salaireBase, int entrepriseId) {
        this.matricule = matricule;
        this.nomEmp = nomEmp;
        this.prenomEmp = prenomEmp;
        this.fonctionEmp = fonctionEmp;
        this.serviceEmp = serviceEmp;
        this.dateEmbauche = dateEmbauche;
        this.sexeEmp = sexeEmp;
        this.salaireBase = salaireBase;
        this.entrepriseId = entrepriseId;
    }

    // ✅ Getters et Setters
    public int getMatricule() {
        return matricule;
    }

    public void setMatricule(int matricule) {
        this.matricule = matricule;
    }

    public String getNomEmp() {
        return nomEmp;
    }

    public void setNomEmp(String nomEmp) {
        this.nomEmp = nomEmp;
    }

    public String getPrenomEmp() {
        return prenomEmp;
    }

    public void setPrenomEmp(String prenomEmp) {
        this.prenomEmp = prenomEmp;
    }

    public String getFonctionEmp() {
        return fonctionEmp;
    }

    public void setFonctionEmp(String fonctionEmp) {
        this.fonctionEmp = fonctionEmp;
    }

    public String getServiceEmp() {
        return serviceEmp;
    }

    public void setServiceEmp(String serviceEmp) {
        this.serviceEmp = serviceEmp;
    }

    public String getDateEmbauche() {
        return dateEmbauche;
    }

    public void setDateEmbauche(String dateEmbauche) {
        this.dateEmbauche = dateEmbauche;
    }

    public String getSexeEmp() {
        return sexeEmp;
    }

    public void setSexeEmp(String sexeEmp) {
        this.sexeEmp = sexeEmp;
    }

    public double getSalaireBase() {
        return salaireBase;
    }

    public void setSalaireBase(double salaireBase) {
        this.salaireBase = salaireBase;
    }

    public int getEntrepriseId() {
        return entrepriseId;
    }

    public void setEntrepriseId(int entrepriseId) {
        this.entrepriseId = entrepriseId;
    }

    // ✅ Méthode toString() pour afficher les infos de l'employé
    @Override
    public String toString() {
        return "Employe{" +
                "matricule=" + matricule +
                ", nomEmp='" + nomEmp + '\'' +
                ", prenomEmp='" + prenomEmp + '\'' +
                ", fonctionEmp='" + fonctionEmp + '\'' +
                ", serviceEmp='" + serviceEmp + '\'' +
                ", dateEmbauche='" + dateEmbauche + '\'' +
                ", sexeEmp='" + sexeEmp + '\'' +
                ", salaireBase=" + salaireBase +
                ", entrepriseId=" + entrepriseId +
                '}';
    }

	
}