<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException, model.DatabaseConnection" %>

<%
    // Vérifier si le formulaire a été soumis
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nomEntreprise = request.getParameter("nomEntreprise");
        String adressEnt = request.getParameter("adressEnt");
        String dateCreation = request.getParameter("date_creation");
        String chiffreAffaireStr = request.getParameter("chiffre_affaire");

        try {
            double chiffreAffaire = Double.parseDouble(chiffreAffaireStr);
            Connection conn = DatabaseConnection.getConnection();

            String sql = "INSERT INTO entreprise (nomEntreprise, adressEnt, date_creation, chiffre_affaire) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nomEntreprise);
            stmt.setString(2, adressEnt);
            stmt.setString(3, dateCreation);
            stmt.setDouble(4, chiffreAffaire);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                message = "Entreprise ajoutée avec succès !";
            }
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            message = "Erreur SQL : " + e.getMessage();
        } catch (NumberFormatException e) {
            message = "Erreur : Veuillez entrer un chiffre d'affaire valide.";
        }
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajout Entreprise</title>
</head>
<body>
    <h2>Ajouter une Entreprise</h2>
    
    <% if (!message.isEmpty()) { %>
        <p><%= message %></p>
    <% } %>

    <form action="ajout_entreprise.jsp" method="post">
        <label for="nomEntreprise">Nom de l'entreprise :</label>
        <input type="text" id="nomEntreprise" name="nomEntreprise" required><br>

        <label for="adressEnt">Adresse :</label>
        <input type="text" id="adressEnt" name="adressEnt"><br>

        <label for="date_creation">Date de création :</label>
        <input type="date" id="date_creation" name="date_creation" required><br>

        <label for="chiffre_affaire">Chiffre d'affaire :</label>
        <input type="number" step="0.01" id="chiffre_affaire" name="chiffre_affaire" required><br>

        <button type="submit">Ajouter</button>
    </form>
</body>
</html>
