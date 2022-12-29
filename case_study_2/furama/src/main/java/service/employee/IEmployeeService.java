package service.employee;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;

import java.util.List;

public interface IEmployeeService {
    void insertEmployee(Employee employee);
    List<Employee> selectAllEmplolyee();
    boolean updateEmployee(Employee employee);
    boolean deleteEmployee(int id);
    List<Employee> search(String nameSearch,String addressSearch,String id_position);
    List<Position> selectAllPosition();
    List<EducationDegree> educationDegree();
    List<Division> division();
    Employee selectIdEmployee(int id);
}
