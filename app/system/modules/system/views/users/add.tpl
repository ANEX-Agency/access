{title}New User{/title}
{add_bread_crumb}New User{/add_bread_crumb}

<div id="new_user">

    {form action=$active_company->getAddUserUrl() method=post class="uk-form"}
    
	<div class="uk-grid">
    
    	<div class="uk-width-1-1 uk-width-medium-1-2">
        
        	<div class="field-group">
            
                <div class="field">
                
                    {label for=userEmail required=yes class="uk-form-label"}Email{/label}
                    {text_field name=user[email] value=$user_data.email id=userEmail class='required validate_email' class="uk-width-1-1"}
                
                </div>
                
            </div>
        
        </div>
        
    	<div class="uk-width-1-1 uk-width-medium-1-2">
        
        	<div class="field-group">
            
                <div class="field">
                
                    {if $active_user->canChangeRole($logged_user)}
                    
                        {label for=userRole required=yes class="uk-form-label"}Role{/label}
                        
                        {if $only_administrator}
                        
                            {role_name role=$active_user->getRole()}
                            <input type="hidden" name="user[role_id]" value="{$user_data.role_id}" class="uk-width-1-1" />
                            
                        {else}
                        
                            {select_role name=user[role_id] active_user=$active_user value=$user_data.role_id id=userRole class="required uk-width-1-1"}
                            
                        {/if}
                        
                    {/if}
                
                </div>
                
            </div>
        
        </div>
    
    </div>
        
    <p>{lang}The following properties are optional. You can set them now, or at any point in the future{/lang}:</p>
    
    <div id="additional_steps">
    
        <!-- Profile -->
        <div id="additional_step_profile_details" class="additional_step">
        
            <div class="head">
                <input type="checkbox" name="user[profile_details]" {if $user_data.profile_details}checked="checked"{/if} value="1" class="auto input_checkbox" id="userFormProfileDetails" />
                {label for=userFormProfileDetails class=inline}Set user details, such as first and last name and company title{/label}
            </div>
                        
            <div class="body">
            
                <div class="uk-grid">
                
                    <div class="uk-width-1-1 uk-width-medium-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                            
                                {label for=userFirstName class="uk-form-label"}First Name{/label}
                                {text_field name=user[first_name] value=$user_data.first_name id=userFirstName class="uk-width-1-1"}
                            
                            </div>
                            
                        </div>
                        
                    </div>
                    
                    <div class="uk-width-1-1 uk-width-medium-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                            
                                {label for=userLastName class="uk-form-label"}Last Name{/label}
                                {text_field name=user[last_name] value=$user_data.last_name id=userLastName class="uk-width-1-1"}
                            
                            </div>
                            
                        </div>
                        
                    </div>
                    
                    <div class="uk-width-1-1 uk-width-medium-1-3">
                    
                        <div class="field-group">
                            
                            <div class="field">
                            
                                {label for=userTitle class="uk-form-label"}Title{/label}
                                {text_field name='user[title]' value=$user_data.title id=userTitle class="uk-width-1-1"}
                            
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <!-- Specify password -->
        <div id="additional_step_password" class="additional_step">
        
            <div class="head">
                <input type="checkbox" name="user[specify_password]" {if $user_data.specify_password}checked="checked"{/if} value="1" class="auto input_checkbox" id="userFormSetPassword" />
                {label for=userFormSetPassword class=inline}Specify the account password. If not entered, then the system will a generate random password{/label}
            </div>
            
            <div class="body">
            
                <div class="uk-grid">
                
                    <div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                            
                                {label for=userPassword class="uk-form-label"}Password{/label}
                                {password_field name='user[password]' value=$user_data.password id=userPassword class="uk-width-1-1"}
                            
                            </div>
                            
                        </div>
                        
                    </div>
                    
                    <div class="uk-width-1-1 uk-width-medium-1-2">
                    
                        <div class="field-group">
                            
                            <div class="field">
                            
                                {label for=userPasswordA class="uk-form-label"}Retype{/label}
                                {password_field name='user[password_a]' value=$user_data.password_a id=userPasswordA class="uk-width-1-1"}
                            
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
            
            </div>
            
        </div>
        
        <!-- Send welcome message -->
        <div class="additional_step" id="additional_step_welcome_message">
        
            <div class="head">
                <input type="checkbox" name="user[send_welcome_message]" {if $user_data.send_welcome_message}checked="checked"{/if} value="1" class="auto input_checkbox" id="userFormSendWelcomeMessage" />
                {label for=userFormSendWelcomeMessage class=inline}Send welcome email{/label}
            </div>
            
            <div class="body">
            
                <div class="uk-grid">
                
                    <div class="uk-width-1-1">
                    
                        <div class="field-group">
                        
                            <div class="field">
                            
                                <p>{lang}Personalize welcome message{/lang}:</p>
                                {textarea_field name=user[welcome_message] id=userWelcomeMessage class="uk-width-1-1"}{$user_data.welcome_message}{/textarea_field}
                            
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <!-- Set auto-assign settings -->
        {if $logged_user->isPeopleManager()}
        
            <div class="additional_step" id="additional_step_auto_assign">
            
                <div class="head">
                    <input type="checkbox" name="user[auto_assign]" {if $user_data.auto_assign}checked="checked"{/if} value="1" class="auto input_checkbox" id="userFormAutoAssign" />
                    {label for=userFormAutoAssign class=inline}Set this user to be automatically added to new projects{/label}
                </div>
                
                <div class="body">
                
                    <div class="uk-grid">
                    
                        <div class="uk-width-1-1">
                        
                            <div class="field-group">
                            
                                <div class="field">
                                
                                    <p>{lang}Set a role or custom permissions to be used when user is automatically added to the project{/lang}:</p>
                                    {select_user_project_permissions name=user role_id=$user_data.auto_assign_role_id permissions=$user_data.auto_assign_permissions role_id_field=auto_assign_role_id permissions_field=auto_assign_permissions class="uk-width-1-1"}
                                
                                </div>
                                
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        {/if}
        
        {wrap_buttons}
            {submit class="uk-button uk-button-primary"}Submit{/submit}
        {/wrap_buttons}
        
    {/form}
    
</div>