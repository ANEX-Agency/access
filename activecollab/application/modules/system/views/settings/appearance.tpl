{title}Appearance Settings{/title}
{add_bread_crumb}Appearance Settings{/add_bread_crumb}

{form action='?route=admin_settings_appearance' method=post class="uk-form"}

	<div class="uk-grid" data-uk-grid-margin>
    
        <div class="uk-width-1-1 uk-width-medium-1-2">
        
        	<div class="field-group">
            
                <div class="field">
                
                    {label for=settings-appearance-logo class="uk-form-label"}Logo{/label}
                    {text_field name=appearance[logo] value=$appearance_data.logo id=settings-appearance-logo class="uk-width-1-1"}
                
                </div>
            
                <div class="field">
                
                    {label for=settings-appearance-icon class="uk-form-label"}Icon{/label}
                    {text_field name=appearance[icon] value=$appearance_data.icon id=settings-appearance-icon class="uk-width-1-1"}
                
                </div>
            
                <div class="field">
                
                    {label for=settings-appearance-background class="uk-form-label"}Background{/label}
                    {text_field name=appearance[background] value=$appearance_data.background id=settings-appearance-background class="uk-width-1-1"}
                
                </div>
            
            </div>
        
        </div>
        
        <div class="uk-width-1-1 uk-width-medium-1-2">
        
        	<div class="field-group">
            
                <div class="field">
                
                    {label for=settings-appearance-primary-color class="uk-form-label"}Primary Color{/label}
                    {text_field name=appearance[primary_color] value=$appearance_data.primary_color id=settings-appearance-primary-color class="uk-width-1-1"}
                
                </div>
            
                <div class="field">
                
                    {label for=settings-appearance-secondary-color class="uk-form-label"}Secondary Color{/label}
                    {text_field name=appearance[secondary_color] value=$appearance_data.secondary_color id=settings-appearance-secondary-color class="uk-width-1-1"}
                
                </div>
            
                <div class="field">
                
                    {label for=settings-appearance-typeface class="uk-form-label"}Typeface{/label}
                    <!--
                    <select name="appearance[typeface]" id="settings-appearance-typeface">
                        <option value="arial">Arial</option>
                        <option value="noto-sans">Noto Sans</option>
                        <option value="open-sans">Open Sans</option>
                    </select>
                    -->
                    {text_field name=appearance[typeface] value=$appearance_data.typeface id=settings-appearance-typeface class="uk-width-1-1"}
                
                </div>
            
            </div>
        
        </div>
        
        <div class="uk-width-1-1 uk-width-medium-1-2">
        
        	<div class="field-group">
            
                <div class="field">
                
                    {wrap_buttons}
                        {submit class="uk-button uk-button-primary"}Submit{/submit}
                    {/wrap_buttons}
                
                </div>
                
            </div>
            
        </div>
        
    </div>
  
{/form}