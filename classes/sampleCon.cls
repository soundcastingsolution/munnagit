public class sampleCon {
        //String[] countries = new String[]{};
        public string countries{get;set;}
         public string depcheck{get;set;}
         public integer size{get;set;}
         public list<string> conl{get;set;}
         public string coun{get;set;}
         public string coun2{get;set;}
         
        public PageReference test() {
            size=countries.length();
            coun = countries.remove('[');
            coun2 = coun.remove(']');
            conl=coun2.split(', ',size-2);
           
            
            return null;
            
        }
        
        
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('None','None'));
            options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }
        public List<SelectOption> getdep() {
            List<SelectOption> options2 = new List<SelectOption>();
            if(countries=='US'|| countries=='CANADA') {
            options2.add(new SelectOption('Yes','Yes'));
            }
            else If(Countries=='Mexico') {
            options2.add(new SelectOption('No','No'));
            }
            else{
            
             options2.add(new SelectOption('NONE','NONE'));
            }
            
            return options2;
        }
            
        /*public String[] getCountries() {
            return countries;
        }
            
        public void setCountries(String[] countries) {
            this.countries = countries;
        }*/
    }