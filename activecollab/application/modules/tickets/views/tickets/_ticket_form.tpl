<div class="uk-grid">

    <div class="uk-width-1-1 uk-width-medium-3-4">
    
        <div class="field-group">
        
            <div class="field">
                {label for=ticketSummary required=yes class="uk-form-label"}Summary{/label}
                {text_field name='ticket[name]' value=$ticket_data.name id=ticketSummary class="title required validate_minlength 3 uk-form-large uk-width-1-1"}
            </div>
          
            <div class="field">
                {label for=ticketBody class="uk-form-label"}Full description{/label}
                {editor_field name='ticket[body]' id=ticketBody inline_attachments=$ticket_data.inline_attachments class="redactor"}{$ticket_data.body}{/editor_field}
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