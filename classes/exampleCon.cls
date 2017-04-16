/***  Controller: ***/
            
public class exampleCon {
    Integer count = 0;
            
    public PageReference incrementCounter() {
        count++;
        return null;
    }
            
    @AuraEnabled
    public Integer getCount() {
        return count;
    }
}