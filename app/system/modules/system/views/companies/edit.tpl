{title}Update Information{/title}
{add_bread_crumb}Update Information{/add_bread_crumb}

{form action=$active_company->getEditUrl() method=post class="uk-form"}

	<div class="uk-grid" data-uk-grid-margin>
    
        {include_template name=_profile_form controller=companies module=system}
        
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
