package model.employee;

public class Division {
    private int idD;
    private String nameD;

    public Division() {
    }

    public Division(int idD, String nameD) {
        this.idD = idD;
        this.nameD = nameD;
    }

    public Division(int idD) {
        this.idD = idD;
    }

    public int getIdD() {
        return idD;
    }

    public void setIdD(int idD) {
        this.idD = idD;
    }

    public String getNameD() {
        return nameD;
    }

    public void setNameD(String nameD) {
        this.nameD = nameD;
    }
}
