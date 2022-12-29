package model.employee;

public class Employee {
    private int idE;
    private String nameE;
    private String dayOfBirthE;
    private String idCardE;
    private double salaryE;
    private String phoneE;
    private String emailE;
    private String addressE;
    private Position idPosition;
    private EducationDegree idEducation;
    private Division idDivision;

    public Employee() {
    }

    public Employee(int idE, String nameE, String dayOfBirthE, String idCardE, double salaryE, String phoneE, String emailE, String addressE, Position idPosition, EducationDegree idEducation, Division idDivision) {
        this.idE = idE;
        this.nameE = nameE;
        this.dayOfBirthE = dayOfBirthE;
        this.idCardE = idCardE;
        this.salaryE = salaryE;
        this.phoneE = phoneE;
        this.emailE = emailE;
        this.addressE = addressE;
        this.idPosition = idPosition;
        this.idEducation = idEducation;
        this.idDivision = idDivision;
    }

    public Employee(String nameE, String dayOfBirthE, String idCardE, double salaryE, String phoneE, String emailE, String addressE, Position idPosition, EducationDegree idEducation, Division idDivision) {
        this.nameE = nameE;
        this.dayOfBirthE = dayOfBirthE;
        this.idCardE = idCardE;
        this.salaryE = salaryE;
        this.phoneE = phoneE;
        this.emailE = emailE;
        this.addressE = addressE;
        this.idPosition = idPosition;
        this.idEducation = idEducation;
        this.idDivision = idDivision;

    }

    public int getIdE() {
        return idE;
    }

    public void setIdE(int idE) {
        this.idE = idE;
    }

    public String getNameE() {
        return nameE;
    }

    public void setNameE(String nameE) {
        this.nameE = nameE;
    }

    public String getDayOfBirthE() {
        return dayOfBirthE;
    }

    public void setDayOfBirthE(String dayOfBirthE) {
        this.dayOfBirthE = dayOfBirthE;
    }

    public String getIdCardE() {
        return idCardE;
    }

    public void setIdCardE(String idCardE) {
        this.idCardE = idCardE;
    }

    public double getSalaryE() {
        return salaryE;
    }

    public void setSalaryE(double salaryE) {
        this.salaryE = salaryE;
    }

    public String getPhoneE() {
        return phoneE;
    }

    public void setPhoneE(String phoneE) {
        this.phoneE = phoneE;
    }

    public String getEmailE() {
        return emailE;
    }

    public void setEmailE(String emailE) {
        this.emailE = emailE;
    }

    public String getAddressE() {
        return addressE;
    }

    public void setAddressE(String addressE) {
        this.addressE = addressE;
    }

    public Position getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(Position idPosition) {
        this.idPosition = idPosition;
    }

    public EducationDegree getIdEducation() {
        return idEducation;
    }

    public void setIdEducation(EducationDegree idEducation) {
        this.idEducation = idEducation;
    }

    public Division getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(Division idDivision) {
        this.idDivision = idDivision;
    }
}
