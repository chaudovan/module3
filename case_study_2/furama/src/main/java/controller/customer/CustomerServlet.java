package controller.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import service.customer.CustomerServce;
import service.customer.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService= new CustomerServce();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            case "edit":
//                showEdit(request,response);
                break;
            case "delete":
//                deleteCustomer(request,response);
                break;
            case "search":
//                showSearch(request,response);
                break;
            default:
                showListCustomer(request,response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idCT = Integer.parseInt(request.getParameter("customerType"));
        CustomerType customerType = new CustomerType(idCT);
        String name = request.getParameter("name");
        String date = request.getParameter("dayOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCar");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerType,name,date,gender,idCard,phone,email,address);
        iCustomerService.insertCustomer(customer);
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
//                showEdit(request,response);
                break;
            case "delete":
//                deleteCustomer(request,response);
                break;
            case "search":
//                showSearch(request,response);
                break;
            default:
                showListCustomer(request,response);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypes = iCustomerService.selectAllCustomerType();
        request.setAttribute("customerTypes",customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = iCustomerService.selectAllCustomer();
        List<CustomerType> customerTypes = iCustomerService.selectAllCustomerType();
        request.setAttribute("customerList",customerList);
        request.setAttribute("customerTypes",customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
