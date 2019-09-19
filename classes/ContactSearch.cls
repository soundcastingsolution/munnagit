public class ContactSearch{
    public static List<Contact> searchForContacts(string ln,string pa){
        list<Contact> con = [select id,lastname from contact where lastname =:ln AND MailingPostalCode =:pa];
        return con;    
    }
}