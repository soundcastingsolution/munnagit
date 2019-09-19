Public class parsing {

public static string parseacc() {

list<Account> acc = new list<account>();

acc=[select id,name from account limit 3];
String jsonacc = JSON.serializepretty(acc);

return jsonacc;


}


}