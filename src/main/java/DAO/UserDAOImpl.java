package DAO;

import entity.Album;
import entity.User;

import java.security.spec.ECField;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements UserDAO {
    private Connection connection;

    public UserDAOImpl(Connection connection) {
        super();
        this.connection = connection;
    }

    public boolean userAreRegistered(User user) {
        boolean flag = false;
        try {
            String sql = "insert into kpop_users (name, telegram, phone_number, password) values(?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getTelegram());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public User login(String telegram, String password) {
        User user=null;
        boolean flag = false;
        try {
            String sql="select * from kpop_users where telegram=? and password=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1, telegram);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                user= User.builder()
                        .id(rs.getString(1))
                        .name(rs.getString(2))
                        .telegram(rs.getString(3))
                        .phoneNumber(rs.getString(4))
                        .password(rs.getString(5))
                        .house(rs.getString(6))
                        .street(rs.getString(7))
                        .city(rs.getString(8))
                        .region(rs.getString(9))
                        .zipcode(rs.getString(10))
                        .build();
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }

    public boolean checkPassword(String id,String password) {
        boolean flag = false;
        try {
            String sql = "select * from kpop_users where id=? and password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2,password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                flag = true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updateProfile(User user) {
        boolean flag = false;
        try {
            String sql = "update kpop_users set name=?, telegram=?, phone_number=? where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2,user.getTelegram());
            ps.setString(3,user.getPhoneNumber());
            ps.setString(4,user.getId());

            int i = ps.executeUpdate();
            if(i==1){
                flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public boolean checkUser(String telegram) {
        boolean flag = true;
        try{
            String sql = "select * from kpop_users where telegram=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,telegram);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                flag = false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
