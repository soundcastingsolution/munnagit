public  class Pagination_att {
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public  ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 20;
                string queryString = 'Select id,Name from Attachment';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
       }set;
    }
     
    Public List<Attachment> getattach(){
        List<Attachment> accList = new List<attachment>();
        
        for(Attachment a : (List<Attachment>)setCon.getRecords())
            accList.add(a);
        return accList;
    }
     
    public pageReference refresh() {
        setCon = null;
        getattach();
        setCon.setPageNumber(1);
        return null;
    }
}