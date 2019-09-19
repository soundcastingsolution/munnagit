public class valuesutil{

public static Object[] getValuesFromField(Type listType, SObject[] records, SObjectField field) {
    Object[] results = (Object[])listType.newInstance();
    for(SObject record: records) {
        results.add(record.get(field));
    }
    return results;
    
    
}

}