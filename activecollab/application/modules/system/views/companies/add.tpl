{title}New Company{/title}
{add_bread_crumb}New Company{/add_bread_crumb}

{form action='?route=people_companies_add' method=post class="uk-form"}

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