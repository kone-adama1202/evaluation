<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Employe, model.EmployeDAO, java.sql.Connection, model.DatabaseConnection" %>
<%
    Connection conn = DatabaseConnection.getConnection();
    EmployeDAO employeDAO = new EmployeDAO(conn);
    List<Employe> employes = employeDAO.getTousEmployes();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des employés</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f8f8;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-modify {
            background-color: #ffc107;
            color: #000;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .btn-modify:hover {
            background-color: #e0a800;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h2>Liste des employés</h2>
    <table>
        <tr>
            <th>Matricule</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Fonction</th>
            <th>Service</th>
            <th>Date Embauche</th>
            <th>Sexe</th>
            <th>Salaire</th>
            <th>Entreprise</th>
            <th>Actions</th>
        </tr>
        <% for (Employe emp : employes) { %>
        <tr>
            <td><%= emp.getMatricule() %></td>
            <td><%= emp.getNomEmp() %></td>
            <td><%= emp.getPrenomEmp() %></td>
            <td><%= emp.getFonctionEmp() %></td>
            <td><%= emp.getServiceEmp() %></td>
            <td><%= emp.getDateEmbauche() %></td>
            <td><%= emp.getSexeEmp() %></td>
            <td><%= emp.getSalaireBase() %></td>
            <td><%= emp.getEntrepriseId() %></td>
            <td class="actions">
                <a href="modifier_employe.jsp?matricule=<%= emp.getMatricule() %>" class="btn btn-modify">Modifier</a>
                <a href="supprimer_employe.jsp?matricule=<%= emp.getMatricule() %>" class="btn btn-delete" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet employé ?')">Supprimer</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>