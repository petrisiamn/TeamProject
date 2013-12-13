/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.Dao;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ProjectModel;

/**
 *
 * @author Adiputra Setiawan
 */
@WebServlet(name = "Project", urlPatterns = {"/project"})
public class Project extends HttpServlet {

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
        ProjectModel project;
        String page = "#";
        switch (action) {
            case "create":
                String projectname = (String) request.getParameter("projectname");
                String desc = (String) request.getParameter("projectdesc");
                String dateFrom = (String) request.getParameter("from");
                String dateTo = (String) request.getParameter("from");
                Date startDate = new Date(Integer.parseInt(dateFrom.substring(0, 4))-1900, Integer.parseInt(dateFrom.substring(5, 7))-1, Integer.parseInt(dateFrom.substring(8, 10)));
                Date finisfDate = new Date(Integer.parseInt(dateTo.substring(0, 4))-1900, Integer.parseInt(dateTo.substring(5, 7))-1, Integer.parseInt(dateTo.substring(8, 10)));
                
                project = new ProjectModel();
                project.setProjectname(projectname);
                project.setDesc(desc);
                project.setStart_date(startDate);
                project.setFinish_date(finisfDate);
                
                if(new Dao().createProject(project,(String)session.getAttribute("username"))){
                    page = "dashboard";
                }
                break;
            case "view":
                int projectid = Integer.parseInt(request.getParameter("projectid"));
                project = new Dao().getDataProject(projectid);
                break;
            case "delete":

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
