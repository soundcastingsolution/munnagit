<aura:application extends="force:slds" >
    <aura:attribute type="object" name="mobj"/>
	<div class="slds-p-bottom_large slds-p-left_large" style="width:500px">
        <lightning:recordEditForm aura:id="recordViewForm"
                                    
                                     objectApiName="Contact">
            <lightning:messages />
            <lightning:inputField fieldName="FirstName" value="{!v.mobj+'.FirstName'}"/>
            <lightning:inputField fieldName="LastName" />
            <lightning:inputField fieldName="Birthdate" />
            <lightning:inputField fieldName="Phone" />
            <!--Picklist-->
           
           
            </lightning:recordEditForm>
         <lightning:button label="Neutral" title="Neutral action" onclick="{! c.handleClick }"/>
    </div>
</aura:application>