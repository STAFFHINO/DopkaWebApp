package servlets;

import DAO.UserDAOImpl;
import DB.DBConnection;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());

            HttpSession session = req.getSession();
            String telegram = req.getParameter("telegram");
            String password = req.getParameter("password");

            if("@kak_kurit_admin".equals(telegram) &&
                    "admin".equals(password)){
                User user = User.builder().name("Admin").build();
                session.setAttribute("user", user);
                resp.sendRedirect("admin/adminHome.jsp");
            }
            else{
                User user = dao.login(telegram,password);
                if(user!=null){
                    session.setAttribute("user", user);
                    resp.sendRedirect("index.jsp");
                }
                else {
                    session.setAttribute("failMessage","User Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
