{title}New Project{/title}
{add_bread_crumb}New project{/add_bread_crumb}

<div id="project-form">
	
    {form action='?route=projects_add' method=post class="uk-form uk-form-stacked"}
    
    	<div class="uk-grid">
        
        	<div class="uk-width-1-1 uk-width-medium-3-4">
            
                {include_template module=system controller=project name=_project_form_main}
                
            </div>
            
        	<div class="uk-width-1-1 uk-width-medium-1-4">
            
                {include_template module=system controller=project name=_project_form_side}

                <div class="field-group">
                
                    <div class="field">
                        {label for=projectTemplate class="uk-form-label"}Project Template{/label}
                        {select_project_template name=project[project_template_id] value=$project_data.project_template_id id=projectTemplate class="uk-form-medium uk-width-1-1"}
                        <p id="users_from_auto_assignment" class="details" {if $project_data.project_template_id}style="display: none"{/if}>{lang}People will be added to the project based on auto-assignment settings{/lang}</p>
                        <p id="users_from_template" class="details" {if !$project_data.project_template_id}style="display: none"{/if}>{lang}People will be imported from the template and auto-assignment settings will be ignored{/lang}</p>
                    </div>
                    
                </div>
                
            </div>
    
            <div class="uk-width-1-1">
                <input type="submit" class="uk-button uk-button-primary uk-button-large" value="Submit" accesskey="s" />
            </div>
            
        {/form}
    
    </div>
    
</div>
