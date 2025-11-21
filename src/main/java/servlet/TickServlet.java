package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.IntakeDAO;

public class TickServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        IntakeDAO dao = new IntakeDAO();
        dao.updateStatus(id, "done");

        response.sendRedirect("index.jsp");
    }
}
