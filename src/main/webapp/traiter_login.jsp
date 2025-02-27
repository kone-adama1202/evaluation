<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/evaluation", "root", "");

        String sql = "SELECT * FROM utilisateur WHERE username = ? AND password = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("username", username);
            session.setAttribute("role", rs.getString("role"));

            if ("admin".equals(rs.getString("role"))) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("employe.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    } catch (Exception e) {
        out.println("Erreur : " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
