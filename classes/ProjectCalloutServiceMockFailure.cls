@isTest
global class ProjectCalloutServiceMockFailure implements HttpCalloutMock {
    //Implement http mock callout here
    global HTTPResponse respond(HTTPRequest request) {
    // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setStatusCode(500);
        response.setStatus('Bad Request');
        return response; 
    }
}