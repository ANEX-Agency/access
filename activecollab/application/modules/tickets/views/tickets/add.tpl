{title}New Ticket{/title}
{add_bread_crumb}New Ticket{/add_bread_crumb}

{form action=$add_ticket_url method=post enctype="multipart/form-data" autofocus=yes ask_on_leave=yes class='uk-form uk-form-stacked'}

    {include_template name=_ticket_form module=tickets controller=tickets}
    
    {submit class="uk-button uk-button-primary"}Submit{/submit}
  
{/form}