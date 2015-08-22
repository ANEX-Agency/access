{title}Login{/title}

<div id="login-form" class="box box-form">

    <div class="logo">
    
        <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" />
        
    </div>

    <div class="form">
    
        {form method=post autofocus=$auto_focus show_errors=no}
        	
            <div class="field-wrap">
                <input type="text" name="login[email]" value="{$login_data.email}" id="" class="" tabindex="1" placeholder="E-Mail" />
            </div>
            
            <div class="field-wrap">
                <input type="password" name="login[password]" value="{$login_data.password}" id="" class="" tabindex="2" placeholder="Password" />
            </div>
            
            <div class="field-wrap">
                <input type="checkbox" name="login[remember]" checked="$login_data.remember" id="remember" tabindex="3" /> 
                <label for="remember">{lang}Remember me for 14 days{/lang}</label>
            </div>
            
            <div class="field-wrap">
                <input type="submit" tabindex="4" accesskey="s" class="btn" value="Login" />
            </div>
            
            <div class="field-wrap">
            	{link href="?route=forgot_password" class=forgot_password_link}Forgot password?{/link}
            </div>
            
        {/form}
        
    </div>

</div>

