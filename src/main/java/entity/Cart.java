package entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Cart {
    private String id;
    private String idAlbum;
    private String idUser;
    private String albumName;
    private String groupName;
    private int price;
    private int totalPrice;
}
