package servlets;

import DAO.AlbumDAOImpl;
import DAO.CartDAOImpl;
import DB.DBConnection;
import entity.Album;
import entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            Album album = dao.getAlbumById(req.getParameter("id_album"));
            Cart cart = Cart.builder()
                    .idUser(req.getParameter("id_user"))
                    .idAlbum(album.getId())
                    .albumName(album.getAlbumName())
                    .groupName(album.getGroupName())
                    .price(album.getPrice())
                    .totalPrice(album.getPrice())
                    .build();

            CartDAOImpl dao1 = new CartDAOImpl(DBConnection.getConnection());
            boolean flag = dao1.addCart(cart);
            HttpSession session=req.getSession();
            if (flag){
                session.setAttribute("successMessage", "Album Added To Cart");
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("failMessage", "Something Wrong On Server");
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
