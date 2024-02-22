package DAO;

import entity.User;

public interface UserDAO {
    public boolean userAreRegistered(User user);
    public User login(String telegram, String password);
    public boolean checkPassword(String id,String password);
    public boolean updateProfile(User user);
    public boolean checkUser(String telegram);
}
