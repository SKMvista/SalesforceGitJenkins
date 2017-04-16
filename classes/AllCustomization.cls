public class AllCustomization{
    public List<String> lstApexClassName {get; set;}
    public List<ApexClass> lstApexClass {get; set;}
    public AllCustomization(){
        System.debug('Son Of God');
    }
    
    public List<ApexClass> getAllClass(){
         return [SELECT Id, NamespacePrefix, Name, ApiVersion,
                     Status, IsValid, BodyCrc, Body, LengthWithoutComments,
                     CreatedDate, CreatedById, CreatedBy.Name, LastModifiedDate,
                     LastModifiedById, LastModifiedBy.Name, SystemModstamp FROM ApexClass
                     WHERE Name='SessionController' LIMIT 1];
    }
    
}