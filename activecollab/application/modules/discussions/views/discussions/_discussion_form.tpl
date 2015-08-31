<div class="uk-grid">

    <div class="uk-width-1-1 uk-width-medium-3-4">
    
        <div class="field-group">
        
            <div class="field">
                {label for=discussionSummary required=yes class="uk-form-label"}Summary{/label}
                {text_field name='discussion[name]' value=$discussion_data.name id=discussionSummary class='title required validate_minlength 3 uk-form-large uk-width-1-1'}
            </div>
          
            <div class="field">
                {label for=discussionBody required=yes class="uk-form-label"}Message{/label}
                {editor_field name='discussion[body]' id=discussionBody class="validate_callback tiny_value_present" inline_attachments=$discussion_data.inline_attachments class="redactor"}{$discussion_data.body}{/editor_field}
            </div>
            
        </div>
        
        <div class="field-group">
            
            <div class="field">
            
                {if $active_discussion->isNew()}
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
                {label for=discussionParent class="uk-form-label"}Category{/label}
                {select_category name='discussion[parent_id]' value=$discussion_data.parent_id id=discussionParent module=discussions controller=discussions project=$active_project user=$logged_user optional=yes class="uk-form-medium uk-width-1-1"}
            </div>
            
            {if $logged_user->canSeeMilestones($active_project)}
                <div class="field">
                    {label for=discussionMilestone class="uk-form-label"}Milestone{/label}
                    {select_milestone name='discussion[milestone_id]' value=$discussion_data.milestone_id project=$active_project class="uk-form-medium uk-width-1-1"}
                </div>
            {/if}
          
            <div class="field">
                {label for=discussionTags class="uk-form-label"}Tags{/label}
                {select_tags name='discussion[tags]' value=$discussion_data.tags project=$active_project id=discussionTags class="uk-form-medium uk-width-1-1"}
            </div>
            
            <div class="field">
                {if $logged_user->canSeePrivate()}
                    {label for=discussionVisibility class="uk-form-label"}Visibility{/label}
                    {select_visibility name=discussion[visibility] value=$discussion_data.visibility project=$active_project short_description=true class="uk-form-medium uk-width-1-1"}
                {else}
                    <input type="hidden" name="discussion[visibility]" value="1" />
                {/if} 
            </div>
        
        </div>
        
        <div class="field-group">
            
            {if $active_discussion->isNew()}
                <div class="field">
                    {label class="uk-form-label"}Notify People{/label}
                    {select_assignees_inline name=notify_users project=$active_project}
                </div>
            {/if} 
        
        </div>
        
    </div>
    
</div>



   


  
  
  
