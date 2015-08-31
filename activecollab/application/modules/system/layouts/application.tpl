<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us"><head>
    
        <title>{page_title default="Projects"} / {$owner_company->getName()|clean}</title>
        
        <!-- Meta -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="mobile-web-app-capable" content="yes">

        <!-- Make it responsive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <link rel="shortcut icon" href="{image_url name='favicon.png'}" type="image/x-icon" />
        
        <link rel="stylesheet" type="text/css" media="screen" id="style-external" href="{$assets_url}/stylesheets/external.css" />
        <link rel="stylesheet" type="text/css" media="screen" id="style-main" href="{$assets_url}/css.php?{$assets_query_string}" />
        <link rel="stylesheet" type="text/css" media="screen" id="style-theme" href="{$assets_url}/themes/{$theme_name}/theme.css" />
        
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