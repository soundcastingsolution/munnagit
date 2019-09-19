@isTest
Public Class TestRestrictContactByName{
    Static testmethod void RestrictContactByNametest(){
        list<Contact> con = new List<Contact>();
        Contact c = new Contact();
        c.lastname = 'INVALIDNAME1';
        con.add(c);
      
        Contact c1 = new Contact();
        c1.lastname = 'INVALIDNAME';
        con.add(c1);
        database.insert(con);
    }

}