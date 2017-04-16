public class TestDataFactory {

    //This will create only single object
    public static List<Contact> createContact(Integer numberOfContact) {
        //Create a list
        List<Contact> lstContact = new List<Contact>();
            for(Integer count = 0; count < numberOfContact; count++){
                //Create Instances of Contact
                Contact con = new Contact(lastName='Mishra'+count);
                //Add the instance to a list
                lstContact.add(con);
            }
        //Do not insert the list here. Return to calling class.
        return lstContact;
    }
    
    //This will create two related objects. Both will same numbers of records.
    public static List<Contact> createContactAccount(Integer numberOfRecord) {
        //Create a list
        List<Account> lstAccount = new List<Account>();
            for(Integer count = 0; count < numberOfRecord; count++){
                //Create Instances of Account
                Account acc = new Account(Name='TestAccount' + count);
                //Add the instance to a list
                lstAccount.add(acc);
            }
        //You must insert it here as you will need for next object
        insert lstAccount;
        
        //Create a list
        List<Contact> lstContact = new List<Contact>();
            for(Integer count = 0; count < numberOfRecord; count++){
                //Create Instances of Contact
                Contact con = new Contact(lastName='Mishra'+count, AccountId = lstAccount[count].Id);
                //Add the instance to a list
                lstContact.add(con);
            }
        //Do not insert the list here. Return to calling class.
        return lstContact;
    }
    
    
    //This will create two related objects. Both will same numbers of records.
    public static List<Contact> createContactAccounts(Integer numAccts, Integer numContactsPerAcct) {
        //Create a list
        List<Account> lstAccount = new List<Account>();
            for(Integer count = 0; count < numAccts; count++){
                //Create Instances of Account
                Account acc = new Account(Name='TestAccount' + count);
                //Add the instance to a list
                lstAccount.add(acc);
            }
        //You must insert it here as you will need for next object
        insert lstAccount;
        
        //Create a list.
        //This will create different number of contact for each account.
        //Complicated. We can ignore this.
        List<Contact> lstContact = new List<Contact>();
        for(Integer accountCount = 0; accountCount<numAccts; accountCount++){
            Account acct = lstAccount[accountCount];
            for(Integer count=numContactsPerAcct*accountCount; count<numContactsPerAcct*(accountCount+1); count++){
                //Create Instances of Contact
                Contact con = new Contact(lastName='Mishra'+count, AccountId = acct.Id);
                //Add the instance to a list
                lstContact.add(con);
            }
        }
        //Do not insert the list here. Return to calling class.
        return lstContact;
    }
}