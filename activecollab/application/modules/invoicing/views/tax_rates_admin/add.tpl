{title}New Tax Rate{/title}
{add_bread_crumb}New{/add_bread_crumb}

<div id="add_tax_rate">
  {form action=$add_tax_rate_url method=post}
    {include_template name=_tax_rate_form module=invoicing controller=tax_rates_admin}

    {wrap_buttons}
      {submit}Submit {/submit}
    {/wrap_buttons}
  {/form}
</div>