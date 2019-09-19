<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    <aura:attribute name="showError" type="boolean" default="false"/>
  
    <lightning:layout>
            <lightning:layoutItem size="3" padding="around-small"> 
    <c:customLookup objectAPIName="account" IconName="standard:people" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name" />
    <aura:if isTrue="{!v.showError}">

    <div class="slds-box slds-theme_error">
  <p>Please enter the value</p>
</div>
    </aura:if>
      </lightning:layoutItem>
    </lightning:layout>
         <lightning:layout>
            <lightning:layoutItem size="3" padding="around-small"> 
    <lightning:button variant="brand" label="Brand action" title="Brand action" onclick="{! c.handleClick }" />
 <!-- here c: is org. namespace prefix-->
      </lightning:layoutItem>
    </lightning:layout>
   
</aura:application>