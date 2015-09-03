{title}Edit Profile{/title}
{add_bread_crumb}Edit Profile{/add_bread_crumb}

<div id="edit_user_profile">

	{form action=$active_user->getEditProfileUrl() method=post autofocus=no class="uk-form"}
    
        <div class="uk-accordion" data-uk-accordion>
        
            <h3 class="uk-accordion-title">{lang}Basic Details{/lang}</h3>
            
            <div class="uk-accordion-content">
            
                <div class="uk-grid">
                                
                    <div class="uk-width-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userFirstName class="uk-form-label"}First Name{/label}
                                {text_field name=user[first_name] value=$user_data.first_name id=userFirstName class="uk-width-1-1"}
                            </div>

                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userLastName class="uk-form-label"}Last Name{/label}
                                {text_field name=user[last_name] value=$user_data.last_name id=userLastName class="uk-width-1-1"}
                            </div>

                        </div>
                    
                    </div>
                    
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userTitle class="uk-form-label"}Title{/label}
                                {text_field name='user[title]' value=$user_data.title id=userTitle class="uk-width-1-1"}
                            </div>

                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userEmail required=yes class="uk-form-label"}Email{/label}
                                {text_field name=user[email] value=$user_data.email id=userEmail class='required validate_email' class="uk-width-1-1"}
                            </div>

                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=birthday required=yes class="uk-form-label"}Birthday{/label}
                                {text_field name=user[birthday] value=$user_data.birthday id=birthday class='required validate_email' class="uk-width-1-1"}
                            </div>

                        </div>
                    
                    </div>
                
                </div>
            
            </div>
                        
            <h3 class="uk-accordion-title">{lang}Contact Details{/lang}</h3>
            
            <div class="uk-accordion-content">
            
                <div class="uk-grid">
                
                    <div class="uk-width-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userPhoneWork class="uk-form-label"}Office Phone Number{/label}
                                {text_field name='user[phone_work]' value=$user_data.phone_work id=userPhoneWork class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-2">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=userPhoneMobile class="uk-form-label"}Mobile Phone Number{/label}
                                {text_field name='user[phone_mobile]' value=$user_data.phone_mobile id=userPhoneMobile class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=skype class="uk-form-label"}Skype{/label}
                                {text_field name='user[skype]' value=$user_data.skype id=skype class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=facebook class="uk-form-label"}Facebook{/label}
                                {text_field name='user[facebook]' value=$user_data.facebook id=facebook class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                    <div class="uk-width-1-3">
                    
                        <div class="field-group">
                        
                            <div class="field">
                                {label for=twitter class="uk-form-label"}Twitter{/label}
                                {text_field name='user[twitter]' value=$user_data.twitter id=twitter class="uk-width-1-1"}
                            </div>
                                
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
        </div>
        
        {wrap_buttons}
            {submit class="uk-button uk-button-primary"}Submit{/submit}
        {/wrap_buttons}
  
    {/form}
    
</div>