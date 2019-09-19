trigger AccountAddressTrigger on Account(before insert,before update){
    if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isbefore){
        AccountAddress accAddress = new AccountAddress();
        accAddress.copyAddress(Trigger.new);
        }
    }