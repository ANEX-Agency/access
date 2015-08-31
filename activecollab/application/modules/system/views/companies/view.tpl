{title not_lang=yes}{$active_company->getName()}{/title}
{add_bread_crumb}Profile{/add_bread_crumb}
{page_object object=$active_company}


<div class="uk-grid">

	<div class="uk-width-1-1 uk-width-medium-2-3">
    
        <div class="company-details">
        
            {if $active_company->canEdit($logged_user)}
                <a href="{$active_company->getEditLogoUrl()}" id="select_company_icon">
                    <img src="{$active_company->getLogoUrl(true)}" alt="" class="properties_icon" />
                </a>
                <script type="text/javascript">
                    App.widgets.IconPicker.init('edit_icon','select_company_icon', App.lang('Change Logo'));
                </script>
            {else}
                <img src="{$active_company->getLogoUrl(true)}" alt="" class="properties_icon" />    
            {/if}
        
            <div class="uk-accordion" data-uk-accordion>
            
                <h3 class="uk-accordion-title">Company Details</h3>
                
                <div class="uk-accordion-content">
                
                    <dl class="uk-description-list-horizontal">
                    
                        <dt>{lang}Name{/lang}</dt>
                        <dd>{$active_company->getName()|clean}</dd>
                        
                        <dt>{lang}Address{/lang}</dt>
                        <dd>
                            {if $active_company->getConfigValue('address')}
                                {$active_company->getConfigValue('address')|clean|nl2br}
                            {else}
                                <em>{lang}not set{/lang}</em>
                            {/if}
                        </dd>
                        
                        <dt>{lang}Phone Number{/lang}</dt>
                        <dd>
                            {if $active_company->getConfigValue('phone')}
                                <a href="tel:{$active_company->getConfigValue('phone')}">{$active_company->getConfigValue('phone')|clean}</a>
                            {else}
                                <em>{lang}not set{/lang}</em>
                            {/if}
                        </dd>
                        
                        {if $active_company->getConfigValue('fax')}
                            <dt>{lang}Fax Number{/lang}</dt>
                            <dd>{$active_company->getConfigValue('fax')|clean}</dd>
                        {/if}
                        
                        {if is_valid_url($active_company->getConfigValue('homepage'))}
                            <dt>{lang}Homepage{/lang}</dt>
                            <dd><a href="{$active_company->getConfigValue('homepage')}">{$active_company->getConfigValue('homepage')|clean}</a></dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('email')}
                            <dt>{lang}E-Mail{/lang}</dt>
                            <dd><a href="mailto:{$active_company->getConfigValue('email')}">{$active_company->getConfigValue('email')|clean}</a></dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('vat')}
                            <dt>{lang}VAT{/lang}</dt>
                            <dd>{$active_company->getConfigValue('vat')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('paypal')}
                            <dt>{lang}Paypal{/lang}</dt>
                            <dd>{$active_company->getConfigValue('paypal')|clean}</dd>
                        {/if}
                        
                    </dl>
                        
                </div>
                
                <h3 class="uk-accordion-title">Bank Details</h3>
                
                <div class="uk-accordion-content">
                
                    <dl class="uk-description-list-horizontal">
                    
                        {if $active_company->getConfigValue('bankname')}
                            <dt>{lang}Bank{/lang}</dt>
                            <dd>{$active_company->getConfigValue('bankname')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('bankcode')}
                            <dt>{lang}Bank Code{/lang}</dt>
                            <dd>{$active_company->getConfigValue('bankcode')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('account_holder')}
                            <dt>{lang}Account Holder{/lang}</dt>
                            <dd>{$active_company->getConfigValue('account_holder')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('account_number')}
                            <dt>{lang}Account Number{/lang}</dt>
                            <dd>{$active_company->getConfigValue('account_number')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('account_iban')}
                            <dt>{lang}Account IBAN{/lang}</dt>
                            <dd>{$active_company->getConfigValue('account_iban')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('account_bic')}
                            <dt>{lang}Account BIC{/lang}</dt>
                            <dd>{$active_company->getConfigValue('account_bic')|clean}</dd>
                        {/if}
                    
                    </dl>
                    
                </div>
                
                <h3 class="uk-accordion-title">Lead Details</h3>
                
                <div class="uk-accordion-content">
                
                    <dl class="uk-description-list-horizontal">
                    
                        {if $active_company->getConfigValue('lead_source')}
                            <dt>{lang}Lead Source{/lang}</dt>
                            <dd>{$active_company->getConfigValue('lead_source')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('lead_reference')}
                            <dt>{lang}Lead Reference{/lang}</dt>
                            <dd>{$active_company->getConfigValue('lead_reference')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('first_contact')}
                            <dt>{lang}First Contact{/lang}</dt>
                            <dd>{$active_company->getConfigValue('first_contact')|clean}</dd>
                        {/if}
                    
                    </dl>
                    
                </div>
                
                <h3 class="uk-accordion-title">Internal Details</h3>
                
                <div class="uk-accordion-content">
                
                    <dl class="uk-description-list-horizontal">
                    
                        {if $active_company->getConfigValue('number')}
                            <dt>{lang}Number{/lang}</dt>
                            <dd>{$active_company->getConfigValue('number')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('class')}
                            <dt>{lang}Class{/lang}</dt>
                            <dd>{$active_company->getConfigValue('class')|clean}</dd>
                        {/if}
                        
                        {if $active_company->getConfigValue('note')}
                            <dt>{lang}Note{/lang}</dt>
                            <dd>{$active_company->getConfigValue('note')|clean}</dd>
                        {/if}        
                    
                    </dl>
                    
                </div>
                
            </div>
        
            <div class="body content">
                {if is_foreachable($users)}
                    <table class="uk-table">
                        <tr>
                            <th class="icon"></th>
                            <th class="name">{lang}Person{/lang}</th>
                            <th class="last_activity">{lang}Last Seen{/lang}</th>
                        </tr>
                        {foreach from=$users item=user}
                            <tr class="{cycle values='odd,even'}">
                                <td class="icon"><img src="{$user->getAvatarUrl(true)}" alt="" /></td>
                                <td class="name">
                                    {user_link user=$user}
                                    {if $user->getConfigValue('title')}<span class="details block">{$user->getConfigValue('title')|clean}</span>{/if}
                                </td>
                                <td class="last_activity details">{if $logged_user->getId() != $user->getId()}{$user->getLastActivityOn()|ago}{/if}</td>
                            </tr>
                        {/foreach}
                    </table>
                {else}
                    <p class="empty_page">{lang}There are no users in this company{/lang}{if $add_user_url}. {lang add_url=$add_user_url}Would you like to <a href=":add_url">create one</a>?{/lang}{/if}</p>
                {/if}
            </div>
        
        </div>
    
    </div>

	<div class="uk-width-1-1 uk-width-medium-1-3">
    
        {object_quick_options object=$active_company user=$logged_user}
    
    </div>

</div>



