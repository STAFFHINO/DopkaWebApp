package DAO;

import entity.Album;

import java.util.List;

public interface AlbumDAO {
    public boolean addAlbum(Album albumDetails);
    public List<Album> getAllAlbums();
    public Album getAlbumById(String id);
    public boolean updateEditAlbum(Album album);
    public boolean deleteAlbum(String id);
    public List<Album> getAlbumsByCategory(String category);
    public List<Album> getResentAlbums();
    public List<Album> getAllRecentAlbums();
    public List<Album> getAllAlbumsByCategory(String category);
    public boolean sellAlbum(Album album);
    public List<Album> getUserAlbums(String idUser);
    public List<Album> searchAlbum(String search);
}
