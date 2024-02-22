package servlets;

import DAO.AlbumDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userDeleteAlbum")
public class UserDeleteAlbumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            String id = req.getParameter("id");
            AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            boolean flag = dao.deleteAlbum(id);
            HttpSession session = req.getSession();
            if(flag){
                session.setAttribute("successMessage", "Album Delete Successfully");
                resp.sendRedirect("userOldAlbums.jsp");
            }
            else{
                session.setAttribute("falseMessage", "Something wrong on Server");
                resp.sendRedirect("userOldAlbums.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
