<aura:application  >
   <div class="slds-p-bottom_large slds-p-left_large" style="width:500px">
        <lightning:recordEditForm aura:id="recordViewForm"
                                     
                                     objectApiName="Contact">
            <lightning:messages />
            <lightning:inputField fieldName="FirstName" />
            <lightning:inputField fieldName="LastName" />
            <lightning:inputField fieldName="Birthdate" />
            <lightning:inputField fieldName="Phone" />
            <!--Picklist-->
           
            <lightning:button aura:id="submit" type="submit" label="Update record" class="slds-m-top_medium" />
            </lightning:recordEditForm>
    </div>
</aura:application>