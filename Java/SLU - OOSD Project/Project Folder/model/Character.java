package model;

public class Character{
    protected int x;
    protected int y;
    protected int sight;
    protected int turnRate;

    public Character(int hor, int vert, int see, int speed){
        x = hor;
        y = vert;
        sight = see;
        turnRate = speed;
    }
    public Character(){
        x = 0;
        y = 0;
        sight = 1;
        turnRate = 1;
    }

    public int getX(){return x;}

    public int getY(){return y;}

    public int getSight(){return sight;}

    public int getRate(){return turnRate;}

    public void setX(int hor){x = hor;}

    public void setY(int vert){y = vert;}

    public void setSight(int see){sight = see;}

    public void setRate(int speed){turnRate = speed;}

}
