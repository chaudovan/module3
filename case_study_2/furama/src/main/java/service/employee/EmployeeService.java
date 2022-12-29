package service.employee;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.employee.EmployeeRepository;
import repository.employee.IEmployee;

import java.util.List;

public class EmployeeService implements IEmployeeService{
    private IEmployee employeeRepository = new EmployeeRepository();
    @Override
    public void insertEmployee(Employee employee) {
        employeeRepository.insertEmployee(employee);
    }

    @Override
    public List<Employee> selectAllEmplolyee() {
        return employeeRepository.selectAllEmplolyee();
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> search(String nameSearch,String addressSearch,String id_position) {
        return employeeRepository.search(nameSearch,addressSearch,id_position);
    }

    @Override
    public List<Position> selectAllPosition() {
        return employeeRepository.selectAllPosition();
    }

    @Override
    public List<EducationDegree> educationDegree() {
        return employeeRepository.educationDegree();
    }

    @Override
    public List<Division> division() {
        return employeeRepository.division();
    }

    @Override
    public Employee selectIdEmployee(int id) {
        return employeeRepository.selectIdEmployee(id);
    }
}
