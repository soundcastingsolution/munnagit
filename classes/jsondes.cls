public class jsondes {

public static account accfromjson() {

string jsonstring = parsing.parseacc();

Account accountDes = (Account) JSON.deserialize(jsonstring, Account.class);

return accountDes;

}
}