package servlet;

import dao.IntakeDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteIntakeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        new IntakeDAO().deleteIntake(id);

        response.sendRedirect("view.jsp");
    }
}
