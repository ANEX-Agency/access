{title}Edit Comment{/title}
{add_bread_crumb}Edit Comment{/add_bread_crumb}

{form action=$active_comment->getEditUrl() method=post ask_on_leave=yes}

    {include_template name=_comment_form module=resource controller=comments}
    
    {wrap_buttons}
        {submit class="uk-button uk-button-primary"}Submit{/submit}
    {/wrap_buttons}
    
{/form}