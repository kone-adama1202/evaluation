<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, model.DatabaseConnection" %>

<%
    // Récupération du matricule depuis l'URL
    String matricule = request.getParameter("matricule");
    String message = "";
    boolean success = false;

    // Vérifier si un matricule est fourni
    if (matricule == null || matricule.isEmpty()) {
        response.sendRedirect("liste_employes.jsp");
        return;
    }

    // Déclaration des variables pour stocker les infos de l'employé
    String nom = "", prenom = "", fonction = "", service = "", dateEmbauche = "", sexe = "";
    double salaire = 0.0;
    int entrepriseId = 0;

    try {
        // Connexion à la base de données
        Connection conn = DatabaseConnection.getConnection();

        // Récupérer les informations de l'employé
        String sqlSelect = "SELECT * FROM employes WHERE matricule = ?";
        PreparedStatement stmtSelect = conn.prepareStatement(sqlSelect);
        stmtSelect.setString(1, matricule);
        ResultSet rs = stmtSelect.executeQuery();

        if (rs.next()) {
            nom = rs.getString("nom");
            prenom = rs.getString("prenom");
            fonction = rs.getString("fonction");
            service = rs.getString("service");
            dateEmbauche = rs.getString("date_embauche");
            sexe = rs.getString("sexe");
            salaire = rs.getDouble("salaire_base");
            entrepriseId = rs.getInt("entreprise_id");
        } else {
            message = "Aucun employé trouvé avec ce matricule.";
        }

        // Fermeture des ressources
        rs.close();
        stmtSelect.close();
    } catch (SQLException e) {
        message = "Erreur SQL : " + e.getMessage();
    }

    // Vérification si le formulaire est soumis
    if (request.getMethod().equalsIgnoreCase("POST")) {
        // Récupération des nouvelles valeurs du formulaire
        String newNom = request.getParameter("nomEmp");
        String newPrenom = request.getParameter("prenomEmp");
        String newFonction = request.getParameter("fonctionEmp");
        String newService = request.getParameter("serviceEmp");
        String newDateEmbauche = request.getParameter("dateEmbauche");
        String newSexe = request.getParameter("sexeEmp");
        String salaireStr = request.getParameter("salaireBase");
        String entrepriseIdStr = request.getParameter("entrepriseId");

        if (newNom != null && newPrenom != null && newFonction != null && newService != null &&
            newDateEmbauche != null && newSexe != null && salaireStr != null && entrepriseIdStr != null) {
            
            try {
                double newSalaire = Double.parseDouble(salaireStr);
                int newEntrepriseId = Integer.parseInt(entrepriseIdStr);

                // Connexion à la base de données
                Connection conn = DatabaseConnection.getConnection();

                // Mise à jour des informations de l'employé
                String sqlUpdate = "UPDATE employe SET nom = ?, prenom = ?, fonction = ?, service = ?, date_embauche = ?, sexe = ?, salaire_base = ?, entreprise_id = ? WHERE matricule = ?";
                PreparedStatement stmtUpdate = conn.prepareStatement(sqlUpdate);
                stmtUpdate.setString(1, newNom);
                stmtUpdate.setString(2, newPrenom);
                stmtUpdate.setString(3, newFonction);
                stmtUpdate.setString(4, newService);
                stmtUpdate.setString(5, newDateEmbauche);
                stmtUpdate.setString(6, newSexe);
                stmtUpdate.setDouble(7, newSalaire);
                stmtUpdate.setInt(8, newEntrepriseId);
                stmtUpdate.setString(9, matricule);

                // Exécuter la mise à jour
                int rowsUpdated = stmtUpdate.executeUpdate();
                if (rowsUpdated > 0) {
                    message = "Employé mis à jour avec succès.";
                    success = true;
                } else {
                    message = "Aucune modification effectuée.";
                }

                // Fermeture des ressources
                stmtUpdate.close();
                conn.close();
            } catch (SQLException e) {
                message = "Erreur SQL : " + e.getMessage();
            } catch (NumberFormatException e) {
                message = "Erreur de format des données.";
            }
        } else {
            message = "Tous les champs sont requis.";
        }
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un employé</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h2 class="text-center">Modifier un employé</h2>

    <% if (!message.isEmpty()) { %>
        <div class="alert <%= success ? "alert-success" : "alert-danger" %>">
            <%= message %>
        </div>
    <% } %>

    <form action="modifier_employe.jsp?matricule=<%= matricule %>" method="post" class="p-4 border rounded shadow bg-light">
        <div class="mb-3">
            <label class="form-label">Matricule :</label>
            <input type="text" name="matricule" class="form-control" value="<%= matricule %>" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Nom :</label>
            <input type="text" name="nomEmp" class="form-control" value="<%= nom %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Prénom :</label>
            <input type="text" name="prenomEmp" class="form-control" value="<%= prenom %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Fonction :</label>
            <input type="text" name="fonctionEmp" class="form-control" value="<%= fonction %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Service :</label>
            <input type="text" name="serviceEmp" class="form-control" value="<%= service %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Date d'embauche :</label>
            <input type="date" name="dateEmbauche" class="form-control" value="<%= dateEmbauche %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Sexe :</label>
            <select name="sexeEmp" class="form-select">
                <option value="M" <%= sexe.equals("M") ? "selected" : "" %>>Masculin</option>
                <option value="F" <%= sexe.equals("F") ? "selected" : "" %>>Féminin</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Salaire :</label>
            <input type="number" name="salaireBase" step="0.01" class="form-control" value="<%= salaire %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Entreprise :</label>
            <input type="number" name="entrepriseId" class="form-control" value="<%= entrepriseId %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Modifier</button>
        <a href="liste_employes.jsp" class="btn btn-secondary">Annuler</a>
    </form>

</body>
</html>