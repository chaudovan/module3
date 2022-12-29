package model.facility;

public class FacilityType {
    private int idFT;
    private String nameFT;

    public FacilityType() {
    }



    public FacilityType(int idF, String nameF) {
        this.idFT = idF;
        this.nameFT = nameF;
    }

    public int getIdF() {
        return idFT;
    }

    public void setIdF(int idF) {
        this.idFT = idF;
    }

    public String getNameFT() {
        return nameFT;
    }

    public void setNameFT(String nameFT) {
        this.nameFT = nameFT;
    }
}
