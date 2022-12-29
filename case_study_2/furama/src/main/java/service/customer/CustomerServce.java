package service.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.customer.CustomerRepository;
import repository.customer.ICustomerRepository;

import java.util.List;

public class CustomerServce implements ICustomerService{
    ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public void insertCustomer(Customer Customer) {
        iCustomerRepository.insertCustomer(Customer);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAllCustomer();
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return iCustomerRepository.selectAllCustomerType();
    }

    @Override
    public boolean updateCustomer(Customer Customer) {
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return false;
    }

    @Override
    public List<Customer> search(String nameSearch, String customerTypeSearch) {
        return null;
    }

    @Override
    public Customer selectIdCustomer(int id) {
        return null;
    }
}
