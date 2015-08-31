{title not_lang=true}{lang}Edit Ticket{/lang} #{$active_ticket->getTicketId()}{/title}
{add_bread_crumb}Edit Ticket{/add_bread_crumb}

{form action=$active_ticket->getEditUrl() method=post ask_on_leave=yes class='uk-form uk-form-stacked'}

    {include_template name=_ticket_form module=tickets controller=tickets}
    
    {submit class="uk-button uk-button-primary"}Submit{/submit}
  
{/form}