<aura:application implements="force:appHostable" access="GLOBAL" extends="ltng:outApp">
   <aura:registerevent name="SearchKeyChange" type="c:SearchKeyChange"/>
    <link href='/resource/bootstrap/' rel="stylesheet"/>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">Lightning Contacts</a>
            </div>
        </div>
    </div>

    <div class="container" access="GLOBAL" extends="ltng:outApp">
        <div class="row">
            <div class="col-sm-12">
             <div class="container">
    <div class="row">
        
        <div class="col-lg-12">
            <c:SearchBar />
            <c:ContactList />
             </div>
        <div class="col-lg-8">
            <c:ContactDetails />
        </div>
    </div>
</div>
            </div>
        </div>
    </div>

</aura:application>