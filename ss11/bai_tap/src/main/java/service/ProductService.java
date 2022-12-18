package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService{
//    private IProductService productService = new ProductService();
    private static List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1,"iphone5",10000,"Điện Thoại","Apple"));
        products.add(new Product(2,"samsung",90000,"Điện thoại","SamSung"));
        products.add(new Product(3,"Tivi",150000,"Tivi 49in","LG"));
        products.add(new Product(4,"Laptop",20000,"Laptop vip","Dell"));
        products.add(new Product(5,"Airpod",5000,"Tai nghe xịn","Apple"));
    }
    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public Product findByid(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.set(id,product);
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public void view(int id) {
        products.get(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> list = new ArrayList<>();
        if(name==""){
            for(Product product:products){
                    list.add(product);
            }
        }else {
            for (Product product : products) {
                if (product.getTenSP().toLowerCase().contains(name.toLowerCase())) {
                    list.add(product);
                }
            }
        }
        return list;
    }
}
