<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"employe".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Espace Employé</title>
</head>
<body>
    <h2>Bienvenue, <%= username %> (Employé)</h2>
    <a href="list_employe.jsp">Voir les employés</a> |
    <a href="logout.jsp">Se déconnecter</a>
</body>
</html>
