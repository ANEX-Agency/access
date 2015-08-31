<div class="uk-width-1-1 uk-width-medium-3-4">

    <div class="field-group">
    
        <div class="field">
            {label for=projectName required=1}Name{/label}
            {text_field name='project[name]' value=$project_data.name id=projectName class="title uk-form-large uk-width-1-1"}
        </div>
      
        <div class="field">
            {label for=projectOverview}Overview{/label}
            {editor_field name='project[overview]' id=projectOverview class=redactor inline_attachments=$project_data.inline_attachments}{$project_data.overview}{/editor_field}
        </div>
        
    </div>
    
    <div class="field-group">
    
        {label for=projectAdditionalLinks}Additional Links{/label}

        {foreach from=$project_data.links key=k item=item}
        
            <div class="field">
            
                <div class="uk-grid uk-grid-small">
                    <div class="uk-width-1-1 uk-width-medium-1-3">
                        <input type="text" name="project[links][{$k}][name]" placeholder="Link Name" value="{$item.name}" class="uk-width-1-1" />
                    </div>
                    <div class="uk-width-1-1 uk-width-medium-2-3">
                        <input type="text" name="project[links][{$k}][url]" placeholder="Link URL" value="{$item.url}" class="uk-width-1-1" />
                    </div>
                </div>
            
            </div>
                                
        {/foreach}
        
        <div class="field">
        
            <div class="uk-grid uk-grid-small">
                <div class="uk-width-1-1 uk-width-medium-1-3">
                    <input type="text" name="project[links][new0][name]" placeholder="Link Name" value="" class="uk-width-1-1" />
                </div>
                <div class="uk-width-1-1 uk-width-medium-2-3">
                    <input type="text" name="project[links][new0][url]" placeholder="Link URL" value="" class="uk-width-1-1" />
                </div>
            </div>
        
        </div>
        
        <!--
        <div class="field">
            <a class="btn btn-secondary" href="#">Add another link</a>
        </div>
        -->

    </div>

</div>

<div class="uk-width-1-1 uk-width-medium-1-4">
        
    {if $logged_user->isOwner()}
    
        <div class="field">
            {label for=projectLader required=yes}Leader{/label}
            {select_user name='project[leader_id]' value=$project_data.leader_id id="projectLader" optional=no class="uk-form-medium uk-width-1-1"}
        </div>
    
        <div class="field">
            {label for=projectCompany}Client{/label}
            {select_company name='project[company_id]' value=$project_data.company_id id=projectCompany optional=yes exclude=$owner_company->getId() class="uk-form-medium uk-width-1-1"}
        </div>
            
    {else}
        
        <div class="field">
            {label for=projectLader required=yes}Leader{/label}
            {select_user name='project[leader_id]' value=$project_data.leader_id id="projectLader" users=$logged_user->visibleUserIds() optional=no class="uk-form-medium uk-width-1-1"}
        </div>
    
        <div class="field">
            {label for=projectCompany}Client{/label}
            {select_company name='project[company_id]' value=$project_data.company_id id=projectCompany companies=$logged_user->visibleCompanyIds() optional=yes exclude=$owner_company->getId() class="uk-form-medium uk-width-1-1"}
        </div>
            
    {/if}
        
    <div class="field">
        {label for=projectGroup}Group{/label}
        {select_project_group name='project[group_id]' value=$project_data.group_id id="projectGroup" optional=yes class="uk-form-medium uk-width-1-1"}
    </div>
        
    <div class="field">
        {label for=projectStartsOn}Starts On{/label}
        <div class="uk-form-icon uk-width-1-1">
            <i class="uk-icon-calendar"></i>
            <input type="text" name="project[starts_on]" class="datepicker uk-form-medium uk-width-1-1" value="{$project_data.starts_on}" />
        </div>
    </div>
    
    {if $logged_user->canSeePrivate()}
    
        {assign_var name=project_visibility_normal_caption}{lang}Normal &mdash; <span class="details">Visible to everyone involved with the project</span>{/lang}{/assign_var}
        {assign_var name=project_visibility_private_caption}{lang}Private &mdash; <span class="details">Visible only to people with can_see_private_objects role permission</span>{/lang}{/assign_var}
    
        <div class="field">
            {label for=projectVisibility}Default Visibility{/label}
            {select_visibility name='project[default_visibility]' value=$project_data.default_visibility id=projectVisibility normal_caption=$project_visibility_normal_caption private_caption=$project_visibility_private_caption}
        </div>

    {else}
    
        <input type="hidden" name="project[default_visibility]" value="{$project_data.default_visibility}" />
      
    {/if}

</div>