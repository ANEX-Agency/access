<div class="uk-width-1-1 uk-width-medium-2-3">
        
    <div class="field-group">
    
    	<div class="uk-grid" data-uk-grid-margin>
        
            <div class="uk-width-1-1 uk-width-medium-1-2">
            
                <div class="field">
                
                    {label for=currencyName required=yes class="uk-form-label"}Name{/label}
                    {text_field name=currency[name] value=$currency_data.name id=currencyName class="required uk-width-1-1"}
                
                </div>
            
            </div>
            
            <div class="uk-width-1-1 uk-width-medium-1-2">
            
                <div class="field">
                
                    {label for=currencyCode required=yes class="uk-form-label"}Code{/label}
                    {text_field name=currency[code] value=$currency_data.code id=currencyCode class="required uk-width-1-1"}
                
                </div>
            
            </div>
        
        </div>
        
    </div>
          
</div>

<div class="uk-width-1-1 uk-width-medium-1-3">
        
    <div class="field-group">
    
        <div class="field">
        
            {label for=currencyDefaultRate class="uk-form-label"}Default Hourly Rate{/label}
            {text_field name=currency[default_rate] value=$currency_data.default_rate id=currencyDefaultRate class="uk-width-1-1"}
            <p class="uk-form-help-block">{lang}Default hourly rate for this currency. It can be overriden in invoices{/lang}.</p>
                    
        </div>
        
    </div>
          
</div>