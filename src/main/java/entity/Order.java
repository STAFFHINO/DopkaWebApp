package entity;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Order {
    private String id;
    private String orderType;
    private String userName;
    private String userTelegram;
    private String userAddress;
    private String userPhone;
    private String albumName;
    private String groupName;
    private int price;
    private String paymentMethod;

}
