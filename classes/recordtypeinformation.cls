//find all Opportunity record types
public class recordtypeinformation {

public void infomethod(){
List<Schema.RecordTypeInfo> infos = Schema.SObjectType.Opportunity.RecordTypeInfos;
Id defaultRecordTypeId;

//check each one
for (Schema.RecordTypeInfo info : infos) {
  if (info.DefaultRecordTypeMapping) {
    defaultRecordTypeId = info.RecordTypeId;
  }
}

//here is the default Opportunity RecordType Id for the current user
System.debug(defaultRecordTypeId);

}

}