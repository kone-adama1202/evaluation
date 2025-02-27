<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException, model.DatabaseConnection" %>

<%
    // Vérifier si le formulaire a été soumis
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nomEmp = request.getParameter("nomEmp");
        String prenomEmp = request.getParameter("prenomEmp");
        String fonctionEmp = request.getParameter("fonctionEmp");
        String serviceEmp = request.getParameter("serviceEmp");
        String dateEmbauche = request.getParameter("dateEmbauche");
        String sexeEmp = request.getParameter("sexeEmp");
        String salaireBaseStr = request.getParameter("salaireBase");
        String entrepriseIdStr = request.getParameter("entrepriseId");

        try {
            double salaireBase = Double.parseDouble(salaireBaseStr);
            int entrepriseId = Integer.parseInt(entrepriseIdStr);
            Connection conn = DatabaseConnection.getConnection();

            String sql = "INSERT INTO employe (nomEmp, prenomEmp, fonctionEmp, serviceEmp, dateEmbauche, sexeEmp, salaireBase, entreprise_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nomEmp);
            stmt.setString(2, prenomEmp);
            stmt.setString(3, fonctionEmp);
            stmt.setString(4, serviceEmp);
            stmt.setString(5, dateEmbauche);
            stmt.setString(6, sexeEmp);
            stmt.setDouble(7, salaireBase);
            stmt.setInt(8, entrepriseId);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                message = "Employé ajouté avec succès !";
            }
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            message = "Erreur SQL : " + e.getMessage();
        } catch (NumberFormatException e) {
            message = "Erreur : Veuillez entrer un salaire et un ID d'entreprise valides.";
        }
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajout Employé</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            margin-top : 60px ;
            max-width: 500px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="date"], input[type="number"], select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="text"]:focus, input[type="date"]:focus, input[type="number"]:focus, select:focus {
            border-color: #007bff;
            outline: none;
        }
        button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Ajouter un Employé</h2>
        
        <% if (!message.isEmpty()) { %>
            <div class="message <%= message.contains("succès") ? "success" : "error" %>">
                <%= message %>
            </div>
        <% } %>

        <form action="ajout_employe.jsp" method="post">
            <label for="nomEmp">Nom :</label>
            <input type="text" id="nomEmp" name="nomEmp" required>

            <label for="prenomEmp">Prénom :</label>
            <input type="text" id="prenomEmp" name="prenomEmp" required>

            <label for="fonctionEmp">Fonction :</label>
            <input type="text" id="fonctionEmp" name="fonctionEmp" required>

            <label for="serviceEmp">Service :</label>
            <input type="text" id="serviceEmp" name="serviceEmp" required>

            <label for="dateEmbauche">Date d'embauche :</label>
            <input type="date" id="dateEmbauche" name="dateEmbauche" required>

            <label for="sexeEmp">Sexe :</label>
            <select id="sexeEmp" name="sexeEmp" required>
                <option value="M">Masculin</option>
                <option value="F">Féminin</option>
            </select>

            <label for="salaireBase">Salaire de base :</label>
            <input type="number" step="0.01" id="salaireBase" name="salaireBase" required>

            <label for="entrepriseId">ID de l'entreprise :</label>
            <input type="number" id="entrepriseId" name="entrepriseId" required>

            <button type="submit">Ajouter</button>
        </form>
    </div>
</body>
</html>