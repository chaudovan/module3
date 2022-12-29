package repository.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private final String SELECT_ALL = "select c.*,ct.customer_type_name as ct_name from customer c join customer_type ct\n" +
            "on c.customer_type_id = ct.customer_type_id";
    private final String INSERT_CUSTOMER = "call c_insert(?,?,?,?,?,?,?,?)";
    @Override
    public void insertCustomer(Customer Customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement=  connection.prepareCall(INSERT_CUSTOMER);
            callableStatement.setInt(1,Customer.getCustomerType().getIdCT());
            callableStatement.setString(2,Customer.getName());
            callableStatement.setString(3,Customer.getDayOfBirth());
            callableStatement.setInt(4,Customer.getGender());
            callableStatement.setString(5,Customer.getIdCard());
            callableStatement.setString(6,Customer.getPhoneNumber());
            callableStatement.setString(7,Customer.getEmail());
            callableStatement.setString(8,Customer.getAddress());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int idC = resultSet.getInt("customer_id");
                int idCT = resultSet.getInt("customer_type_id");
                String ct_name = resultSet.getString("ct_name");
                CustomerType customerType = new CustomerType(idCT,ct_name);
                String name = resultSet.getString("customer_name");
                String date = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String id_card = resultSet.getString("customer_id_card");
                String customer_phone = resultSet.getString("customer_phone");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                Customer customer = new Customer(idC,customerType,name,date,gender,id_card,customer_phone,customer_email,customer_address);
                customerList.add(customer);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select*from customer_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_type_name = resultSet.getNString("customer_type_name");
                CustomerType customerType = new CustomerType(customer_type_id,customer_type_name);
                customerTypes.add(customerType);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
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
