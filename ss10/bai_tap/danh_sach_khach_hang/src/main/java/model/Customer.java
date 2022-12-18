package model;

public class Customer {
    private String ten;
    private String date;
    private String diaChi;
    private String img;

    public Customer() {
    }

    public Customer(String ten, String date, String diaChi, String img) {
        this.ten = ten;
        this.date = date;
        this.diaChi = diaChi;
        this.img = img;
    }

    public Customer(String ten, String date, String diaChi) {
        this.ten = ten;
        this.date = date;
        this.diaChi = diaChi;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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
