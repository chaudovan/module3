package service.customer;

import model.customer.Customer;
import model.customer.CustomerType;

import java.util.List;

public interface ICustomerService {
    void insertCustomer(Customer Customer);
    List<Customer> selectAllCustomer();
    List<CustomerType> selectAllCustomerType();
    boolean updateCustomer(Customer Customer);
    boolean deleteCustomer(int id);
    List<Customer> search(String nameSearch,String customerTypeSearch);
    Customer selectIdCustomer(int id);
}
