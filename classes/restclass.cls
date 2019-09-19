public class restclass {

public void restmethod() {

HttpRequest req = new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        req.setBody(buildHttpQuery(new Map<String, String> {
            'grant_type' => 'password',
            'username' => 'saisekharorg@salesforce.com',
            'password' => 'Shen@1990',
            'client_id' => '3MVG9ZL0ppGP5UrDgaFt9Gh7ThxfI3kZDl9yHLbfE4Isna_v2AQuXcKsBTpxpAmxJtRo3HzegnNaGwpxq8ld2',
            'client_secret' => '4173946571536579873'
        }));
        
        system.debug(buildHttpQuery(new Map<String, String> {
            'grant_type' => 'password',
            'username' => 'saisekharorg@salesforce.com',
            'password' => 'Shen@1990',
            'client_id' => '3MVG9ZL0ppGP5UrDgaFt9Gh7ThxfI3kZDl9yHLbfE4Isna_v2AQuXcKsBTpxpAmxJtRo3HzegnNaGwpxq8ld2',
            'client_secret' => '4173946571536579873'
        }));
         
        Http http = new Http();
        HttpResponse resp;
     try
     { 
           req.setTimeout(120000);  // timeout in milliseconds - this is two minute 
           resp = http.send(req);
            System.debug('*************************In Try*************************Response:' + resp.getBody());
     }
     catch(System.CalloutException e)
     {
        
           req.setTimeout(120000);  // timeout in milliseconds - this is two minute 
           resp = http.send(req);
            System.debug('*************************In Catch*************************Response:' + resp.getBody());
     } 


}

static String buildHttpQuery(Map<String, String> queryParams) {
        if (queryParams.isEmpty()) {
            return '';
        }

        String[] params = new String[] {};
        for (String k : queryParams.keySet()) {
            String v = EncodingUtil.urlEncode(queryParams.get(k), 'UTF-8');

            params.add(String.format('{0}={1}', new String[] { k, v }));
        }

        return String.join(params, '&');
    }
}