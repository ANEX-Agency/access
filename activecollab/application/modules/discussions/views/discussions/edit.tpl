{title}Edit Discussion{/title}
{add_bread_crumb}Edit Discussion{/add_bread_crumb}

{form action=$active_discussion->getEditUrl() method=post id=editDiscussionForm class='uk-form uk-form-stacked'}

    {include_template name=_discussion_form module=discussions controller=discussions}
    
    {submit class="uk-button uk-button-primary"}Submit{/submit}

{/form}