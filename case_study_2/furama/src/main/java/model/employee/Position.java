package model.employee;

public class Position {
    private int idP;
    private String nameP;

    public Position() {
    }

    public Position(int idP, String nameP) {
        this.idP = idP;
        this.nameP = nameP;
    }

    public Position(int idP) {
        this.idP = idP;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public String getNameP() {
        return nameP;
    }

    public void setNameP(String nameP) {
        this.nameP = nameP;
    }
}
