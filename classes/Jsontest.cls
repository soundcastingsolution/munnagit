Public class Jsontest {


public class data {
    
string Result;
Detail[] Values;    

}
public class Detail {
    
string Name;
string Reason;  
    
}

public static detail[] jsonmethod(){
string jsonstr ='{"Result" : "Failed","Values":[{"Name":"C002830084","Reason":"Issue"}, {"Name":"C002830082","Reason":"Issue"}]}';

data dt = (data)JSON.deserialize(jsonstr,data.class);
system.debug(dt);

return dt.values;

}

}