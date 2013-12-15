/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.Dao;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ProjectMemberModel;
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
        boolean redirect = false;
        String page = "dashboard";
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            ArrayList<ProjectModel> projects = new Dao().getAllProject((String) session.getAttribute("username"));
            request.setAttribute("projects", projects);
        }
        if (request.getParameter("do") != null) {
            String action = request.getParameter("do");
            ProjectModel project = null;
            switch (action) {
                case "create":
                    String projectname = (String) request.getParameter("projectname");
                    String desc = (String) request.getParameter("projectdesc");
                    String dateFrom = (String) request.getParameter("from");
                    String dateTo = (String) request.getParameter("from");
                    Date startDate = new Date(Integer.parseInt(dateFrom.substring(0, 4)) - 1900, Integer.parseInt(dateFrom.substring(5, 7)) - 1, Integer.parseInt(dateFrom.substring(8, 10)));
                    Date finisfDate = new Date(Integer.parseInt(dateTo.substring(0, 4)) - 1900, Integer.parseInt(dateTo.substring(5, 7)) - 1, Integer.parseInt(dateTo.substring(8, 10)));

                    project = new ProjectModel();
                    project.setProjectname(projectname);
                    project.setDesc(desc);
                    project.setStart_date(startDate);
                    project.setFinish_date(finisfDate);

                    if (new Dao().createProject(project, (String) session.getAttribute("username"))) {
                        page = "dashboard";
                    }
                    break;
                case "view":
                    if (request.getParameter("projectid") != null) {
                        int projectid = Integer.parseInt(request.getParameter("projectid"));
                        ArrayList<ProjectModel> projects = new Dao().getAllProject((String) session.getAttribute("username"));
                        boolean found = false;
                        int i = 0;
                        while (!found && i < projects.size()) {
                            if (projects.get(i).getProjectid() == projectid) {
                                project = projects.get(i);
                                found = true;
                            }
                            i++;
                        }
                        if (project != null) {
                            request.setAttribute("project", project);
                            ArrayList<ProjectMemberModel> member = new Dao().getProjectMember(project.getProjectid());
                            request.setAttribute("member", member);
                            page = "viewproject.jsp";
                        } else {
                            redirect = true;
                            page = "dashboard";
                        }
                    } else {
                        if (session.getAttribute("username") != null) {
                            ArrayList<ProjectModel> projects = new Dao().getAllProject((String) session.getAttribute("username"));
                            request.setAttribute("projects", projects);
                            page = "listproject.jsp";
                        }
                    }
                    break;
                case "delete":

                    break;
                case "edit":
                    int projectid = Integer.parseInt(request.getParameter("projectid"));
                    project = new Dao().getDataProject(projectid);
                    project.setProjectname((String.valueOf(request.getParameter("projectname"))));
                    project.setDesc((String.valueOf(request.getParameter("projectdesc"))));
                    if (new Dao().updateDataProject(project)) {
                        page = "project?do=view&projectid=" + projectid;
                    }
                    break;
                case "addmember":
                    int id = Integer.parseInt(request.getParameter("projectid"));
                    System.out.println(id);
                    String phrase = request.getParameter("member");
                    String delims = ";";
                    String[] addmember = phrase.split(delims);
                    ArrayList<String> errormember = new ArrayList<>();
                    for (String array : addmember) {
                        if (!new Dao().checkMember(array, id)) {
                            if (!new Dao().addMember(array, id)) {
                                errormember.add(array);
                            }
                        } else {
                            errormember.add(array);
                        }
                    }
                    page = "project?do=view&projectid=" + Integer.parseInt(request.getParameter("projectid"));
                    break;
                default:
                    redirect = true;
                    page = "dashboard";
                    break;
            }
        } else {
            redirect = true;
        }
        if (redirect) {
            response.sendRedirect(page);
        } else {
            request.getRequestDispatcher(page).forward(request, response);
        }
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
