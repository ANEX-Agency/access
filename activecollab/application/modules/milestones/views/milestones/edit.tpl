{title}Edit Milestone{/title}
{add_bread_crumb}Edit Milestone{/add_bread_crumb}

{form action=$active_milestone->getEditUrl() method=post class='uk-form uk-form-stacked'}

    {include_template name=_milestone_form module=milestones controller=milestones}
    
    {wrap_buttons}
        {submit}Submit{/submit}
    {/wrap_buttons}
    
{/form}