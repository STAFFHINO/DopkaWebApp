package entity;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Album {
    private String id;
    private String albumName;
    private String groupName;
    private int price;
    private String category;
    private String status;
    private String photoName;
    private String userTelegram;
}
