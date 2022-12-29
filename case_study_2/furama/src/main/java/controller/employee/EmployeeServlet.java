package controller.employee;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import service.employee.EmployeeService;
import service.employee.IEmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createNew(request,response);
                break;
            case "edit":
                editEmployee(request,response);
                break;
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int idE = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dayOfBirth");
        String idCardE = request.getParameter("idCardE");
        double  salaryE = Double.parseDouble(request.getParameter("salaryE"));
        String phoneE = request.getParameter("phoneE");
        String emailE = request.getParameter("emailE");
        String addressE = request.getParameter("addressE");
        int classIdP = Integer.parseInt(request.getParameter("classIdP"));
        int classIdE = Integer.parseInt(request.getParameter("classIdE"));
        int classIdD = Integer.parseInt(request.getParameter("classIdD"));
        Position positionId = new Position(classIdP);
        EducationDegree educationDegreeId = new EducationDegree(classIdE);
        Division divisionId = new Division(classIdD);
        Employee employee = new Employee(idE,name,dayOfBirth,idCardE,salaryE,phoneE,emailE,addressE,positionId,educationDegreeId,divisionId);
        employeeService.updateEmployee(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNew(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dayOfBirth");
        String idCardE = request.getParameter("idCardE");
        double  salaryE = Double.parseDouble(request.getParameter("salaryE"));
        String phoneE = request.getParameter("phoneE");
        String emailE = request.getParameter("emailE");
        String addressE = request.getParameter("addressE");
        int classIdP = Integer.parseInt(request.getParameter("classIdP"));
        int classIdE = Integer.parseInt(request.getParameter("classIdE"));
        int classIdD = Integer.parseInt(request.getParameter("classIdD"));
        Position positionId = new Position(classIdP);
        EducationDegree educationDegreeId = new EducationDegree(classIdE);
        Division divisionId = new Division(classIdD);
        Employee employee = new Employee(name,dayOfBirth,idCardE,salaryE,phoneE,emailE,addressE,positionId,educationDegreeId,divisionId);
        employeeService.insertEmployee(employee);
        showCreate(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                showCreate(request,response);
                break;
            case "edit":
                showEdit(request,response);
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
            case "search":
                showSearch(request,response);
                break;
            default:
                showListEmployee(request,response);
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("nameSearch");
        String addressSearch = request.getParameter("addressSearch");
        String id_position = request.getParameter("position");
        List<Employee> employeeList = employeeService.search(nameSearch,addressSearch,id_position);
        List<Position> positionList = employeeService.selectAllPosition();
        List<EducationDegree> educationDegreeList = employeeService.educationDegree();
        List<Division> divisionList = employeeService.division();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("positionList",positionList);
        request.setAttribute("educationDegreeList",educationDegreeList);
        request.setAttribute("divisionList",divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        showListEmployee(request,response);
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectIdEmployee(id);
        request.setAttribute("employee",employee);
        List<Position> positionList = employeeService.selectAllPosition();
        List<EducationDegree> educationDegreeList = employeeService.educationDegree();
        List<Division> divisionList = employeeService.division();
        request.setAttribute("positionList",positionList);
        request.setAttribute("educationDegreeList",educationDegreeList);
        request.setAttribute("divisionList",divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = employeeService.selectAllPosition();
        List<EducationDegree> educationDegreeList = employeeService.educationDegree();
        List<Division> divisionList = employeeService.division();
        request.setAttribute("positionList",positionList);
        request.setAttribute("educationDegreeList",educationDegreeList);
        request.setAttribute("divisionList",divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmplolyee();
        List<Position> positionList = employeeService.selectAllPosition();
        List<EducationDegree> educationDegreeList = employeeService.educationDegree();
        List<Division> divisionList = employeeService.division();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("positionList",positionList);
        request.setAttribute("educationDegreeList",educationDegreeList);
        request.setAttribute("divisionList",divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
