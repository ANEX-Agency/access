{title}New Page{/title}
{add_bread_crumb}New Page{/add_bread_crumb}

{form action=$add_page_url method=post ask_on_leave=yes autofocus=yes enctype="multipart/form-data" class='uk-form uk-form-stacked'}
    
    <div class="uk-grid" data-uk-grid-margin>

        {include_template module=pages controller=pages name=_page_form}
    
        <div class="uk-width-1-1 uk-width-medium-3-4">
        
            <div class="field-group">
    
                {submit class="uk-button uk-button-primary"}Submit{/submit}
                
            </div>
            
        </div>
        
    </div>
  
{/form}