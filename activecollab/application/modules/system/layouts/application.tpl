<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us"><head>
    
        <title>{page_title default="Projects"} / {$owner_company->getName()|clean}</title>
        
        <!-- Meta -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="mobile-web-app-capable" content="yes">

        <!-- Make it responsive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <link rel="shortcut icon" href="{image_url name='favicon.png'}" type="image/x-icon" />
        
        {if $mobile_device_css}
        
            <link rel="stylesheet" href="{$mobile_device_css}" type="text/css" />
            
        {else}
        
            <link rel="stylesheet" href="{$assets_url}/css.php" type="text/css" />
            <link rel="stylesheet" href="{$assets_url}/themes/{$theme_name}/theme.css" type="text/css" />
            
            <!--[if IE]>
            <link rel="stylesheet" href="{$assets_url}/stylesheets/iefix.css" type="text/css" />
            <![endif]-->
        
        {/if}
        
        <script type="text/javascript" src="{$assets_url}/js.php"></script>
        
        {page_head_tags}
        {template_vars_to_js}
        
    </head>
    
    <body class="app">
    
        <div class="wrap">
        	
            <!-- MAIN > START -->
        	<main>
            
            	<div class="container">
                
                    {flash_box}
                    
                    <div id="content">
                        {$content_for_layout}
                    </div>
                
                </div><!-- /.container -->
                
            </main>
            <!-- MAIN > START -->

        </div><!-- /.wrap -->
    
    </body>
    
</html>