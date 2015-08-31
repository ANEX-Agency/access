<!--<div class="form-wrapper">

    {if isset($active_ticket) && $active_ticket->isLoaded()}
        <p class="flash" id="success"><span class="flash_inner">{lang name=$active_ticket->getName() url=$active_ticket->getViewUrl()}Ticket <a href=":url">:name</a> has been created{/lang}</span></p>
    {/if}
    
    {form method=post id=quick_add_ticket action=$quick_add_url enctype="multipart/form-data" class='uk-form uk-form-stacked'}
    
        <div class="uk-grid">
        
            <div class="uk-width-1-1 uk-width-medium-3-4">
            
                <div class="field-group">
                
                    <div class="field">
                        {label for=quick_add_ticket_summary required=yes  class="uk-form-label"}Summary{/label}
                        {text_field name='ticket[name]' value=$ticket_data.name id=quick_add_ticket_summary class='required title validate_minlength 3 uk-form-large uk-width-1-1'}
                    </div>
                  
                    <div class="field">
                        {label for=quick_add_ticket_body class="uk-form-label"}Full description{/label}
                        {editor_field name='ticket[body]' id=quick_add_ticket_body class="redactor"}{$ticket_data.body}{/editor_field}
                    </div>
                    
                </div>
                
                <div class="field-group">
                    
                    <div class="field">
                    
                        {if $active_ticket->isNew()}
                            <div class="ctrlHolderContainer">
                                <a href="#" class="ctrlHolderToggler button_add attachments">{lang}Attach Files{/lang}</a>
                                <div class="strlHolderToggled">
                                    {label class="uk-form-label"}Attachments{/label}
                                    {attach_files max_files=5}
                                </div>
                            </div>
                        {/if}
                    
                    </div>
                
                </div>
                
            </div>
            
            <div class="uk-width-1-1 uk-width-medium-1-4">
            
                <div class="field-group">
            
                    <div class="field">
                        {label for=ticketParent class="uk-form-label"}Category{/label}
                        {select_category name='ticket[parent_id]' value=$ticket_data.parent_id id=ticketParent module=tickets controller=tickets project=$active_project user=$logged_user class="uk-form-medium uk-width-1-1"}
                    </div>
                
                    {if $logged_user->canSeeMilestones($active_project)}
                        <div class="field">
                            {label for=ticketMilestone class="uk-form-label"}Milestone{/label}
                            {select_milestone name='ticket[milestone_id]' value=$ticket_data.milestone_id project=$active_project id=ticketMilestone class="uk-form-medium uk-width-1-1"}
                        </div>
                    {/if}
                    
                    <div class="field">
                        {label for=ticketPriority class="uk-form-label"}Priority{/label}
                        {select_priority name='ticket[priority]' value=$ticket_data.priority id=ticketPriority class="uk-form-medium uk-width-1-1"}
                    </div>
                  
                    <div class="field">
                        {label for=ticketTags class="uk-form-label"}Tags{/label}
                        {select_tags name='ticket[tags]' value=$ticket_data.tags project=$active_project id=ticketTags class="uk-form-medium uk-width-1-1"}
                    </div>
                  
                    <div class="field">
                        {label for=ticketDueOn class="uk-form-label"}Due on{/label}
                        <div class="uk-form-icon uk-width-1-1">
                            <i class="uk-icon-calendar"></i>
                            <input type="text" name="ticket[due_on]" id="ticketDueOn" class="datepicker uk-form-medium uk-width-1-1" value="{$ticket_data.due_on}" />
                        </div>
                    </div>
                    
                    <div class="field">
                        {if $logged_user->canSeePrivate()}
                            {label for=ticketVisibility class="uk-form-label"}Visibility{/label}
                            {select_visibility name=ticket[visibility] value=$ticket_data.visibility project=$active_project short_description=true class="uk-form-medium uk-width-1-1"}
                        {else}
                            <input type="hidden" name="ticket[visibility]" value="1" />
                        {/if}
                    </div>
                
                </div>
                
                <div class="field-group">
                    
                    <div class="field">
                    
                        {label for=ticketAssignees class="uk-form-label"}Assignees{/label}
                        {select_assignees_inline name='ticket[assignees]' value=$ticket_data.assignees object=$active_ticket project=$active_project choose_responsible=true}
                    
                    </div>
                
                </div>
                
            </div>
            
        </div>
        
  {/form}

</div>-->





