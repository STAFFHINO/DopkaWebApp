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

@WebServlet("/register")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            String check = req.getParameter("check");
            User user = User.builder()
                    .name(req.getParameter("name"))
                    .telegram(req.getParameter("telegram"))
                    .phoneNumber(req.getParameter("phoneNumber"))
                    .password(req.getParameter("password"))
                    .build();

            HttpSession session = req.getSession();
            if(check!=null){
                UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
                boolean flag = dao.checkUser(user.getTelegram());
                if(flag) {
                    boolean flag1 = dao.userAreRegistered(user);

                    if (flag1) {
                        session.setAttribute("successMessage","Registration Successfully");
                        resp.sendRedirect("register.jsp");
                    } else {
                        session.setAttribute("failMessage","Something Wrong On Server");
                        resp.sendRedirect("register.jsp");
                    }
                } else {
                    session.setAttribute("failMessage","You are Already Registered");
                    resp.sendRedirect("register.jsp");
                }
            }
            else{
                session.setAttribute("failMessage", "Please, check Agree & Terms Condition");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
