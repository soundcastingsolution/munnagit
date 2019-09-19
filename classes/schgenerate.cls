public class schgenerate {
    
    public static void runsch(integer monthno){
        
        string str ='0 0 0 1';
        integer mon = monthno;
        str=str+' '+mon;
        integer sum = mon+6;
        integer nextmon=sum>12?math.mod(sum,12):sum;
        system.debug('@@@nextdate'+nextmon);
        for(integer i=0;i<6;i++){
            integer temp = nextmon+i>12?math.mod(nextmon+i,12):nextmon+i;
            system.debug(nextmon+i);
            str = str+','+temp;
        }
        str=str+' ? * *';
        
        system.debug(str);
        sch m = new sch(true);
        String jobID = system.schedule('Merge Job20', str, m);
    }
}