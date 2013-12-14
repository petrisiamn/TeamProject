/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserModel;

/**
 *
 * @author Adiputra Setiawan
 */
@WebServlet(name = "Account", urlPatterns = {"/account"})
public class Account extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("do");
        HttpSession session = request.getSession();
        String uname;
        String email;
        String pass;
        String page = "#";
        switch (action) {
            case "login":
                uname = (String) request.getParameter("username");
                pass = (String) request.getParameter("password");
                if (new Dao().UserLogin(uname, pass)) {
                    UserModel user = new Dao().getDataUser(uname);
                    session.setAttribute("username", user.getUsername());
                    page = "dashboard";
                } else {
                    page = "login.jsp";
                    request.setAttribute("error", "error");
                }
                break;
            case "register":
                uname = (String) request.getParameter("username");
                email = (String) request.getParameter("email");
                pass = (String) request.getParameter("password");
                UserModel user = new UserModel();
                user.setUsername(uname);
                user.setEmail(email);
                if (new Dao().UserRegister(user, pass)) {
                    page = "registration.html";
                } else {
                    page = "login.jsp";
                }
                break;
            case "logout":
                session.removeAttribute("username");
                session.invalidate();
                page = "/dashboard";
                break;
        }
        request.getRequestDispatcher(page).forward(request, response);
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
