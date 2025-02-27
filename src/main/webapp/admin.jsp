<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("username") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Admin</title>
    <style>
        /* Styles généraux */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .menu a {
            display: block;
            text-decoration: none;
            color: white;
            background: #007BFF;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            font-weight: 600;
            transition: 0.3s ease-in-out;
        }

        .menu a:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }

        .logout {
            background: #e63946 !important;
        }

        .logout:hover {
            background: #b22222 !important;
        }

        /* Animation d'apparition */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bienvenue, Admin 👨‍💼</h2>
        <div class="menu">
            <a href="list_employe.jsp">📋 Gérer les employés</a>
            <a href="ajout_entreprise.jsp">🏢 Ajouter une entreprise</a>
            <a href="ajout_employe.jsp">👨‍💼 Ajouter un employé</a>
            <a href="logout.jsp" class="logout">🚪 Se déconnecter</a>
        </div>
    </div>
</body>
</html>
