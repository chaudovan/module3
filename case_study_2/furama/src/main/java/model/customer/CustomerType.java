package model.customer;

public class CustomerType {
    private int idCT;
    private String nameCT;

    public CustomerType() {
    }

    public CustomerType(int idCT, String nameCT) {
        this.idCT = idCT;
        this.nameCT = nameCT;
    }

    public CustomerType(int idCT) {
        this.idCT = idCT;
    }

    public int getIdCT() {
        return idCT;
    }

    public void setIdCT(int idCT) {
        this.idCT = idCT;
    }

    public String getNameCT() {
        return nameCT;
    }

    public void setNameCT(String nameCT) {
        this.nameCT = nameCT;
    }
}
