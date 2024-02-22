package DAO;

import entity.Album;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AlbumDAOImpl implements AlbumDAO{
    private Connection connection;
    public AlbumDAOImpl(Connection connection){
        super();
        this.connection = connection;
    }
    public boolean addAlbum(Album albumDetails){
        boolean flag = false;
        try{
            String sql = "insert into kpop_albums(album_name, group_name, price, category, status, photo, user_telegram) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, albumDetails.getAlbumName());
            ps.setString(2, albumDetails.getGroupName());
            ps.setInt(3, albumDetails.getPrice());
            ps.setString(4, albumDetails.getCategory());
            ps.setString(5, albumDetails.getStatus());
            ps.setString(6, albumDetails.getPhotoName());
            ps.setString(7, albumDetails.getUserTelegram());

            int i = ps.executeUpdate();
            if(i==1){
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public List<Album> getAllAlbums() {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql ="select * from kpop_albums";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
                albums.add(album);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return albums;
    }

    public Album getAlbumById(String id) {
        Album album = null;
        try {
            String sql = "select * from kpop_albums where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return album;
    }
    public boolean updateEditAlbum(Album album) {
        boolean flag = false;
        try {
            String sql = "update kpop_albums set album_name=?, group_name=?, price=?, status=? where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, album.getAlbumName());
            ps.setString(2, album.getGroupName());
            ps.setInt(3, album.getPrice());
            ps.setString(4, album.getStatus());
            ps.setString(5, album.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                System.out.println("Album edited");
                flag = true;
            } else {
                System.out.println("Album not edited");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean deleteAlbum(String id) {
        boolean flag = false;
        try {
            String sql = "delete from kpop_albums where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            int i = ps.executeUpdate();
            if (i==1){
                flag = true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public List<Album> getAlbumsByCategory(String category) {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql = "select * from kpop_albums where category = ? and status = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,category);
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            int i=1;
            while (rs.next() && i <= 4){
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
                albums.add(album);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return albums;
    }

    @Override
    public List<Album> getResentAlbums() {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql = "select * from kpop_albums where status = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4){
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
                albums.add(album);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return albums;
    }

    @Override
    public List<Album> getAllRecentAlbums() {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql = "select * from kpop_albums where status = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
                albums.add(album);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return albums;
    }

    @Override
    public List<Album> getAllAlbumsByCategory(String category) {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql = "select * from kpop_albums where category = ? and status = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,category);
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
                albums.add(album);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return albums;
    }

    @Override
    public boolean sellAlbum(Album album) {
        boolean flag = false;
        try{
            String sql = "insert into kpop_albums(album_name, group_name, price, category, status, photo, user_telegram) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, album.getAlbumName());
            ps.setString(2, album.getGroupName());
            ps.setInt(3, album.getPrice());
            ps.setString(4, album.getCategory());
            ps.setString(5, album.getStatus());
            ps.setString(6, album.getPhotoName());
            ps.setString(7, album.getUserTelegram());

            int i = ps.executeUpdate();
            if(i==1){
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public List<Album> getUserAlbums(String userTelegram) {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql = "select * from kpop_albums where category=? and user_telegram =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, userTelegram);

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category("Old")
                        .photoName(rs.getString(7))
                        .userTelegram(userTelegram)
                        .build();
                albums.add(album);
            }
        } catch (Exception e){

        }
        return albums;
    }

    public List<Album> searchAlbum(String search) {
        List<Album> albums = new ArrayList<Album>();
        try {
            String sql = "select * from kpop_albums where album_name like ? or group_name like ? or category like ? and status=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%"+search+"%");
            ps.setString(2, "%"+search+"%");
            ps.setString(3, "%"+search+"%");
            ps.setString(4, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Album album = Album.builder()
                        .id(rs.getString(1))
                        .albumName(rs.getString(2))
                        .groupName(rs.getString(3))
                        .price(rs.getInt(4))
                        .category(rs.getString(5))
                        .status(rs.getString(6))
                        .photoName(rs.getString(7))
                        .userTelegram(rs.getString(8))
                        .build();
                albums.add(album);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return albums;
    }
}














