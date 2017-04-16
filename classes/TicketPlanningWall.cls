public class TicketPlanningWall{
    
    public List<Ticket__c> ticketList  {get; set;}
    public Set<Id> userSet {get; set;}
    public List<User> userList {get; set;}
    public Map<Id, List<Ticket__c>> userListTicket {get; set;}
    public List<Ticket__c> ticketListForMap {get; set;}
    public boolean TicketListFilled{get;set;}

    public TicketPlanningWall(){
        TicketListFilled = false;
        ticketList = [SELECT Id, Name, OwnerId FROM Ticket__c];
        if(ticketList != null && ticketList.size()>0)
            TicketListFilled = true;
        userSet = new Set<Id>();
        for(Ticket__c ticket : ticketList){
            userSet.add(ticket.OwnerId);
        }
        userList = [SELECT Id, Name FROM User Where Id in :userSet];
        
        userListTicket = new Map<Id, List<Ticket__c>>();
        for(Id ids: userSet){
            ticketListForMap = new List<Ticket__c>();
            for(Ticket__c ticket : ticketList){
                if(ids.equals(ticket.OwnerId)){
                    ticketListForMap.add(ticket);
                }
            }
            userListTicket.put(ids, ticketListForMap);
        }
    }
    
    @RemoteAction
    public static String changeOwner(string recordId, string ownId) {
        Ticket__c updateTicket = [SELECT Id, Name, OwnerId FROM Ticket__c where Id = :recordId Limit 1];
        updateTicket.OwnerId = ownId;
        update updateTicket;
        return updateTicket.Name;
    }
}