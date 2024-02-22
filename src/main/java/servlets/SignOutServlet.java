package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class SignOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try{
            HttpSession session = req.getSession();
            session.removeAttribute("user");

            HttpSession session1 = req.getSession();
            session.setAttribute("succeessMessage", "LogOut Successfully");
            resp.sendRedirect("index.jsp");
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
