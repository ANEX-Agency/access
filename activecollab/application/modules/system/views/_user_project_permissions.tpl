<!--<table class="uk-table" id="{$_select_user_project_permissions_id}">

    {foreach from=$_select_user_project_permissions_roles item=_role}
    
        <tr>
            <td class="radio">
                <input type="radio" name="{$_select_user_project_permissions_name}[{$_select_user_project_permissions_role_id_field}]" value="{$_role->getId()}" id="select_user_permission_role_{$_role->getId()}" class="" {if $_select_user_project_permissions_role_id == $_role->getId()}checked="checked"{/if} />
           </td>
            <td class="label">
                <label for="select_user_permission_role_{$_role->getId()}" class="uk-form-label">{$_role->getName()|clean}</label>
            </td>
        </tr>
    
    {/foreach}
    
    <tr>
        <td class="radio">
        	<input type="radio" name="{$_select_user_project_permissions_name}[{$_select_user_project_permissions_role_id_field}]" value="0" id="select_user_permission_role_0" class="" {if $_select_user_project_permissions_role_id != 0}checked="checked"{/if} />
        </td>
        <td class="label">
        	<label for="select_user_permission_role_0" class="uk-form-label">{lang}Custom Permissions{/lang}</label>
            <div class="custom-permissions" {if $_select_user_project_permissions_role_id > 0}style="display: none"{/if}>
                {assign_var name=select_project_permissions_name}{$_select_user_project_permissions_name}[{$_select_user_project_permissions_permissions_field}]{/assign_var}
                {select_project_permissions name=$select_project_permissions_name value=$_select_user_project_permissions_permissions}
            </div>
        </td>
    </tr>
    
</table>

<script type="text/javascript">
	App.widgets.SelectUserProjectPermissions.init('{$_select_user_project_permissions_id}');
</script>-->



<div class="user-project-permissions" id="{$_select_user_project_permissions_id}">

    <ul>
        <li>
            <input type="radio" name="{$_select_user_project_permissions_name}[{$_select_user_project_permissions_role_id_field}]" value="0" id="select_user_permission_role_0" class="" {if $_select_user_project_permissions_role_id == 0}checked="checked"{/if} />
            <label for="select_user_permission_role_0" class="uk-form-label">{lang}Custom Permissions{/lang}</label>
        </li>
        
        {foreach from=$_select_user_project_permissions_roles item=_role}
            <li>
                <input type="radio" name="{$_select_user_project_permissions_name}[{$_select_user_project_permissions_role_id_field}]" value="{$_role->getId()}" id="select_user_permission_role_{$_role->getId()}" class="" {if $_select_user_project_permissions_role_id == $_role->getId()}checked="checked"{/if} />
                <label for="select_user_permission_role_{$_role->getId()}" class="uk-form-label">{$_role->getName()|clean}</label>
            </li>
        {/foreach}
        
    </ul>
    
    <div class="custom-permissions" {if $_select_user_project_permissions_role_id > 0}style="display: none"{/if}>
        {assign_var name=select_project_permissions_name}{$_select_user_project_permissions_name}[{$_select_user_project_permissions_permissions_field}]{/assign_var}
        {select_project_permissions name=$select_project_permissions_name value=$_select_user_project_permissions_permissions}
    </div>
    
</div>


<script type="text/javascript">
	App.widgets.SelectUserProjectPermissions.init('{$_select_user_project_permissions_id}');
</script>
