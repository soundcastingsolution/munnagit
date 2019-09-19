public class RandomContactFactory{
    public static list<Contact> generateRandomContacts(integer num,string ba){
        List<contact> con = new List<Contact>();
        for(integer i=1;i<=num;i++){
            Contact c = new Contact();
            c.firstname = 'Test'+i;
            c.lastname = ba;
            con.add(c);
        }
        return con;
    }
}