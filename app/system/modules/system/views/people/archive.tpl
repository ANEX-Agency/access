{title}People{/title}
{add_bread_crumb}Companies{/add_bread_crumb}

<div id="companies">

	<div class="uk-grid">
    
    	<div class="uk-width-1-1 uk-width-medium-2-3">
        
            <div class="object-list">
            
                {if is_foreachable($companies)}
                
                    <table>
                        {foreach from=$companies item=company}
                            <tr class="{cycle values='odd,even'}">
                                <td class="icon"><img src="{$company->getLogoUrl()}" alt="" /></td>
                                <td class="name">{company_link company=$company}
                                {if $company->isOwner()}
                                    <span class="details">({lang}Owner Company{/lang})</span>
                                {/if}
                                </td>
                            </tr>
                        {/foreach}
                    </table>
                
                {if $pagination->getLastPage() > 1}
                    <div class="pagination">{pagination pager=$pagination}{assemble route=people_archive page='-PAGE-'}{/pagination}</div>
                {/if}
                                
                {else}
                    <p class="empty_page">{lang}There are no companies in the archive{/lang}</p>
                {/if}
            
            </div>
        
        </div>
        
    	<div class="uk-width-1-1 uk-width-medium-1-3">
            
            <ul class="category-list">
                <li><a href="{assemble route=people}"><span>{lang}Companies{/lang}</span></a></li>
                {if $logged_user->isPeopleManager()}
                    <li class="selected"><a href="{assemble route=people_archive}"><span>{lang}Archive{/lang}</span></a></li>
                {/if}
            </ul>
        
        </div>
        
    </div>
    
</div>