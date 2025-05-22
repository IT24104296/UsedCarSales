package Login.app;

import com.app.RegisterDB;
import com.app.User;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Login/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("regName");
        String password = request.getParameter("password");

        // Since validate() requires all fields, but we only have name and password,
        // pass dummy values for the unused fields.
        List<User> users = RegisterDB.validate(username, "", "", "", password);

        if (!users.isEmpty()) {
            // Login success
            request.getRequestDispatcher("/Login/login_success.jsp").forward(request, response);
        } else {
            // Login failed (unregistered user)
            request.getRequestDispatcher("/Login/login_error.jsp").forward(request, response);
        }
    }
}
