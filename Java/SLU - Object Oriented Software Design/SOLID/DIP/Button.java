public class Button
{
    private Equipment eq;
    private boolean state;

    public Button(Equipment eq)
    {
        this.eq = eq;
    }

    public void toggle()
    {
        state = !state;
        boolean buttonOn = state;
        if (buttonOn) 
        {
            eq.turnOn();
        } 
        else 
        {
            eq.turnOff();
        }
    }
}
