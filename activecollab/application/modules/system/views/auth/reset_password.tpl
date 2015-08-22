{title}Reset Password{/title}

<div id="reset-password-form" class="box box-form">

    <div class="logo">
    
        <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" />
        
    </div>

    <div class="form">
    
        {form method=post autofocus=$auto_focus show_errors=no}
        
            <p>{lang name=$user->getDisplayName()}Use the form below to reset password for :name's account{/lang}:</p>
            
            <div class="field-wrap">
                <input type="text" name="reset[password]" value="{$reset_data.password}" id="" class="" tabindex="1" placeholder="Password" />
            </div>
                        
            <div class="field-wrap">
                <input type="text" name="reset[password_a]" value="{$reset_data.password_a}" id="" class="" tabindex="2" placeholder="Password Repeat" />
            </div>
                        
            {if !$success_message}
                <div class="field-wrap">
                    <input type="submit" tabindex="3" accesskey="s" class="btn" value="Reset" />
                </div>
            {/if}
            
            <div class="field-wrap">
                {link href='?route=login' class=forgot_password_link}Back to Login Form{/link}
            </div>
            
            {if $success_message}
                <p>{$success_message|clean}</p>
            {/if}
            
        {/form}
        
    </div>

</div>