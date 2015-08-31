{title}Edit Settings{/title}
{add_bread_crumb}Edit Settings{/add_bread_crumb}

<div id="edit_user_settings">

    {form action=$active_user->getEditSettingsUrl() method=post autofocus=no class="uk-form"}
    
        <div class="uk-accordion" data-uk-accordion>
        	
            {if LOCALIZATION_ENABLED}
            
                <h3 class="uk-accordion-title">{lang}Locale{/lang}</h3>
                
                <div class="uk-accordion-content">
                
                    <div class="uk-grid">
                    
                        <div class="uk-width-1-1">
                        
                            <div class="field-group">
                            
                                <div class="field">
                                    {label for=userLanguage class="uk-form-label"}Language{/label}
                                    {select_language name='user[language]' value=$user_data.language optional=yes id=userLanguage class="uk-width-1-1"}
                                </div>
                                
                            </div>
                        
                        </div>
                    
                    </div>
                
                </div>
                
            {/if}
            
            <h3 class="uk-accordion-title">{lang}Date and Time{/lang}</h3>
            
            <div class="uk-accordion-content">
            
                <div class="uk-grid">
                
                    <div class="uk-width-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userFormatDate class="uk-form-label"}Date Format{/label}
                                {select_datetime_format name='user[format_date]' value=$user_data.format_date optional=yes id=userFormatDate mode=date class="uk-width-1-1"}
                            </div>
                            
                        </div>
                    
                    </div>
                    
                    <div class="uk-width-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userFormatTime class="uk-form-label"}Time Format{/label}
                                {select_datetime_format name='user[format_time]' value=$user_data.format_time optional=yes id=userFormatTime mode=time class="uk-width-1-1"}
                            </div>
                        
                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                                                
                            <div class="field">
                                {label for=userFirstWeekday class="uk-form-label"}First Day of the Week{/label}
                                {select_week_day name='user[time_first_week_day]' value=$user_data.time_first_week_day id=userFirstWeekday class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                    
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userTimezone class="uk-form-label"}Timezone{/label}
                                {select_timezone name='user[time_timezone]' value=$user_data.time_timezone optional=no id=userTimezone class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userDST class="uk-form-label"}Daylight Saving Time{/label}
                                {yes_no_default name='user[time_dst]' value=$user_data.time_dst default=$default_dst_value id=userDST class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                
                </div>
            
            </div>
            
            <h3 class="uk-accordion-title">{lang}Miscellaneous{/lang}</h3>
            
            <div class="uk-accordion-content">
            
                <div class="uk-grid">
                
                    <div class="uk-width-1-1">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=defaultAssignmentsFilter class="uk-form-label"}Default Assignments Filter{/label}
                                {select_default_assignment_filter name='user[default_assignments_filter]' value=$user_data.default_assignments_filter id=defaultAssignmentsFilter optional=yes user=$active_user class="uk-width-1-1"}
                            </div>

                            <div class="field">
                                {label for=userTheme class="uk-form-label"}Theme{/label}
                                {select_theme name=user[theme] value=$user_data.theme id=userTheme optional=yes class="uk-width-1-1"}
                            </div>
                            
                            <div class="field">
                                {label for=userVisualEditor class="uk-form-label"}Visual Editor{/label}
                                {yes_no name=user[visual_editor] value=$user_data.visual_editor id=userVisualEditor class="uk-width-1-1"}  
                            </div>
                                
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
            {if $logged_user->isPeopleManager()}

                <h3 class="uk-accordion-title">{lang}Automatically Add to New Project{/lang}</h3>
                
                <div class="uk-accordion-content">
                
                    <div class="uk-grid">
                    
                        <div class="uk-width-1-1">
                        
                            <div class="field-group">
                            
                                <div class="field">
                                
                                    {yes_no name=user[auto_assign] value=$user_data.auto_assign id=userAutoAssign}  
                                    <p class="details">{lang}Select <b>Yes</b> to have this user automatically added to each new project{/lang}</p>
                                    
                                    <div id="auto_assign_role_and_permissions" {if !$user_data.auto_assign}style="display: none"{/if}>
                                        <p>{lang}Please select a role or set custom permissions for user in this project{/lang}:</p>
                                        {select_user_project_permissions name=user role_id=$user_data.auto_assign_role_id permissions=$user_data.auto_assign_permissions role_id_field=auto_assign_role_id permissions_field=auto_assign_permissions}
                                    </div>
                                    
                                </div>
                                    
                            </div>
                        
                        </div>
                    
                    </div>
                
                </div>
                
            {/if}
            
        </div>
        
        {wrap_buttons}
            {submit class="uk-button uk-button-primary"}Submit{/submit}
        {/wrap_buttons}
  
    {/form}
    
</div>