<div class="form_wrapper">
  {if isset($active_ticket) && $active_ticket->isLoaded()}
    <p class="flash" id="success"><span class="flash_inner">{lang name=$active_ticket->getName() url=$active_ticket->getViewUrl()}Ticket <a href=":url">:name</a> has been created{/lang}</span></p>
  {/if}
  
  {form method=post id=quick_add_ticket action=$quick_add_url enctype="multipart/form-data" }
    <div class="height_limited_popup">
      <div class="quick_add_columns_container">
        <div class="quick_add_left_column"><div class="quick_add_left_column_inner">
          {wrap field=name class=first_quick_add_field}
            {label for=quick_add_ticket_summary required=yes}Summary{/label}
            {text_field name='ticket[name]' value=$ticket_data.name id=quick_add_ticket_summary class='required title'}
          {/wrap}   
          
          {wrap field=body id=quick_add_ticket_body_wrapper}
            {label for=quick_add_ticket_body}Full description{/label}
            {textarea_field name='ticket[body]' id=quick_add_ticket_body}{$ticket_data.body}{/textarea_field}
          {/wrap}
          
          <div class="ctrlHolderContainer">
            {if $logged_user->canSeeMilestones($active_project)}
              <a href="#" class="ctrlHolderToggler">{lang}Set Milestone and Category{/lang}...</a>
            {else}
              <a href="#" class="ctrlHolderToggler">{lang}Set Category{/lang}...</a>
            {/if}
            <div class="strlHolderToggled">
              {if $logged_user->canSeeMilestones($active_project)}
              <div class="col_wide">
                {wrap field=milestone_id}
                  {label for=ticketMilestone}Milestone{/label}
                  {select_milestone name='ticket[milestone_id]' value=$ticket_data.milestone_id project=$active_project id=ticketMilestone}
                {/wrap}
              </div>
              {/if}
              <div class="col_wide2">
                {wrap field=parent_id}
                  {label for=ticketParentPopup}Category{/label}
                  {select_category name='ticket[parent_id]' value=$ticket_data.parent_id id=ticketParentPopup module=tickets controller=tickets project=$active_project user=$logged_user}
                {/wrap}
              </div>
            </div>
          </div>
          <div class="ctrlHolderContainer">
            <a href="#" class="ctrlHolderToggler">{lang}Attach Files{/lang}...</a>
            <div class="strlHolderToggled">
              {wrap field=popup_attachments}
                {label for=popup_attachments}Attachments{/label}
                {attach_files id=attach_files_popup max_files=5}
              {/wrap}
            </div>
          </div>
        </div></div>
        
        <div class="quick_add_right_column"><div class="quick_add_right_column_inner">
          {wrap field=assignees}
            {label for=ticketAssignees}Assignees{/label}
            {select_assignees_inline name='ticket[assignees]' value=$ticket_data.assignees object=$active_ticket project=$active_project choose_responsible=true id=select_asignees_popup users_per_row=1}
          {/wrap}      
        </div>
        
          <div class="ctrlHolderContainer">
            <a href="#" class="ctrlHolderToggler">{lang}Set Due On{/lang}...</a>
            <div class="strlHolderToggled">
              {wrap field=due_on}
                {label for=ticketVisibility}Due On{/label}
                {select_date name='ticket[due_on]' value=$ticket_data.due_on id=ticketDueOn}
              {/wrap}
            </div>
          </div>
        
          {if $logged_user->canSeePrivate()}
          <div class="ctrlHolderContainer">
            <a href="#" class="ctrlHolderToggler">{lang}Set Visibility{/lang}...</a>
            <div class="strlHolderToggled">
              {wrap field=visibility}
                {label for=ticketVisibility}Visibility{/label}
                {select_visibility name=ticket[visibility] value=$ticket_data.visibility project=$active_project short_description=true}
              {/wrap}
            </div>
          </div>
          {else}
            <input type="hidden" name="ticket[visibility]" value="1" />
          {/if}
        </div>
      </div>
    </div>
    
    <div class="wizardbar">
      {submit accesskey=no class='submit'}Submit{/submit}<a href="#" class="wizzard_back">{lang}Back{/lang}</a>
    </div>
    <input type="hidden" name="ticket[project_id]" value="{if $project_id}{$project_id}{else}{$ticket_data.project_id}{/if}" />
  {/form}
</div>


<script type="text/javascript">
{literal}
  if (App.ModalDialog.isOpen) {
    App.ModalDialog.setWidth(850);
  } // if
{/literal}
</script>