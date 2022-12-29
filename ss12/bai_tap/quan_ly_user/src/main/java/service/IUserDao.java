package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    List<User> search(String nameCountry);
    void insertUserStrore(User user);
    User getUserById(int id);
    List<User> selectAllUserStrore();
    public boolean updateUserStore(User user);
    public boolean deleteUserStore(int id);
}
