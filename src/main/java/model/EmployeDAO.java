package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeDAO {
    private Connection conn;

    public EmployeDAO(Connection conn) {
        this.conn = conn;
    }

    // Méthode pour ajouter un employé
    public void ajouterEmploye(Employe employe) throws SQLException {
        String sql = "INSERT INTO employes (nom, prenom, fonction, service, dateEmbauche, sexe, salaireBase, entrepriseId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, employe.getNomEmp());
            stmt.setString(2, employe.getPrenomEmp());
            stmt.setString(3, employe.getFonctionEmp());
            stmt.setString(4, employe.getServiceEmp());
            stmt.setString(5, employe.getDateEmbauche());
            stmt.setString(6, employe.getSexeEmp());
            stmt.setDouble(7, employe.getSalaireBase());
            stmt.setInt(8, employe.getEntrepriseId());

            stmt.executeUpdate();
        }
    }

    // Méthode pour récupérer un employé par son matricule
    public Employe getEmployeByMatricule(String matricule) throws SQLException {
        String sql = "SELECT * FROM employes WHERE matricule = ?";
        Employe employe = null;

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricule);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                employe = new Employe();
                employe.setMatricule(rs.getInt("matricule"));
                employe.setNomEmp(rs.getString("nom"));
                employe.setPrenomEmp(rs.getString("prenom"));
                employe.setFonctionEmp(rs.getString("fonction"));
                employe.setServiceEmp(rs.getString("service"));
                employe.setDateEmbauche(rs.getString("dateEmbauche"));
                employe.setSexeEmp(rs.getString("sexe"));
                employe.setSalaireBase(rs.getDouble("salaireBase"));
                employe.setEntrepriseId(rs.getInt("entrepriseId"));
            }
        }

        return employe;
    }

    // Méthode pour modifier un employé
    public boolean modifierEmploye(Employe employe) throws SQLException {
        String sql = "UPDATE employes SET nom = ?, prenom = ?, fonction = ?, service = ?, dateEmbauche = ?, sexe = ?, salaireBase = ?, entrepriseId = ? WHERE matricule = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, employe.getNomEmp());
            stmt.setString(2, employe.getPrenomEmp());
            stmt.setString(3, employe.getFonctionEmp());
            stmt.setString(4, employe.getServiceEmp());
            stmt.setString(5, employe.getDateEmbauche());
            stmt.setString(6, employe.getSexeEmp());
            stmt.setDouble(7, employe.getSalaireBase());
            stmt.setInt(8, employe.getEntrepriseId());
            stmt.setInt(9, employe.getMatricule()); 
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }
}