package servlet;

import dao.IntakeDAO;
import model.Intake;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddIntakeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        int amount = Integer.parseInt(request.getParameter("amount"));
        String time = request.getParameter("time");
        String date = request.getParameter("date");

        // Get user id from session (multi-user support)
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user_id");

        // Correct constructor (fixed error)
        Intake intake = new Intake(amount, time, date, "pending", userId);

        // Save to database
        IntakeDAO dao = new IntakeDAO();
        dao.addIntake(intake);

        // Redirect back to index (TO-DO page)
        response.sendRedirect("index.jsp");
    }
}
