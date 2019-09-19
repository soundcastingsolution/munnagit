Public class deploymentclass{

public SaiorgMetadata.AsyncResult AsyncResult;

public SaiorgMetadata.AsyncResult deploytrigger()
  {
    // Deploy zip From static resource    
        SaiorgMetadata.MyMetadata service = createService();
        SaiorgMetadata.DeployOptions deployOptions = new SaiorgMetadata.DeployOptions();
        deployOptions.allowMissingFiles = false;
        deployOptions.autoUpdatePackage = false;
        deployOptions.checkOnly = false;
        deployOptions.ignoreWarnings = false;
        deployOptions.performRetrieve = false;
        deployOptions.purgeOnDelete = false;
        deployOptions.rollbackOnError = true;
        deployOptions.testLevel = 'NoTestRun';
        deployOptions.singlePackage = true;
        PageReference somefileRef2 = new PageReference('/resource/myzip');
        Blob contentAsBlob2 = somefileRef2.getContent();
        String csvBody = EncodingUtil.base64Encode(contentAsBlob2);     
        AsyncResult = service.deploy(csvBody,DeployOptions); 
        return  AsyncResult;      
    
   } 
   
    private static SaiorgMetadata.MyMetadata createService()
  { 
    SaiorgMetadata.MyMetadata service = new SaiorgMetadata.MyMetadata();
    service.SessionHeader = new SaiorgMetadata.SessionHeader_element();
    service.SessionHeader.sessionId = UserInfo.getSessionId();
    return service;    
  }
 }