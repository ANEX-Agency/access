<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us">

    <head>
    
        <title>{page_title default="Projects"} / {$owner_company->getName()|clean}</title>
        
        <link rel="shortcut icon" href="{image_url name='favicon.png'}" type="image/x-icon" />

        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        
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
    
    <body>
    
        <div id="wrapper">
        
            {flash_box}
            
            <div id="content">{$content_for_layout}</div>
        
        </div>
    
    </body>
    
</html>