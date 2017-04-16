public class AllCustomizationToolingApi{
    private String baseUrl = URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v39.0/tooling/';
    private HttpRequest req;
    private Http h;
    private HttpResponse res;
    
    public List<ApexClass> lstApexClass {get; set;}
    
    public AllCustomizationToolingApi(){
        System.debug('Son Of God');
        System.debug('URL=>'+System.Url.getSalesforceBaseURL().toExternalForm());
    }
    
    public HttpResponse makeRequest(String urlEndpoint){
        baseUrl += urlEndpoint;
        
        req = new HttpRequest();
        req.setEndpoint(baseUrl);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        h = new Http();
        return h.send(req);
    }
    
    public List<ApexClass> getAllClass(){
    
        HttpResponse resmade = makeRequest('query/?q=Select+id,Name+from+MetadataContainer');
        System.debug(resmade);
        System.debug(resmade.getBody());
        
        return null;
         /*return [SELECT Id, NamespacePrefix, Name, ApiVersion,
                     Status, IsValid, BodyCrc, Body, LengthWithoutComments,
                     CreatedDate, CreatedById, CreatedBy.Name, LastModifiedDate,
                     LastModifiedById, LastModifiedBy.Name, SystemModstamp FROM ApexClass
                     WHERE Name='SessionController' LIMIT 1];
         */
    }
    
}