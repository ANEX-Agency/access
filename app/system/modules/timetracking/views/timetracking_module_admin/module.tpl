{title}Time Tracking Module{/title}
{add_bread_crumb}Details{/add_bread_crumb}

<div id="timetracking_module" class="module_admin_details">
  {include_template name=_module_info controller=modules_admin module=system}
  
  <h2 class="section_name"><span class="section_name_span">{lang}Permissions{/lang}</span></h2>
  <div class="section_container">
    <table class="module_role_permissions">
      <tr>
        <th class="role_name">{lang}Role{/lang}</th>
        <th class="permission">{lang}Can use reports?{/lang}</th>
        <th class="permission">{lang}Can manage reports?{/lang}</th>
      </tr>
    {foreach from=$roles item=role}
      <tr class="{cycle values='odd,even'}">
        <td class="role_name"><a href="{$role->getViewUrl()}">{$role->getName()|clean}</a></td>
        <td class="permission">{role_permission_value role=$role permission=use_time_reports}</td>
        <td class="permission">{role_permission_value role=$role permission=manage_time_reports}</td>
      </tr>
    {/foreach}
    </table>
  </div>
</div>