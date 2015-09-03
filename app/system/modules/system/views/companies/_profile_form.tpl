<div class="uk-width-1-1 uk-width-medium-2-3">

    <div class="uk-accordion" data-uk-accordion>
    
        <h3 class="uk-accordion-title">Basic Details</h3>
        
        <div class="uk-accordion-content">
        
            <div class="field-group">
            
                <div class="field">
                
                    {label for=name required=yes class="uk-form-label"}Name{/label}
                    {text_field name='company[name]' value=$company_data.name id=name class="required uk-width-1-1"}
                
                </div>
                
                <div class="field">
                
                    {label for=address class="uk-form-label"}Address{/label}
                    {textarea_field name='company[address]' id=address class="uk-width-1-1"}{$company_data.address}{/textarea_field}
                
                </div>
                
            </div>
        
        </div>

        <h3 class="uk-accordion-title">Additional Details</h3>
        
        <div class="uk-accordion-content">
        
            <div class="field-group">
            
            	<div class="uk-grid uk-grid-small" data-uk-grid-margin>
                
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=phone class="uk-form-label"}Phone Number{/label}
                            {text_field name='company[phone]' value=$company_data.phone id=phone class="uk-width-1-1"}
                        
                        </div>
                    
                    </div>
            
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=fax class="uk-form-label"}Fax Number{/label}
                            {text_field name='company[fax]' value=$company_data.fax id=fax class="uk-width-1-1"}
                        
                        </div>
                    
                    </div>
            
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=homepage class="uk-form-label"}Homepage{/label}
                            {text_field name='company[homepage]' value=$company_data.homepage id=homepage class="uk-width-1-1"}
                        
                        </div>
                    
                    </div>
            
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=email class="uk-form-label"}E-Mail{/label}
                            {text_field name='company[email]' value=$company_data.email id=email class="uk-width-1-1"}
                        
                        </div>
                    
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=vat class="uk-form-label"}VAT{/label}
                            {text_field name='company[vat]' value=$company_data.vat id=vat class="uk-width-1-1"}
                        
                        </div>
                    
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=paypal class="uk-form-label"}Paypal E-Mail{/label}
                            {text_field name='company[paypal]' value=$company_data.paypal id=paypal class="uk-width-1-1"}

                        </div>
                    
                    </div>
            
                </div>
                
            </div>
        
        </div>
    
        <h3 class="uk-accordion-title">Bank Details</h3>
        
        <div class="uk-accordion-content">
        
            <div class="field-group">
            
            	<div class="uk-grid uk-grid-small" data-uk-grid-margin>
                
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=bankname class="uk-form-label"}Bank Name{/label}
                            {text_field name='company[bankname]' value=$company_data.bankname id=bankname class="uk-width-1-1"}
                        
                        </div>
        
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=bankcode class="uk-form-label"}Bank Code{/label}
                            {text_field name='company[bankcode]' value=$company_data.bankcode id=bankcode class="uk-width-1-1"}
                        
                        </div>
        
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=account_holder class="uk-form-label"}Account Holder{/label}
                            {text_field name='company[account_holder]' value=$company_data.account_holder id=account_holder class="uk-width-1-1"}
                        
                        </div>
        
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=account_number class="uk-form-label"}Account Number{/label}
                            {text_field name='company[account_number]' value=$company_data.account_number id=account_number class="uk-width-1-1"}
                        
                        </div>
        
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=account_iban class="uk-form-label"}Account IBAN{/label}
                            {text_field name='company[account_iban]' value=$company_data.account_iban id=account_iban class="uk-width-1-1"}
                        
                        </div>
        
                    </div>
                    
                	<div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field">
                        
                            {label for=account_bic class="uk-form-label"}Account BIC{/label}
                            {text_field name='company[account_bic]' value=$company_data.account_bic id=account_bic class="uk-width-1-1"}
                        
                        </div>
        
                    </div>
                
                </div>
                
            </div>
        
        </div>
    
    
    </div>
    
</div>

<div class="uk-width-1-1 uk-width-medium-1-3">

    <div class="uk-accordion" data-uk-accordion>
    
        <h3 class="uk-accordion-title">Lead Details</h3>
        
        <div class="uk-accordion-content">
        
            <div class="field-group">
            
                <div class="field">
                
                    {label for=lead_source class="uk-form-label"}Lead Source{/label}
                    {text_field name='company[lead_source]' value=$company_data.lead_source id=lead_source class="uk-width-1-1" placeholder="ANEX, wpSight, ThemeForest,..."}
                
                </div>
                
                <div class="field">
                
                    {label for=lead_reference class="uk-form-label"}Lead Reference{/label}
                    {text_field name='company[lead_reference]' value=$company_data.lead_reference id=lead_reference class="uk-width-1-1" placeholder="Partnership, Private related,..."}
                
                </div>
                
                <div class="field">
                
                    {label for=first_contact class="uk-form-label"}First Contact{/label}
                    <div class="uk-form-icon uk-width-1-1">
                        <i class="uk-icon-calendar"></i>
                        <input type="text" name="company[first_contact]" id="first_contact" class="datepicker uk-form-medium uk-width-1-1" value="{$company_data.first_contact}" />
                    </div>
                
                </div>
                            
            </div>
        
        </div>
    
        <h3 class="uk-accordion-title">Internal Details</h3>
        
        <div class="uk-accordion-content">
        
            <div class="field-group">
            
                <div class="field">
                
                    {label for=number class="uk-form-label"}Company Number (Client ID){/label}
                    {text_field name='company[number]' value=$company_data.number id=number class="uk-width-1-1" placeholder="K-15-0015"}
                
                </div>
                
                <div class="field">
                
                    {label for=class class="uk-form-label"}Class{/label}
                    <select name="company[class]" id="class" class="uk-width-1-1">
                    	<option value=""></option>
                    	<option value="new">New</option>
                    	<option value="basic">Basic</option>
                    	<option value="premium">Premium</option>
                    </select>
                    
                </div>
                
                <div class="field">
                
                    {label for=note class="uk-form-label"}Note{/label}
                    {textarea_field name='company[note]' id=note class='uk-width-1-1' rows=5 placeholder="Insert any important informations here"}{$company_data.note}{/textarea_field}
                
                </div>
                            
            </div>
        
        </div>
    
    </div>
  
</div>