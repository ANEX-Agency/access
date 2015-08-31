{title}New Discussion{/title}
{add_bread_crumb}New Discussion{/add_bread_crumb}

{form action=$add_discussion_url method=post enctype="multipart/form-data" ask_on_leave=yes autofocus=yes class='uk-form uk-form-stacked'}

    {include_template name=_discussion_form module=discussions controller=discussions}
  
    {submit class="uk-button uk-button-primary"}Submit{/submit}
  
{/form}