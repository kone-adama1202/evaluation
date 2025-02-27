<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="model.DatabaseConnection, model.EmployeDAO, model.Employe" %>

<%
    Connection conn = null;

    try {
        System.out.println("Données du formulaire reçues :");

        conn = DatabaseConnection.getConnection();
        EmployeDAO employeDAO = new EmployeDAO(conn);

        // Récupération des données du formulaire
        String nomEmp = request.getParameter("nomEmp");
        String prenomEmp = request.getParameter("prenomEmp");
        String fonctionEmp = request.getParameter("fonctionEmp");
        String serviceEmp = request.getParameter("serviceEmp");
        String dateEmbauche = request.getParameter("dateEmbauche");
        String sexeEmp = request.getParameter("sexeEmp");

        System.out.println("nomEmp : " + nomEmp);
        System.out.println("prenomEmp : " + prenomEmp);
        System.out.println("fonctionEmp : " + fonctionEmp);
        System.out.println("serviceEmp : " + serviceEmp);
        System.out.println("dateEmbauche : " + dateEmbauche);
        System.out.println("sexeEmp : " + sexeEmp);

        double salaireBase = 0;
        int entrepriseId = 0;

        try {
            salaireBase = Double.parseDouble(request.getParameter("salaireBase"));
            entrepriseId = Integer.parseInt(request.getParameter("entrepriseId"));

            System.out.println("salaireBase : " + salaireBase);
            System.out.println("entrepriseId : " + entrepriseId);
        } catch (NumberFormatException e) {
            System.out.println("Erreur de conversion des valeurs numériques : " + e.getMessage());
            throw new Exception("Erreur : Vérifiez que le salaire et l'entreprise sont bien des valeurs numériques.");
        }

        // Vérification que tous les champs sont remplis
        if (nomEmp != null && !nomEmp.isEmpty() &&
            prenomEmp != null && !prenomEmp.isEmpty() &&
            fonctionEmp != null && !fonctionEmp.isEmpty() &&
            serviceEmp != null && !serviceEmp.isEmpty() &&
            dateEmbauche != null && !dateEmbauche.isEmpty() &&
            sexeEmp != null && !sexeEmp.isEmpty()) {

            // Création de l'objet Employe
            System.out.println("Création de l'employé...");
            //Employe employe = new Employe(0, nomEmp, prenomEmp, fonctionEmp, serviceEmp, dateEmbauche, sexeEmp, salaireBase, entrepriseId);
            Employe employe = new Employe();
            //System.out.println("Employé créé : " + employe);

            // Ajout de l'employé en base de données
            //employeDAO.ajouterEmploye(employe);
            //System.out.println("Employé ajouté en base de données.");

            // Redirection vers la liste des employés après l'ajout
            //response.sendRedirect("list_employe.jsp");
            return;
        } else {
            System.out.println("Champs manquants dans le formulaire.");
            throw new Exception("Veuillez remplir tous les champs obligatoires.");
        }
    } catch (Exception e) {
        System.out.println("Erreur : " + e.getMessage());
        e.printStackTrace(); // ✅ Affiche l'erreur complète en console
        request.setAttribute("errorMessage", e.getMessage());
        request.getRequestDispatcher("ajout_employe.jsp").forward(request, response);
    } finally {
        if (conn != null) try { conn.close(); } catch (Exception ignore) {}
    }
%>
