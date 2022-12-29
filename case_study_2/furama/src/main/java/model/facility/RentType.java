package model.facility;

public class RentType {
    private int idR;
    private String nameR;

    public RentType() {
    }

    public RentType(int idR, String nameR) {
        this.idR = idR;
        this.nameR = nameR;
    }

    public int getIdR() {
        return idR;
    }

    public void setIdR(int idR) {
        this.idR = idR;
    }

    public String getNameR() {
        return nameR;
    }

    public void setNameR(String nameR) {
        this.nameR = nameR;
    }
}
