<div class="uk-width-1-1 uk-width-medium-3-4">

    <div class="field-group">
    
        <div class="field">
            {label for=pageName required=yes class="uk-form-label"}Name{/label}
            {text_field name='page[name]' value=$page_data.name id=pageName class='title required validate_minlength 3 uk-form-large uk-width-1-1'}
        </div>
      
        <div class="field">
            {label for=pageContent required=yes  class="uk-form-label"}Content{/label}
            {editor_field name='page[body]' id=pageContent class='validate_callback tiny_value_present' inline_attachments=$page_data.inline_attachments auto_expand=no class="redactor"}{$page_data.body}{/editor_field}
        </div>
        
    </div>
    
    <div class="field-group">
        
        <div class="field">
        
            {if $active_page->isNew()}
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
            {label for=pageParent required=yes class="uk-form-label"}File Under{/label}
            {select_page name='page[parent_id]' value=$page_data.parent_id project=$active_project id=pageParent skip=$active_page user=$logged_user class="uk-form-medium uk-width-1-1"}
        </div>
        
        {if $logged_user->canSeeMilestones($active_project)}
            <div class="field">
                {label for=pageMilestone class="uk-form-label"}Milestone{/label}
                {select_milestone name='page[milestone_id]' value=$page_data.milestone_id id=pageMilestone project=$active_project class="uk-form-medium uk-width-1-1"}
            </div>
        {/if}
                
        <div class="field">
            {label for=pageTags class="uk-form-label"}Tags{/label}
            {select_tags name='page[tags]' value=$page_data.tags project=$active_project id=pageTags class="uk-form-medium uk-width-1-1"}
        </div>
      
        <div class="field">
            {if $logged_user->canSeePrivate()}
                {label for=pageVisibility class="uk-form-label"}Visibility{/label}
                {select_visibility name=page[visibility] value=$page_data.visibility project=$active_project short_description=true}
            {else}
                <input type="hidden" name="page[visibility]" value="1">
            {/if}
        </div>
              
    </div>
    
    <div class="field-group">
        
        <div class="field">
        
            {if $active_page->isNew()}
                
                {label class="uk-form-label"}Notify People{/label}
                {select_assignees_inline name=notify_users project=$active_project}
                
            {else}
            
                <input type="checkbox" name="page[is_minor_revision]" value="1" id="pageIsMinorRevision" class="auto" {if $page_data.is_minor_revision}checked="checked"{/if} />
                {label for=pageIsMinorRevision class="inline uk-form-label"}This is just a minor revision. Don't create a new version and don't notify subscribers about it{/label}
                
            {/if}
        
        </div>
    
    </div>
    
</div>