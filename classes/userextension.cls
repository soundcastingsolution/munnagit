public class userextension {
user ul = new user();

public user getuserdetails() {

ul = [select firstname, lastname, email, phone,title from user where id=:userinfo.getUserId()];

return ul;
}
}