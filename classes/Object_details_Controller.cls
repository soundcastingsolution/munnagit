public class Object_details_Controller {

public list<Schema.SObjectType> getnames(){

Schema.SObjectType[] names = new list<Schema.SObjectType>();
Map<String, Schema.SObjectType> results2 =  Schema.getglobaldescribe();
names = results2.values();
//for(string s:results2.keyset()){

//names.add(results2.get(s));

//}
//names.sort();
return names;

}
}