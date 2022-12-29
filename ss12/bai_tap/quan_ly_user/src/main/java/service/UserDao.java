package service;

import model.User;
import repository.IUserDaoRepository;
import repository.UserDaoRepository;

import java.sql.SQLException;
import java.util.List;

public class UserDao implements IUserDao{
    IUserDaoRepository userDaoRepository = new UserDaoRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userDaoRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDaoRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
         return userDaoRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDaoRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userDaoRepository.updateUser(user);
    }

    @Override
    public List<User> search(String nameCountry) {
        return userDaoRepository.search(nameCountry);
    }

    @Override
    public void insertUserStrore(User user) {
        userDaoRepository.insertUserStrore(user);
    }

    @Override
    public User getUserById(int id) {
        return userDaoRepository.getUserById(id);
    }

    @Override
    public List<User> selectAllUserStrore() {
        return userDaoRepository.selectAllUserStrore();
    }

    @Override
    public boolean updateUserStore(User user) {
        return userDaoRepository.updateUserStore(user);
    }

    @Override
    public boolean deleteUserStore(int id) {
        return userDaoRepository.deleteUserStore(id);
    }
}
