package servlets;

import DAO.UserDAO;
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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            User user = User.builder()
                    .id(req.getParameter("id"))
                    .name(req.getParameter("name"))
                    .telegram(req.getParameter("telegram"))
                    .phoneNumber(req.getParameter("phone"))
                    .password(req.getParameter("password"))
                    .build();

            UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
            boolean flag = dao.checkPassword(user.getId(),user.getPassword());
            HttpSession session = req.getSession();

            if(flag){
                boolean flag1 = dao.updateProfile(user);
                if(flag1){
                    session.setAttribute("successMessage", "Profile Update Successfully");
                    resp.sendRedirect("editProfile.jsp");
                } else {
                    session.setAttribute("failMessage", "Something Wrong On Server");
                    resp.sendRedirect("editProfile.jsp");
                }
            }else{
                session.setAttribute("failMessage", "Password Incorrect");
                resp.sendRedirect("editProfile.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
