package servlets.admin;

import DAO.AlbumDAOImpl;
import DB.DBConnection;
import entity.Album;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/adminEditAlbum")
public class EditAlbumServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            Album albumDetails = Album.builder()
                    .id(req.getParameter("id"))
                    .albumName(req.getParameter("name"))
                    .groupName(req.getParameter("group"))
                    .price(Integer.parseInt(req.getParameter("price")))
                    .status(req.getParameter("status"))
                    .build();

            AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            boolean flag = dao.updateEditAlbum(albumDetails);
            HttpSession session = req.getSession();
            if(flag){
                session.setAttribute("successMessage", "Album Edit Successfully");
                resp.sendRedirect("admin/adminAlbums.jsp");
            } else {
                session.setAttribute("failMessage", "Something Wrong On Server");
                resp.sendRedirect("admin/adminAlbums.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}