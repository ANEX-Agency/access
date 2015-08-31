{title}Edit Page{/title}
{add_bread_crumb}Edit Page{/add_bread_crumb}

{form action=$active_page->getEditUrl() method=post ask_on_leave=yes class='uk-form uk-form-stacked'}
    
    <div class="uk-grid" data-uk-grid-margin>
    
        {include_template module=pages controller=pages name=_page_form}
    
        <div class="uk-width-1-1 uk-width-medium-3-4">
        
            <div class="field-group">
    
                {submit class="uk-button uk-button-primary"}Submit{/submit}
                
            </div>
            
        </div>
        
    </div>

{/form}