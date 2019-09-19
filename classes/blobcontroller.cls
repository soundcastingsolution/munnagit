public class blobcontroller {

public Document filedata{get;set;}

public string datadisp{get;set;}

public blobcontroller(){

filedata = new Document();
}

public void displayblob(){

//datadisp = EncodingUtil.base64Encode(filedata);
Blob bodyBlob = filedata.Body;
datadisp = bodyBlob.toString();
//datadisp = filedata.tostring();



}


}