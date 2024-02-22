package servlets;

import DAO.AlbumDAOImpl;
import DB.DBConnection;
import entity.Album;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/sellAlbum")
@MultipartConfig
public class SellAlbumServlet extends HttpServlet {
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
                    .status("Active")
                    .photoName(fileName)
                    .userTelegram(req.getParameter("telegram"))
                    .build();

            AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            boolean flag = dao.sellAlbum(albumDetails);
            HttpSession session = req.getSession();
            if(flag){
                String path = getServletContext().getRealPath("/album");
                File file = new File(path);
                part.write(path+File.separator+fileName);
                session.setAttribute("successMessage", "Album Add Successfully");
                resp.sendRedirect("sellAlbum.jsp");
            } else {
                session.setAttribute("failMessage", "Something Wrong On Server");
                resp.sendRedirect("sellAlbum.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
