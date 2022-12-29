package model.employee;

public class EducationDegree {
    private int idED;
    private String nameED;

    public EducationDegree() {
    }

    public EducationDegree(int idED, String nameED) {
        this.idED = idED;
        this.nameED = nameED;
    }

    public EducationDegree(int idED) {
        this.idED = idED;
    }

    public int getIdED() {
        return idED;
    }

    public void setIdED(int idED) {
        this.idED = idED;
    }

    public String getNameED() {
        return nameED;
    }

    public void setNameED(String nameED) {
        this.nameED = nameED;
    }
}
