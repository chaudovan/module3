package model;

public class Product {
    private int id;
    private String tenSP;
    private float gia;
    private String moTa;
    private String tenNSX;

    public Product() {
    }

    public Product(int id, String tenSP, float gia, String moTa, String tenNSX) {
        this.id = id;
        this.tenSP = tenSP;
        this.gia = gia;
        this.moTa = moTa;
        this.tenNSX = tenNSX;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getTenNSX() {
        return tenNSX;
    }

    public void setTenNSX(String tenNSX) {
        this.tenNSX = tenNSX;
    }
}
