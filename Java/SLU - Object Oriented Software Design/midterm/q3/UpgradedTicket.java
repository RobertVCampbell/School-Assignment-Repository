public class UpgradedTicket extends Ticket
{
    public enum UpgradeType {ECONOMY_PLUS, BUSINESS_CLASS;}

    private int row = 0;
    private char seat = 'X';
    private UpgradeType upgrade = UpgradeType.ECONOMY_PLUS;

    public UpgradedTicket(UpgradeType upgrade)
    {
        this.upgrade = upgrade;
    }
    
    public void reserveSeat(int row, char seat)
    {
        this.row = row;
        this.seat = seat;
    }
}
