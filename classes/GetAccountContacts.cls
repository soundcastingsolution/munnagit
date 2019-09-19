public class GetAccountContacts {  
    public List<Account> getAccConCases(){
        return [select id, Name, (select id, Name from Contacts) from account LIMIT 10];
    }
    public pagereference contactre() {
    
    PageReference pageRef = new PageReference('https://ap2.salesforce.com/003/e?retURL=%2F003%2Fo');
    pageRef.setredirect(true);
    return pageRef;

    }                
}