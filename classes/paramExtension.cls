public class paramExtension {

    public string par{get;set;}
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public Account acc{get;set;}
    public paramExtension(ApexPages.StandardController stdController) {
       //par=apexpages.currentpage().getparameters().get('%3Fq');
    }

   
}