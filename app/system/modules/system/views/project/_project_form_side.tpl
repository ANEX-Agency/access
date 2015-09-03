{if $logged_user->isOwner()}

    <div class="field">
        {label for=projectLader required=yes class="uk-form-label"}Leader{/label}
        {select_user name='project[leader_id]' value=$project_data.leader_id id="projectLader" optional=no class="uk-form-medium uk-width-1-1"}
    </div>

    <div class="field">
        {label for=projectCompany class="uk-form-label"}Client{/label}
        {select_company name='project[company_id]' value=$project_data.company_id id=projectCompany optional=yes exclude=$owner_company->getId() class="uk-form-medium uk-width-1-1"}
    </div>
        
{else}
    
    <div class="field">
        {label for=projectLader required=yes class="uk-form-label"}Leader{/label}
        {select_user name='project[leader_id]' value=$project_data.leader_id id="projectLader" users=$logged_user->visibleUserIds() optional=no class="uk-form-medium uk-width-1-1"}
    </div>

    <div class="field">
        {label for=projectCompany class="uk-form-label"}Client{/label}
        {select_company name='project[company_id]' value=$project_data.company_id id=projectCompany companies=$logged_user->visibleCompanyIds() optional=yes exclude=$owner_company->getId() class="uk-form-medium uk-width-1-1"}
    </div>
        
{/if}
    
<div class="field">
    {label for=projectGroup class="uk-form-label"}Group{/label}
    {select_project_group name='project[group_id]' value=$project_data.group_id id="projectGroup" optional=yes class="uk-form-medium uk-width-1-1"}
</div>
    
<div class="field">
    {label for=projectStartsOn class="uk-form-label"}Starts On{/label}
    <div class="uk-form-icon uk-width-1-1">
        <i class="uk-icon-calendar"></i>
        <input type="text" name="project[starts_on]" class="datepicker uk-form-medium uk-width-1-1" value="{$project_data.starts_on}" />
    </div>
</div>

{if $logged_user->canSeePrivate()}

    {assign_var name=project_visibility_normal_caption}{lang}<span title="Visible to everyone involved with the project">Normal</span>{/lang}{/assign_var}
    {assign_var name=project_visibility_private_caption}{lang}<span title="Visible only to people with can_see_private_objects role permission">Private</span>{/lang}{/assign_var}

    <div class="field">
        {label for=projectVisibility class="uk-form-label"}Default Visibility{/label}
        {select_visibility name='project[default_visibility]' value=$project_data.default_visibility id=projectVisibility normal_caption=$project_visibility_normal_caption private_caption=$project_visibility_private_caption}
    </div>

{else}

    <input type="hidden" name="project[default_visibility]" value="{$project_data.default_visibility}" />
  
{/if}