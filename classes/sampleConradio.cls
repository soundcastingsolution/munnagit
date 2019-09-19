public class sampleConradio {
    
    public String country = null;
    public List<Account> acclist;
    PUBLIC String str;
    Public List<Waccount> wacc{get;set;}
    public string selectedid{get;set;}
         
    public class Waccount {
    
    public Account acc{get;set;}
    public string accid{get;set;}
    
    public Waccount(Account a) {
    
    acc=a;
    accid=a.id;
    
    
    }
    
    }
    
    public List<Waccount> getaccountsdata() {
    
    acclist =[select id,name from Account];
    wacc = new List<Waccount>();
    for(Account Temp:acclist){
    
    wacc.add(new waccount(temp));
    
    }
    return wacc;
    }
    
    public PageReference test() {
        return null;
    }
    
    public sampleConradio() {
    
    acclist = new List<Account>();
    acclist = new List<Account>();
    //acclist =[select id,name from Account]; 
    //str = string.valueof(acclist);
    
    }
         
    public PageReference selectedacc() {
    
    selectedid = ApexPages.currentPage().getParameters().get('id');
    
    return null;
    
    }       
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        for(account temp:acclist){
        options.add(new SelectOption(temp.id,temp.name)); 
        }
        
         return options; 
    }
                   
    public String getCountry() {
        return country;
    }
                    
    public void setCountry(String country) { this.country = country; }
}