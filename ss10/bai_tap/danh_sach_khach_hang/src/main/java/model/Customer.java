package model;

public class Customer {
    private String ten;
    private String date;
    private String diaChi;

    public Customer() {
    }

    public Customer(String ten, String date, String diaChi) {
        this.ten = ten;
        this.date = date;
        this.diaChi = diaChi;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
}
