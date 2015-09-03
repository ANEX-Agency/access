{title}Administration{/title}
{add_bread_crumb}Available Administration Tools{/add_bread_crumb}

<div class="admin_sections_container">

    {foreach from=$admin_sections key=section_name item=section}
        {if is_foreachable($section)}
            <div class="admin_section {cycle values='odd,even'}">
                <h3>{lang}{$section_name}{/lang}</h3>
                
                <div class="uk-grid" data-uk-grid-margin>
                
                    {foreach from=$section item=admin_section}
                        {foreach from=$admin_section item=subsection}
                            <div class="uk-width-1-2 uk-width-small-1-3 uk-width-medium-1-4 uk-width-large-1-6">
                                <a href="{$subsection.url}"><img src="{$subsection.icon}" alt="{$subsection.name}" /><span>{$subsection.name}</span></a>
                            </div>
                        {/foreach}
                    {/foreach}
                    
                </div>
                
                <!--<ul>
                    {foreach from=$section item=admin_section}
                        {foreach from=$admin_section item=subsection}
                            <li><a href="{$subsection.url}"><img src="{$subsection.icon}" alt="{$subsection.name}" /><span>{$subsection.name}</span></a></li>
                        {/foreach}
                    {/foreach}
                </ul>
                <div class="clear"></div>-->
            </div>
        {/if}
    {/foreach}

    <div class="admin_section {cycle values='odd,even'}">
        <h3>{lang}System information{/lang}</h3>
        <div class="installation_details">
            <dl>
                <dt>{lang}Version{/lang}:</dt>
                <dd>{$ac_version}</dd>
                <dt>{lang}License Key{/lang}:</dt>
                <dd>-</dd>
                <dt>{lang}Support Expires{/lang}:</dt>
                <dd>Full License</dd>
                <dt>{lang}Platform{/lang}:</dt>
                <dd>{lang php_version=$php_version mysql_version=$mysql_version}PHP (:php_version), MySQL (:mysql_version){/lang}</dd>
            </dl>
        </div>
    </div>
    
</div>