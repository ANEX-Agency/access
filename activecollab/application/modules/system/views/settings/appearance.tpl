{title}Appearance Settings{/title}
{add_bread_crumb}Appearance Settings{/add_bread_crumb}

{form action='?route=admin_settings_appearance' method=post}

    {wrap field=appearance_logo}
        {label for=settings-appearance-logo}Logo{/label}
        {text_field name=appearance[logo] value=$appearance_data.logo id=settings-appearance-logo}
    {/wrap}

    {wrap field=appearance_icon}
        {label for=settings-appearance-icon}Icon{/label}
        {text_field name=appearance[icon] value=$appearance_data.icon id=settings-appearance-icon}
    {/wrap}
    
    {wrap field=appearance_background}
        {label for=settings-appearance-background}Background{/label}
        {text_field name=appearance[background] value=$appearance_data.background id=settings-appearance-background}
    {/wrap}

    {wrap field=appearance_primary_color}
        {label for=settings-appearance-primary-color}Primary Color{/label}
        {text_field name=appearance[primary_color] value=$appearance_data.primary_color id=settings-appearance-primary-color}
    {/wrap}

    {wrap field=appearance_secondary_color}
        {label for=settings-appearance-secondary-color}Secondary Color{/label}
        {text_field name=appearance[secondary_color] value=$appearance_data.secondary_color id=settings-appearance-secondary-color}
    {/wrap}
  
    {wrap field=appearance_typeface}
        {label for=settings-appearance-typeface}Typeface{/label}
        <select name="appearance[typeface]" id="settings-appearance-typeface">
        	<option value="arial">Arial</option>
        	<option value="noto-sans">Noto Sans</option>
        	<option value="open-sans">Open Sans</option>
        </select>
        <!--{text_field name=appearance[typeface] value=$appearance_data.typeface id=settings-appearance-typeface}-->
    {/wrap}
  
    {wrap_buttons}
        {submit}Submit{/submit}
    {/wrap_buttons}
  
{/form}