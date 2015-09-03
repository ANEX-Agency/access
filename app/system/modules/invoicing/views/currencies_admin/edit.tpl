{title}Edit Currency{/title}
{add_bread_crumb}Edit Currency{/add_bread_crumb}

<div id="add_currency">

    {form action=$active_currency->getEditUrl() method=post class="uk-form"}
        <div class="uk-grid" data-uk-grid-margin>
        
            {include_template name=_currency_form module=invoicing controller=currencies_admin}

            <div class="uk-width-1-1">
            
                <div class="field-group">
                
                    <div class="field">
                    
                        {wrap_buttons}
                            {submit class="uk-button uk-button-primary"}Submit{/submit}
                        {/wrap_buttons}
                        
                    </div>
                    
                </div>
                
            </div>
        
        </div>
        
    {/form}

</div>