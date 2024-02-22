package servlets.admin;

import DAO.AlbumDAOImpl;
import DB.DBConnection;
import entity.Album;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/adminAddAlbum")
@MultipartConfig
public class AddAlbumServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            Part part = req.getPart("photo");
            String fileName = part.getSubmittedFileName();

            Album albumDetails = Album.builder()
                    .albumName(req.getParameter("name"))
                    .groupName(req.getParameter("group"))
                    .price(Integer.parseInt(req.getParameter("price")))
                    .category(req.getParameter("category"))
                    .status(req.getParameter("status"))
                    .photoName(fileName)
                    .userTelegram("@kak_kurit")
                    .build();

            AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            boolean flag = dao.addAlbum(albumDetails);
            HttpSession session = req.getSession();
            if(flag){
                String path = getServletContext().getRealPath("/album");
                File file = new File(path);
                part.write(path+File.separator+fileName);
                session.setAttribute("successMessage", "Album Add Successfully");
                resp.sendRedirect("admin/adminAddAlbum.jsp");
            } else {
                session.setAttribute("failMessage", "Something Wrong On Server");
                resp.sendRedirect("admin/adminAddAlbum.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
