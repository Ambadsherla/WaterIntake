package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddIntakeFormServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("addIntake.jsp").forward(request, response);
    }
}
