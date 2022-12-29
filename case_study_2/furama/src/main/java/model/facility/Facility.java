package model.facility;

public class Facility {
    private int idF;
    private String nameF;
    private int areaF;
    private double costF;
    private int maxPeopleF;
    private int idRentType;
    private int idFacType;
    private String standardRoom;
    private String convenience;
    private double poolArea;
    private int floors;
    private String freeF;

    public Facility() {
    }

    public Facility(int idF, String nameF, int areaF, double costF, int maxPeopleF, int idRentType, int idFacType, String standardRoom, String convenience, double poolArea, int floors, String freeF) {
        this.idF = idF;
        this.nameF = nameF;
        this.areaF = areaF;
        this.costF = costF;
        this.maxPeopleF = maxPeopleF;
        this.idRentType = idRentType;
        this.idFacType = idFacType;
        this.standardRoom = standardRoom;
        this.convenience = convenience;
        this.poolArea = poolArea;
        this.floors = floors;
        this.freeF = freeF;
    }

    public Facility(String nameF, int areaF, double costF, int maxPeopleF, int idRentType, int idFacType, String standardRoom, String convenience, double poolArea, int floors, String freeF) {
        this.nameF = nameF;
        this.areaF = areaF;
        this.costF = costF;
        this.maxPeopleF = maxPeopleF;
        this.idRentType = idRentType;
        this.idFacType = idFacType;
        this.standardRoom = standardRoom;
        this.convenience = convenience;
        this.poolArea = poolArea;
        this.floors = floors;
        this.freeF = freeF;
    }

    public int getIdF() {
        return idF;
    }

    public void setIdF(int idF) {
        this.idF = idF;
    }

    public String getNameF() {
        return nameF;
    }

    public void setNameF(String nameF) {
        this.nameF = nameF;
    }

    public int getAreaF() {
        return areaF;
    }

    public void setAreaF(int areaF) {
        this.areaF = areaF;
    }

    public double getCostF() {
        return costF;
    }

    public void setCostF(double costF) {
        this.costF = costF;
    }

    public int getMaxPeopleF() {
        return maxPeopleF;
    }

    public void setMaxPeopleF(int maxPeopleF) {
        this.maxPeopleF = maxPeopleF;
    }

    public int getIdRentType() {
        return idRentType;
    }

    public void setIdRentType(int idRentType) {
        this.idRentType = idRentType;
    }

    public int getIdFacType() {
        return idFacType;
    }

    public void setIdFacType(int idFacType) {
        this.idFacType = idFacType;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getConvenience() {
        return convenience;
    }

    public void setConvenience(String convenience) {
        this.convenience = convenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloors() {
        return floors;
    }

    public void setFloors(int floors) {
        this.floors = floors;
    }

    public String getFreeF() {
        return freeF;
    }

    public void setFreeF(String freeF) {
        this.freeF = freeF;
    }
}
