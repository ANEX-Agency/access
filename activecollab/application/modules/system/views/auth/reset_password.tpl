{title}Reset Password{/title}

<div id="reset-password-form" class="box box-form">

    <div class="logo">
    
        <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" />
        
    </div>

    <div class="form">
    
        {form method=post autofocus=$auto_focus show_errors=no}
        	
            <div class="description">
                <p>{lang name=$user->getDisplayName()}Use the form below to reset password for: <br /> :name{/lang}</p>
            </div>
            
            <div class="field-wrap">
                <input type="password" name="reset[password]" value="{$reset_data.password}" id="" class="" tabindex="1" placeholder="Password" />
            </div>
                        
            <div class="field-wrap">
                <input type="password" name="reset[password_a]" value="{$reset_data.password_a}" id="" class="" tabindex="2" placeholder="Password Repeat" />
            </div>
                        
            {if !$success_message}
                <div class="field-wrap">
                    <input type="submit" tabindex="3" accesskey="s" class="btn" value="Reset" />
                </div>
            {/if}
            
            {if $success_message}
            	<div class="message">
                    <p>{$success_message|clean}</p>
                </div>
            {/if}
            
            <div class="field-wrap">
                {link href='?route=login'}Back to Login Form{/link}
            </div>
            
        {/form}
        
    </div>

</div>