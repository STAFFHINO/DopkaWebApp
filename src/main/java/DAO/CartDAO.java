package DAO;

import entity.Cart;

import java.util.List;

public interface CartDAO {
    public boolean addCart(Cart cart);
    public List<Cart> getCartByIdUser(String id);
    public boolean deleteAlbum(String idAlbum, String idUser, String id);
}
