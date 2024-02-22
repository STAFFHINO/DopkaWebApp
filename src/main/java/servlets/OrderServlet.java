package servlets;

import DAO.CartDAOImpl;
import DAO.OrderDAOImpl;
import DB.DBConnection;
import entity.Cart;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = req.getSession();
            String name = req.getParameter("name");
            String telegram = req.getParameter("telegram");
            String phone = req.getParameter("phone");
            String payment = req.getParameter("payment");
            String address = "" + req.getParameter("house") + ", " + req.getParameter("street") + ", " + req.getParameter("city")
                    + ", " + req.getParameter("region") + ", " + req.getParameter("zipcode");

            CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
            OrderDAOImpl dao1 = new OrderDAOImpl(DBConnection.getConnection());
            List<Cart> carts = dao.getCartByIdUser("id_user");
            Random random = new Random();
            List<Order> orders = new ArrayList<Order>();
            for (Cart cart:carts){
                Order order = Order.builder().build();
                order.setOrderType("ALBUM-ORD-00"+random.nextInt(1000));
                order.setUserName(name);
                order.setUserTelegram(telegram);
                order.setUserPhone(phone);
                order.setUserAddress(address);
                order.setAlbumName(cart.getAlbumName());
                order.setGroupName(cart.getGroupName());
                order.setPrice(cart.getPrice());
                order.setPaymentMethod(payment);
                orders.add(order);
            }
            if("no".equals(payment)){
                session.setAttribute("failMessage", "Choose Payment Method");
                resp.sendRedirect("cart.jsp");
            } else {
                boolean flag = dao1.saveOrder(orders);
                if (flag) {
                    session.setAttribute("successMessage","Order Success");
                    resp.sendRedirect("orderSuccess.jsp");
                } else {
                    session.setAttribute("successMessage", "Something Wrong On Server");
                    resp.sendRedirect("cart.jsp");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
