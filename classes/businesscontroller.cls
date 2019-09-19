public class businesscontroller {

    public list<user> getUl() {
        list<user> lstUser = new list<user>();
        lstUser = [select id,name from user];
        return lstUser;
    }

}