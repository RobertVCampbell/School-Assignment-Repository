
public abstract class Ticket
{
    private String passengerName;
    private Flight flight;
    
    public void setPassengerName(String name)
    {
        this.passengerName = name;
    }

    public void setFlight(Flight flight)
    {
        this.flight = flight;
    }

    
}
