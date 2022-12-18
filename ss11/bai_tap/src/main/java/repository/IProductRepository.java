package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void save(Product product);
    void update(int id,Product product);
    void delete(int id);
    void view(int id);
    void search();
}
