public with sharing class ContinuationController {
    // Unique label corresponding to the continuation
    public String requestLabel;
    // Result of callout
    public String result {get;set;}
    
    // Callback method 
    public Object processResponse() {   
      // Get the response by using the unique label
      HttpResponse response = Continuation.getResponse(this.requestLabel);
      
      System.debug('response=>'+response);
      // Set the result variable that is displayed on the Visualforce page
      this.result = response.getBody();
      
      // Return null to re-render the original Visualforce page
      return null;
    }
    
    public Object startRequest(){
        // Create continuation with a timeout
      Continuation con = new Continuation(40);
      // Set callback method
      con.continuationMethod='processResponse';
      
      // Create callout request
      HttpRequest req = new HttpRequest();
      //req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 
      req.setHeader('x-api-key', 'fCQpjDJOgI2T1MXWDqLgH9roXO9nsbVF8eBQWeG1');
      req.setMethod('POST');
      req.setEndpoint('https://mbv0e3wjjb.execute-api.us-east-1.amazonaws.com/dev/solrsearch/internal');
      req.setBody('query=lastName:smi');
      
      System.debug('req=> '+req);
      // Add callout request to continuation
      this.requestLabel = con.addHttpRequest(req);
      
      // Return the continuation
      return con;
    }
    
    public Object getWeather(){
        // Create continuation with a timeout
      Continuation con = new Continuation(40);
      // Set callback method
      con.continuationMethod='processResponse';
      
      // Create callout request
      HttpRequest req = new HttpRequest();
      req.setMethod('GET');
      req.setEndpoint('http://apidev.accuweather.com/locations/v1/search?q=mumbai&apikey=hoArfRosT1215');
      
      System.debug('req=> '+req);
      // Add callout request to continuation
      this.requestLabel = con.addHttpRequest(req);
      
      // Return the continuation
      return con;
    }
}