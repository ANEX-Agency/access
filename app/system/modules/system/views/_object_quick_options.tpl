<div class="actions">
    <ul>
    
        {foreach from=$_quick_options->data key=_quick_option_name item=_quick_option}
        
            <li {if isset($_quick_option.class)}class="{$_quick_option.class|clean}"{/if} id="object_quick_option_{$_quick_option_name}">
            	{link href=$_quick_option.url method=$_quick_option.method confirm=$_quick_option.confirm not_lang=yes}
                    {$_quick_option.text|clean}
                {/link}
            </li>
            
        {/foreach}
        
    </ul>
</div>