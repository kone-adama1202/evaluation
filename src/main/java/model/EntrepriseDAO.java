package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EntrepriseDAO {
    private Connection conn;

    // ✅ Utilisation d'un constructeur avec Connection
    public EntrepriseDAO(Connection connection) {
        this.conn = connection;
    }

    // ✅ Ajout d'une surcharge pour créer une connexion si nécessaire
    public EntrepriseDAO() {
        try {
            this.conn = DatabaseConnection.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ✅ Ajout d'une méthode pour fermer la connexion proprement
    public void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ✅ Ajouter une entreprise
    public void ajouterEntreprise(Entreprise entreprise) {
        String sql = "INSERT INTO entreprise (nomEntreprise, adressEnt, date_creation, chiffre_affaire) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, entreprise.getNomEntreprise());
            stmt.setString(2, entreprise.getAdressEnt());
            stmt.setString(3, entreprise.getDateCreation());
            stmt.setDouble(4, entreprise.getChiffreAffaire());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ✅ Obtenir toutes les entreprises
    public List<Entreprise> getToutesEntreprises() {
        List<Entreprise> entreprises = new ArrayList<>();
        String sql = "SELECT * FROM entreprise";
        
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Entreprise ent = new Entreprise();
                ent.setId(rs.getInt("id"));
                ent.setNomEntreprise(rs.getString("nomEntreprise"));
                ent.setAdressEnt(rs.getString("adressEnt"));
                ent.setDateCreation(rs.getString("date_creation"));
                ent.setChiffreAffaire(rs.getDouble("chiffre_affaire"));
                entreprises.add(ent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entreprises;
    }

    // ✅ Supprimer une entreprise par ID
    public void supprimerEntreprise(int id) {
        String sql = "DELETE FROM entreprise WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
