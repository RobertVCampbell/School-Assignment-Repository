public class EconomyTicket extends Ticket
{
    private int row;
    private char seat;

   
    public void reserveSeat(int row, char seat)
    {
        this.row = row;
        this.seat = seat;
    }
}
