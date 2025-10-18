package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cinema_db", "root", "Ritesh@2005"
            );

            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String role = rs.getString("role");

                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("role", role);
                session.setAttribute("email", email);

                // ✅ Optional: Only log in users with role = "user"
                if (role != null && role.equalsIgnoreCase("user")) {
                    response.sendRedirect("userDashboard.jsp");
                } else {
                    response.getWriter().println("<script>alert('Access denied: Invalid role');window.location='login.jsp';</script>");
                }

            } else {
                response.getWriter().println("<script>alert('Invalid email or password');window.location='login.jsp';</script>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
