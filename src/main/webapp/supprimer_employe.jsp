<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.EmployeDAO, java.sql.Connection, model.DatabaseConnection" %>

<%
    // Connexion à la base de données
    Connection conn = DatabaseConnection.getConnection();
    EmployeDAO employeDAO = new EmployeDAO(conn);

    // Vérifie si un matricule est passé en paramètre
    String matricule = request.getParameter("matricule");

    if (matricule == null || matricule.isEmpty()) {
        out.println("<h3 style='color: red;'>Aucun employé spécifié pour la suppression.</h3>");
        return;
    }
    // Suppression confirmée
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        employeDAO.supprimerEmploye(matricule);
        out.println("<h3 style='color: green;'>Employé supprimé avec succès !</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Supprimer Employé</title>
</head>
<body>
    <h2>Confirmer la suppression</h2>
    <p>Voulez-vous vraiment supprimer l'employé avec le matricule <strong><%= matricule %></strong> ?</p>
    <form action="supprimer_employe.jsp" method="post">
        <input type="hidden" name="matricule" value="<%= matricule %>">
        <input type="submit" value="Confirmer la suppression">
    </form>
    <a href="liste_employes.jsp">Annuler</a>
</body>
</html>
