public class objdes{

public static void objdesmethod(){
// sObject types to describe
String[] types = new String[]{'Account'};

// Make the describe call
Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types);
Map<String, Schema.SObjectType> results2 =  Schema.getglobaldescribe();
System.debug('objects ' + results2);

System.debug('Got describe information for ' + results.size() + ' sObjects.');

// For each returned result, get some info
for(Schema.DescribeSobjectResult res : results) {
    System.debug('sObject Label: ' + res.getLabel());
    System.debug('Number of fields: ' + res.fields.getMap().values());
    System.debug(res.isCustom() ? 'This is a custom object.' : 'This is a standard object.');
    // Get child relationships
     Map<String, Schema.SObjectField> field_map = res.fields.getMap(); //get a map of fields for the passed sobject
     List<Schema.PicklistEntry> pick_list_values2 = field_map.get('Industry').getDescribe().getPickListValues();
     system.debug('@@@@@@@@@@@@@'+pick_list_values2);
     
     
     List<string> values = new List<string>();
     for(Schema.PicklistEntry s:pick_list_values2){
     
     values.add(s.getvalue());
     }
     system.debug('picklistvalues@@@@@@@'+values);
    Schema.ChildRelationship[] rels = res.getChildRelationships();
    if (rels.size() > 0) {
        System.debug(res.getName() + ' has ' + rels.size() + ' child relationships.');
    }
}
}
}