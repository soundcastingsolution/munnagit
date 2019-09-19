Public class restcall {

public void restmethod(){
HttpRequest req = new HttpRequest();
req.setEndpoint('https://saisekharorg-dev-ed.my.salesforce.com/data/v36.0/sobjects/');
req.setMethod('GET');
req.setHeader('Authorization', 'Bearer ' + '00D2800000128ut!AQMAQPXUW_gfnXvG8xQyJd.tFuBkWsLbMSridRzss1BiDqrbZBRtjriDQH4_Gilsa6WW.kXgQ_Ri.3DSE6y9a.RR4q7fqUeD');
req.setHeader('Content-Type', 'application/json');
Http h = new Http();
HttpResponse res = h.send(req);
system.debug(res.getBody()); 

}

}