Public class xmlcreator {

public void xmlcreatemethod(){

String namespace = 'API_USER_VERSION_URL';
String prefix = 'mockPrefix';
Dom.Document doc = new Dom.Document();
Dom.XmlNode xmlNode = doc.createRootElement('mockRootNodeName', namespace, prefix);
Dom.XmlNode LoginId = xmlNode.addChildElement('LoginId', namespace, prefix);
LoginId.setAttribute('test','test');
LoginId.addTextNode('LOGIN_ID');
xmlNode.addChildElement('FirstName', namespace, prefix).addTextNode('FIRST_NAME');
xmlNode.addChildElement('LastName', namespace, prefix).addTextNode('LAST_NAME');
xmlNode.addChildElement('EmailAddress', namespace,
prefix).addTextNode('EMAIL_ADDRESS');
xmlNode.addChildElement('LocaleName', namespace, prefix).addTextNode('LOCALE_NAME');
xmlNode.addChildElement('Token', null, null).addTextNode('OAUTH_TOKEN');
System.debug(doc.toXmlString());

}

}