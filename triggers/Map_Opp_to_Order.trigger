trigger Map_Opp_to_Order on Order (before insert, after insert) {
    System.debug(Trigger.size);
        System.debug(Trigger.new);
    if(Trigger.isBefore){

        for (Order ord : Trigger.new) {
        System.debug(ord.OpportunityId__r.StageName);
            if( ord.OpportunityId__r.StageName != 'Closed Won'){
                ord.addError('You cannot create an order for this opportunity as the opportunity is not closed won');
            }
        }
    }
    if(Trigger.isAfter){
        List<OrderItem> ordLinItems = new List<OrderItem>();
        for(Order ord: Trigger.Old){
            if(ord.OpportunityId__c != null){
                for(OpportunityLineItem opLineItem : [SELECT Id, Description from OpportunityLineItem WHERE OpportunityId = : ord.OpportunityId__c])    {
                    OrderItem ordLinItem = new OrderItem(OrderId = ord.Id, Description = opLineItem.Description);
                    ordLinItems.add(ordLinItem);
                }
            }
        }
        insert ordLinItems;
    }
}