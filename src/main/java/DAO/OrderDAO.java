package DAO;

import entity.Order;

import java.util.List;

public interface OrderDAO {
    public boolean saveOrder(List<Order> orders);
    public List<Order> getOrderDetailsByTelegram(String telegram);
    public List<Order> getAllOrders();
}
