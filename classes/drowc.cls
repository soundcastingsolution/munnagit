public class drowc
{
    public List<Account> memberList {get;set;}
    public List<Account> memberAddList {get;set;}
    public String memberName {get;set;}
    public Integer rowNum{get;set;}
    
    public drowc()
    {
        String sql = 'SELECT Name, phone FROM Account';
        memberList = Database.Query(sql);
        memberAddList = new List<Account>();
        memberAddList.add(new Account());
    }
        
    public void AddRow()
    {
        memberAddList.add(new Account());
    }
    
    public void delRow()
    {
        rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        memberAddList.remove(rowNum);   
    }    
    
    public void saveMemb()
    {
        insert memberAddList;
    }
}