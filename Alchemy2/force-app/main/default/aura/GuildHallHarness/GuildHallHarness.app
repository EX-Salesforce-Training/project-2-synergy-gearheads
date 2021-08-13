<aura:application  extends="force:slds">
    <aura:attribute name="pageNumber" type="Integer" default="0" />
    <aura:attribute name="maxPage" type="Integer" default="0" />
    <aura:attribute name="homepage" type="String" default="/" />
    <aura:html tag="style">
        :root {
            --gun-metal: #202C39;
            --gun-metal-light: #34475B;
            --deep-champagne: #F2D492;
            --sage: #B8B08D;
            --dark-charcoal: #283845;
            --independence: #3C5168;
            --rich-black: #161E27;
            --light-black: #1D2834;
            --cultured: #f2f5f8;
            --alice-blue: #E4EBF1;
        }
    </aura:html>
    <div class="slds-grid slds-wrap tall">
		<div class="slds-col slds-size_1-of-6">
        	<c:NavBarComponent>
            </c:NavBarComponent>
        </div>
        <div class="slds-col slds-size_5-of-6">
        	<c:HeaderComponent>
            </c:HeaderComponent>
            <!--
			your component here
			-->            
        </div>
        <div class="slds-col slds-size_1-of-1">
        	<c:utilityBarComponent>
            </c:utilityBarComponent>
        </div>
    </div>
</aura:application>