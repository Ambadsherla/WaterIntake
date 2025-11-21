package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User u = dao.login(username, password);

        if (u != null) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            session.setAttribute("user_id", u.getId());

            // Go to main page
            response.sendRedirect("index.jsp");
        } else {
            // Failed login – stay on login.jsp with error message
            request.setAttribute("error", "Invalid username or password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        // If someone hits /login directly, just show the login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
