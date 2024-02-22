package DAO;

import entity.Album;
import entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO{
    private Connection connection;
    public CartDAOImpl(Connection connection){
        super();
        this.connection = connection;
    }
    public boolean addCart(Cart cart) {
        boolean flag = false;
        try{
            String sql = "insert into kpop_cart(id_album,id_user,album_name,group_name,price,total_price) values(?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cart.getIdAlbum());
            ps.setString(2,cart.getIdUser());
            ps.setString(3, cart.getAlbumName());
            ps.setString(4, cart.getGroupName());
            ps.setInt(5, cart.getPrice());
            ps.setInt(6, cart.getTotalPrice());

            int i = ps.executeUpdate();
            if(i==1){
                flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public List<Cart> getCartByIdUser(String id) {
        List<Cart> carts = new ArrayList<Cart>();
        try {
            String sql = "select * from kpop_cart where id_user =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            int totalPrice = 0;
            while (rs.next()){
                totalPrice += rs.getInt(7);
                Cart cart = Cart.builder()
                        .id(rs.getString(1))
                        .idAlbum(rs.getString(2))
                        .idUser(rs.getString(3))
                        .albumName(rs.getString(4))
                        .groupName(rs.getString(5))
                        .price(rs.getInt(6))
                        .totalPrice(totalPrice)
                        .build();

                carts.add(cart);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return carts;
    }

    @Override
    public boolean deleteAlbum(String idAlbum, String idUser, String id) {
        boolean flag = false;
        try {
            String sql = "delete from kpop_cart where id_album=? and id_user =? and id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,idAlbum);
            ps.setString(2,idUser);
            ps.setString(3,id);

            int i = ps.executeUpdate();
            if(i==1){
                flag = true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
