{title}Edit Project{/title}
{add_bread_crumb}Edit{/add_bread_crumb}

<div id="project-form">
	
    {form action=$active_project->getEditUrl() method=post class="uk-form"}
    
    	<div class="uk-grid">
    
            {include_template module=system controller=project name=_project_form}
            
            <div class="uk-width-1-1">
                <input type="submit" class="uk-button uk-button-primary uk-button-large" value="Submit" accesskey="s" />
            </div>
            
        {/form}
    
    </div>
    
</div>