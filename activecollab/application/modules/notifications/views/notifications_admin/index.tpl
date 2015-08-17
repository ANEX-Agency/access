{title}Notification Settings{/title}
{add_bread_crumb}Notifications{/add_bread_crumb}

  <h2 class="section_name"><span class="section_name_span">{lang}Status{/lang}</span></h2>
  <div class="section_container content">
  <ul>
    {if $notifications_enabled}
      <li>{lang}Automatic notification is <strong>enabled</strong>{/lang}.</li>
      <li>{lang}Notifications will be sent out <strong>{$when_to_send_fmt}</strong>{/lang}</li>
      {if $notifications_notify_today}
      	<li>{lang}Notifications will be sent <strong>{$notifications_data.days_to_due}</strong> day(s) before due date and the day it is due{/lang}</li>
      {else}
      	<li>{lang}Notifications will be sent <strong>{$notifications_data.days_to_due}</strong> day(s) before due date{/lang}</li>
      {/if}
      {if $notifications_notify_owner_company}
	      {if $notifications_notify_responsible}
	      	<li>{lang}Notifications will be sent only to <strong>responsible assignee</strong> from the <strong>owner company</strong>{/lang}</li>
	      {else}
	      	<li>{lang}Notifications will be sent to <strong>all assignees</strong> from the owner company{/lang}</li>
	      {/if}      
      {else}
	      {if $notifications_notify_responsible}
	      	<li>{lang}Notifications will be sent only to <strong>responsible assignee</strong> regardless of company{/lang}</li>
	      {else}
	      	<li>{lang}Notifications will be sent to <strong>all assignees</strong> regardless of company{/lang}</li>
	      {/if}
      {/if}
    {else}
      <li>{lang}Automatic notification is <strong>disabled</strong>{/lang}.</li>
    {/if}
    <li>{lang}System time (w/o timezone settings) is <strong>{$system_time}</strong>{/lang}</li>
  </ul>
  
  <div class="clear"></div>
  </div>

  <h2 class="section_name"><span class="section_name_span">{lang}Settings{/lang}</span></h2>
  <div class="section_container">
    {form action=$notifications_admin_url method=POST}
      
      <div class="col">
        {wrap field=enabled}
          {label for=enabled required=yes}Enable notifications:{/label}
          {yes_no name='notifications[enabled]' id='enabled' value=$notifications_data.enabled}
        {/wrap}
      </div>
      
      <div class="col">
      {wrap field=notify_today}
          {label for=notify_today required=no}Notify on due date?:{/label}
          {yes_no name='notifications[notify_today]' id='notify_today' value=$notifications_data.notify_today}
        {/wrap}
      </div>

<div class="clear"></div>

      <div class="col">
      {wrap field=notify_responsible}
          {label for=notify_responsible required=no}Notify only responsible assignee?:{/label}
          {yes_no name='notifications[notify_responsible]' id='notify_responsible' value=$notifications_data.notify_responsible}
        {/wrap}
      </div>
      
      <div class="col">
      {wrap field=notify_owner_company}
          {label for=notify_owner_company required=no}Notify only assignees from owner company?:{/label}
          {yes_no name='notifications[notify_owner_company]' id='notify_owner_company' value=$notifications_data.notify_owner_company}
        {/wrap}
      </div>

<div class="clear"></div>

      <div class="col">
        {wrap field=when_to_send}
          {label for=when_to_send required=yes}Hour of day to send:{/label}
          <select class="required" name="notifications[when_to_send]" id='when_to_send' value=$notifications_data.when_to_send>
          {foreach from=$when_to_send_values item=when_to_send_value}
            {if $when_to_send_value == $notifications_data.when_to_send}
            <option value="{$when_to_send_value}" selected="selected">{$when_to_send_names.$when_to_send_value}</option>
            {else}
            <option value="{$when_to_send_value}">{$when_to_send_names.$when_to_send_value}</option>
            {/if}
          {/foreach}
          </select>
        {/wrap}
      </div>
      
      <div class="col">
        {wrap field=days_to_due}
          {label for=days_to_due required=yes}Notify days in advance:{/label}
          <select class="required" name="notifications[days_to_due]" id='days_to_due' value=$notifications_data.days_to_due>
          {foreach from=$days_to_due_values item=days_to_due_value}
            {if $days_to_due_value == $notifications_data.days_to_due}
            <option value="{$days_to_due_value}" selected="selected">{$days_to_due_value} {lang}days before due date{/lang}</option>
            {else}
            <option value="{$days_to_due_value}">{$days_to_due_value} {lang}days before due date{/lang}</option>
            {/if}
          {/foreach}
          </select>
        {/wrap}
      </div>      
      
      <div class="clear"></div>
      
      {wrap_buttons}
        {submit}Submit{/submit}
      {/wrap_buttons}
    {/form}
  </div>
