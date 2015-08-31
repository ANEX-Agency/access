<nav id="menu">

    {if $_menu && is_foreachable($_menu->groups)}
    
        <ul>
        
            {foreach from=$_menu->groups key=_menu_group_name item=_menu_group}
            
                {foreach from=$_menu_group->items item=_menu_item name=_menu_items}
                
                    {if $smarty.foreach._menu_items.iteration == 1}
                    
                        <li class="item{if $_menu_group->items|@count == 1} single{else} first{/if}{if $wireframe->current_menu_item == $_menu_item->name} active{/if}" id="menu_item_{$_menu_item->name|clean}">
                            {$_menu_item->render()}
                        </li>
                        
                    {elseif $smarty.foreach._menu_items.iteration == count($_menu_group->items)}
                    
                        <li class="item {if $wireframe->current_menu_item == $_menu_item->name} active{/if} last" id="menu_item_{$_menu_item->name|clean}">
                        	{$_menu_item->render()}
                        </li>
                        
                    {else}
                    
                        <li class="item middle{if $wireframe->current_menu_item == $_menu_item->name} active{/if}" id="menu_item_{$_menu_item->name|clean}">
                        	{$_menu_item->render()}
                        </li>
                        
                    {/if}
                    
                {/foreach}
            
            {/foreach}
        
        </ul>
    
    {/if}
    
</nav>