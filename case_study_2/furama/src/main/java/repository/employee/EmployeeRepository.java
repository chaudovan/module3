package repository.employee;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployee {
    private final String SELECT_ALL = "select e.*,d.name as nameD,p.name as nameP,ed.name as nameED from employee e join `position` p on e.position_id = p.position_id\n" +
            "join education_degree ed on e.education_degree_id = ed.education_degree_id\n" +
            "join division d on e.division_id=d.division_id";
    private final String INSERT_EMPLOYEE = "call e_insert(?,?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_EMPLOYEE = "update employee set `name`=?, date_of_birth = ?,id_card = ?,salary=?,phone_number=?,email=?,address=? ,position_id =?,education_degree_id=?,division_id=? where employee_id=?";
    private final String DELETE_EMPLOYEE = "delete from employee where employee_id=?";
    private final String SEARCH_EMPLOYEE = "select e.*,d.name as nameD,p.name as nameP,ed.name as nameED from employee e join `position` p on e.position_id = p.position_id\n" +
            "join education_degree ed on e.education_degree_id = ed.education_degree_id\n" +
            "join division d on e.division_id=d.division_id\n" +
            "where e.name like ? and e.address like ? and e.position_id like ?";
    @Override
    public void insertEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_EMPLOYEE);
            callableStatement.setString(1,employee.getNameE());
            callableStatement.setString(2,employee.getDayOfBirthE());
            callableStatement.setString(3,employee.getIdCardE());
            callableStatement.setDouble(4,employee.getSalaryE());
            callableStatement.setString(5,employee.getPhoneE());
            callableStatement.setString(6,employee.getEmailE());
            callableStatement.setString(7,employee.getAddressE());
            callableStatement.setInt(8,employee.getIdPosition().getIdP());
            callableStatement.setInt(9,employee.getIdEducation().getIdED());
            callableStatement.setInt(10,employee.getIdDivision().getIdD());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Employee> selectAllEmplolyee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idE = resultSet.getInt("employee_id");
                String nameE = resultSet.getString("name");
                String dayOfBirthE = resultSet.getString("date_of_birth");
                String idCardE  =resultSet.getString("id_card");
                double salaryE = resultSet.getDouble("salary");
                String phoneE = resultSet.getString("phone_number");
                String emailE = resultSet.getString("email");
                String addressE = resultSet.getString("address");
                int idED = resultSet.getInt("education_degree_id");
                String nameED = resultSet.getString("nameED");
                EducationDegree idEducation = new EducationDegree(idED,nameED);
                int idP = resultSet.getInt("position_id");
                String nameP = resultSet.getString("nameP");
                Position idPosition = new Position(idP,nameP);
                int idD = resultSet.getInt("division_id");
                String nameD = resultSet.getString("nameD");
                Division idDivision = new Division(idD,nameD);
                Employee employee = new Employee(idE,nameE,dayOfBirthE,idCardE,salaryE,phoneE,emailE,addressE,idPosition,idEducation,idDivision);
                employeeList.add(employee);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1,employee.getNameE());
            preparedStatement.setString(2,employee.getDayOfBirthE());
            preparedStatement.setString(3,employee.getIdCardE());
            preparedStatement.setDouble(4,employee.getSalaryE());
            preparedStatement.setString(5,employee.getPhoneE());
            preparedStatement.setString(6,employee.getEmailE());
            preparedStatement.setString(7,employee.getAddressE());
            preparedStatement.setInt(8,employee.getIdPosition().getIdP());
            preparedStatement.setInt(9,employee.getIdEducation().getIdED());
            preparedStatement.setInt(10,employee.getIdDivision().getIdD());
            preparedStatement.setInt(11,employee.getIdE());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> search(String nameSearch,String addressSearch,String id_position) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1,"%" + nameSearch + "%");
            preparedStatement.setString(2,"%" + addressSearch + "%");
            preparedStatement.setString(3,"%" + id_position + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idE = resultSet.getInt("employee_id");
                String nameE = resultSet.getString("name");
                String dayOfBirthE = resultSet.getString("date_of_birth");
                String idCardE  =resultSet.getString("id_card");
                double salaryE = resultSet.getDouble("salary");
                String phoneE = resultSet.getString("phone_number");
                String emailE = resultSet.getString("email");
                String addressE = resultSet.getString("address");
                int idED = resultSet.getInt("education_degree_id");
                String nameED = resultSet.getString("nameED");
                EducationDegree idEducation = new EducationDegree(idED,nameED);
                int idP = resultSet.getInt("position_id");
                String nameP = resultSet.getString("nameP");
                Position idPosition = new Position(idP,nameP);
                int idD = resultSet.getInt("division_id");
                String nameD = resultSet.getString("nameD");
                Division idDivision = new Division(idD,nameD);
                Employee employee = new Employee(idE,nameE,dayOfBirthE,idCardE,salaryE,phoneE,emailE,addressE,idPosition,idEducation,idDivision);
                employeeList.add(employee);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Position> selectAllPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select *from `position`");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idP = resultSet.getInt("position_id");
                String nameP = resultSet.getString("name");
                Position position = new Position(idP, nameP);
                positionList.add(position);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positionList;
    }

    @Override
    public List<EducationDegree> educationDegree() {
        List<EducationDegree> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select *from education_degree");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idED = resultSet.getInt("education_degree_id");
                String nameED = resultSet.getString("name");
                EducationDegree educationDegree = new EducationDegree(idED, nameED);
                list.add(educationDegree);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Division> division() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select*from division");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idD = resultSet.getInt("division_id");
                String nameD = resultSet.getString("name");
                Division division = new Division(idD,nameD);
                divisionList.add(division);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisionList;
    }

    @Override
    public Employee selectIdEmployee(int id) {
        Employee employee=null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from employee where employee_id=?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String nameE = resultSet.getString("name");
                String dayOfBirthE = resultSet.getString("date_of_birth");
                String idCardE  =resultSet.getString("id_card");
                double salaryE = resultSet.getDouble("salary");
                String phoneE = resultSet.getString("phone_number");
                String emailE = resultSet.getString("email");
                String addressE = resultSet.getString("address");
                int idP = resultSet.getInt("position_id");
                Position idPosition = new Position(idP);
                int idED = resultSet.getInt("education_degree_id");
                EducationDegree idEducation = new EducationDegree(idED);
                int idD = resultSet.getInt("division_id");
                Division idDivision = new Division(idD);
                employee = new Employee(id,nameE,dayOfBirthE,idCardE,salaryE,phoneE,emailE,addressE,idPosition,idEducation,idDivision);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }
}
