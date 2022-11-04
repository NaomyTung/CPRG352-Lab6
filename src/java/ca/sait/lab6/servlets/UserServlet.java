/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ca.sait.lab6.servlets;

import ca.sait.lab6.models.Role;
import ca.sait.lab6.models.User;
import ca.sait.lab6.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author naomy
 */
public class UserServlet extends HttpServlet {

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();
        
        try {
            List<User> users = service.getAll();
            request.setAttribute("users", users);
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         UserService service = new UserService();
         String action = request.getParameter("action");
        
         try {
            if (action.equals("add")) {
                 String email = request.getParameter("email");
                 String fname = request.getParameter("fn");
                 String lname = request.getParameter("ln");
                 String password = request.getParameter("pw");
                service.insert(email, true, fname, lname, password, new Role(1, ""));
                List<User> users = service.getAll();
                request.setAttribute("users", users);
            }
            else if (action.equals("delete")) {
                String email = request.getParameter("email");
                
                User userDB = service.get(email);  
                
                service.delete(email);
                List<User> users = service.getAll();
                request.setAttribute("users", users);
            }
            else if (action.equals("update")) {
                 String roleName = "";
                 String email = request.getParameter("email");
                 String fname = request.getParameter("fn");
                 String lname = request.getParameter("ln");
                 String password = request.getParameter("pw");
                 int roleId = Integer.parseInt(request.getParameter("roleid"));
                 
                 User userDB = service.get(email);
                 if (roleId == 1 || roleId == 2 || roleId == 3 ) {
                     if (roleId == 1) {
                     roleName = "system admin";
                    } else if (roleId == 2) {
                       roleName = "regular user";

                    } else {
                       roleName = "company admin";

                    }
                    service.update(email, userDB.isActive(), fname, lname, password, new Role(roleId, roleName));
                 }

                List<User> users = service.getAll();
                request.setAttribute("users", users);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        
    }

}
