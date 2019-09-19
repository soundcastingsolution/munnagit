public class dynamictypecast {
public static void dynamicinsert(List<SObject> records)
{
    Schema.SObjectType sObjectType = records.getSObjectType();
    if (sObjectType != null)
    {
        String listType = 'List<' + sObjectType + '>';
        List<SObject> castRecords = (List<SObject>)Type.forName(listType).newInstance();
        castRecords.addAll(records);
        database.insert(castRecords,false);
    }
  }
}