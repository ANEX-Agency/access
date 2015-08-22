{title}Forgot Password{/title}

<div id="forgot-password-form" class="box box-form">

    <div class="logo">
    
        <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" />
        
    </div>

    <div class="form">
    
        {form method=post autofocus=$auto_focus show_errors=no action="?route=forgot_password"}
            
            {if $success_message}
                <p>{$success_message|clean}</p>
            {/if}
            
			{if !$success_message}
                <div class="field-wrap">
                    <input type="text" name="forgot_password[email]" value="{$forgot_password_data.email}" id="" class="" tabindex="1" placeholder="E-Mail" />
                </div>
            {/if}
                        
            {if !$success_message}
                <div class="field-wrap">
                    <input type="submit" tabindex="2" accesskey="s" class="btn" value="Submit" />
                </div>
            {/if}
            
            <div class="field-wrap">
                {link href='?route=login'}Back to Login Form{/link}
            </div>
            
        {/form}
        
    </div>

</div>