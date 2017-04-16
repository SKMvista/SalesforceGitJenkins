public with sharing class ExpenseControllerSelf {
    @AuraEnabled
    public static List<ExpenseSelf__c> getExpenses() {
        System.debug('Inside the ExpenseTracker Self');
        // Perform isAccessible() check here
        return [SELECT Id, Name, Amount__c, Client__c, Date__c,
        Reimbursed__c, CreatedDate FROM ExpenseSelf__c];
    }
    
    @AuraEnabled
    public static ExpenseSelf__c saveExpense(ExpenseSelf__c expense) {
    // Perform isUpdateable() check here
    upsert expense;
    return expense;
}
}