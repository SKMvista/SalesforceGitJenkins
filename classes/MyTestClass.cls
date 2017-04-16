@isTest
private class MyTestClass {

    //Scenario 1 - Create Unrelated Records
    //Lets take 1st scenario. You will create record of single object
    //We will have only one Contact Object
    static testmethod void createContact() {
        //We will create Only one Contact
        List<Contact> lstContactSingle = TestDataFactory.createContact(1);
        //Only one record will get inserted;
        insert lstContactSingle;
        
        //We will create 10 Contact
        List<Contact> lstContactMass = TestDataFactory.createContact(10);
        //10record will get inserted;
        insert lstContactMass;
    }
    
    //Scenario 2 - Create Related Records. It can be done in two ways:
    //First Way - Pass only one parameter for both the records.
    static testmethod void createContactAccount() {
        //We will create 10 Contact
        List<Contact> lstContactMass = TestDataFactory.createContactAccount(10);
        //Only 10 record will get inserted;
        insert lstContactMass;
    }
    
    //Scenario 2 - Create Related Records. It can be done in two ways:
    //Second Way - Pass only one parameter for both the records.
    //Complicated So we might not use it anytime soon.
    static testmethod void createContactAccounst() {
        //We will create 10 Contact
        List<Contact> lstContactMass = TestDataFactory.createContactAccounts(5,3);
        //Only one record will get inserted;
        insert lstContactMass;
    }
    
    //Scenario 3 - Update records before inserting them
    static testmethod void updateContactBeforeCreation() {
        //We will create 10 Contact
        List<Contact> lstContactMass = TestDataFactory.createContact(10);
        for(Contact con: lstContactMass){
            con.LastName = 'Sandeep';
        }
        
        //Insert Updated Value
        insert lstContactMass;
    }
    
//Below Scenario will create test data only once for entire class method. No need to create data every other time.
//We should follow below approach
/***********************************************************************************************************************/
    //below test setup method will be invoked
    //implicitly before every test methods 
    @testSetup
    static void createContactViaSetUpMEthod(){
        //We will create 10 Contact
        List<Contact> lstContactMass = TestDataFactory.createContact(10);
        //10 record will get inserted;
        insert lstContactMass;
    }
    
    //Check Contact Records.
    static testmethod void checkHowMAnyRecords() {
        System.debug([SELECT Id FROM Contact]);
    }
    
/***********************************************************************************************************************/
}