package entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class User {
    private String id;
    private String name;
    private String telegram;
    private String phoneNumber;
    private String password;
    private String house;
    private String street;
    private String city;
    private String region;
    private String zipcode;
}
