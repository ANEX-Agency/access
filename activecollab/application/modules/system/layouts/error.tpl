<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us">

    <head>
    
        <title>{page_title default="Error"}</title>
        
        <!-- Meta -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="mobile-web-app-capable" content="yes">

        <!-- Make it responsive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <link rel="shortcut icon" href="{image_url name='favicon.png'}" type="image/x-icon" />

        <link rel="stylesheet" type="text/css" media="screen" id="style-main" href="{$assets_url}/css.php?{$assets_query_string}" />
        <link rel="stylesheet" type="text/css" media="screen" id="style-theme" href="{$assets_url}/themes/{$theme_name}/theme.css" />
    
    </head>
    
    <body class="app error">
    
        <div class="wrap">
        	
            <!-- MAIN > START -->
        	<main>
            
            	<div class="container">
                
                    {flash_box}
                    
                    <div id="content">
                    
                        <div class="box box-error">
                        
                            {$content_for_layout}
                            
                        </div>
                        
                    </div>
                
                </div><!-- /.container -->
                
            </main>
            <!-- MAIN > START -->

        </div><!-- /.wrap -->
    
    </body>
    
</html>