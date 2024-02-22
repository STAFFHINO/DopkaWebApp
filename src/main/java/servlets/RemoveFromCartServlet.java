package servlets;

import DAO.CartDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String idAlbum = req.getParameter("id_album");
        String idUser = req.getParameter("id_user");
        try {
            CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
            boolean flag = dao.deleteAlbum(idAlbum, idUser, id);
            HttpSession session = req.getSession();
            if (flag){
                session.setAttribute("successMessage", "Album Delete From Cart Successfully");
                resp.sendRedirect("cart.jsp");
            }
            else{
                session.setAttribute("falseMessage", "Something wrong on Server");
                resp.sendRedirect("cart.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }

    }
}
