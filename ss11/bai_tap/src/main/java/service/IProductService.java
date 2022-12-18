package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    Product findByid(int id);
    void update(int id,Product product);
    void delete(int id);
    void view(int id);
    List<Product> search(String name);
}
