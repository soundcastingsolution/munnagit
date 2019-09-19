public class jsondesstructure {

/*public class typeatt {

public string type;

public string url; 

 }*/
public class accjsonstruct {

//public typeatt attvalue;

public ID id;

public string name;

}

public static list<accjsonstruct> accstruct() {

string jsonstring = parsing.parseacc();

list<accjsonstruct> accountDes = (list<accjsonstruct>) JSON.deserialize(jsonstring, list<accjsonstruct>.class);

return accountDes;

}


}