<div class="uk-grid">

    <div class="uk-width-1-1 uk-width-medium-3-4">
    
        <div class="field-group">
        
            <div class="field">
                {label for=milestoneName required=yes class="uk-form-label"}Summary{/label}
                {text_field name='milestone[name]' value=$milestone_data.name id=milestoneName class='title required validate_minlength 3 uk-form-large uk-width-1-1'}
            </div>
                      
            <div class="field">
                {label for=milestoneBody class="uk-form-label"}Notes{/label}
                {editor_field name='milestone[body]' id=milestoneBody inline_attachments=$milestone_data.inline_attachments class="redactor"}{$milestone_data.body}{/editor_field}
            </div>
            
        </div>
        
    </div>
    
    <div class="uk-width-1-1 uk-width-medium-1-4">
    
    	<div class="field-group">
        
            {if $active_milestone->isNew()}
            
                <div class="field">
                
                    {label for=milestoneStartOn required=yes class="uk-form-label"}Start on{/label}
                    <div class="uk-form-icon uk-width-1-1">
                        <i class="uk-icon-calendar"></i>
                        <input type="text" name="milestone[start_on]" id="milestoneStartOn" class="required datepicker uk-form-medium uk-width-1-1" value="{$milestone_data.start_on}" />
                    </div>
                    
                </div>
                
                <div class="field">
                
                    {label for=milestoneDueOn required=yes class="uk-form-label"}Due on{/label}
                    <div class="uk-form-icon uk-width-1-1">
                        <i class="uk-icon-calendar"></i>
                        <input type="text" name="milestone[due_on]" id="milestoneDueOn" class="required datepicker uk-form-medium uk-width-1-1" value="{$milestone_data.due_on}" />
                    </div>
                    
                </div>
                        
            {/if}
        
            <div class="field">
                {label for=milestonePriority class="uk-form-label"}Priority{/label}
                {select_priority name='milestone[priority]' value=$milestone_data.priority id=milestonePriority class="uk-form-medium uk-width-1-1"}
            </div>
          
            <div class="field">
                {label for=milestoneTags class="uk-form-label"}Tags{/label}
                {select_tags name='milestone[tags]' value=$milestone_data.tags project=$active_project id=milestoneTags class="uk-form-medium uk-width-1-1"}
            </div>
        
        </div>
        
        <div class="field-group">
            
            <div class="field">
                {label for=milestoneAssignees class="uk-form-label"}Assignees{/label}
                {select_assignees_inline name='milestone[assignees]' value=$milestone_data.assignees object=$active_milestone project=$active_project choose_responsible=true}
            </div>
        
        </div>
        
    </div>
    
</div>