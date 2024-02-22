package DAO;

import entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO{
    private Connection connection;
    public OrderDAOImpl(Connection connection){
        super();
        this.connection = connection;
    }

    public boolean saveOrder(List<Order> orders) {
        boolean flag = false;
        try {
            String sql = "insert into kpop_orders(order_type,user_name,user_telegram, address, user_phone_number, album_name, group_name, price, payment_method) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            for (Order order:orders){
                ps.setString(1,order.getOrderType());
                ps.setString(2,order.getUserName());
                ps.setString(3,order.getUserTelegram());
                ps.setString(4,order.getUserAddress());
                ps.setString(5,order.getUserPhone());
                ps.setString(6,order.getAlbumName());
                ps.setString(7,order.getGroupName());
                ps.setInt(8,order.getPrice());
                ps.setString(9,order.getPaymentMethod());
            }

            connection.commit();
            flag = true;
            connection.setAutoCommit(true);
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    public List<Order> getOrderDetailsByTelegram(String telegram) {
        List<Order> orders = new ArrayList<Order>();
        Order order = null;
        try {
            String sql = "select * from kpop_orders where telegram=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,telegram);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                order = Order.builder()
                        .id(rs.getString(1))
                        .orderType(rs.getString(2))
                        .userName(rs.getString(3))
                        .userTelegram(rs.getString(4))
                        .userAddress(rs.getString(5))
                        .userPhone(rs.getString(6))
                        .albumName(rs.getString(7))
                        .groupName(rs.getString(8))
                        .price(rs.getInt(9))
                        .paymentMethod(rs.getString(10))
                        .build();
                orders.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<Order>();
        Order order = null;
        try {
            String sql = "select * from kpop_orders";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                order = Order.builder()
                        .id(rs.getString(1))
                        .orderType(rs.getString(2))
                        .userName(rs.getString(3))
                        .userTelegram(rs.getString(4))
                        .userAddress(rs.getString(5))
                        .userPhone(rs.getString(6))
                        .albumName(rs.getString(7))
                        .groupName(rs.getString(8))
                        .price(rs.getInt(9))
                        .paymentMethod(rs.getString(10))
                        .build();
                orders.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return orders;
    }


}
