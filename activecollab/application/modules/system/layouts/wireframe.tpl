<!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us">
    
    <head>
    
        <title>{page_title default="Projects"} / {$owner_company->getName()|clean}</title>
        <link rel="shortcut icon" href="{brand what=favicon}" type="image/x-icon" />

        {assign_var name=assets_query_string}v={$application->version}&modules={foreach from=$loaded_modules item=loaded_module}{$loaded_module->getName()},{/foreach}{/assign_var}
        
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="{$assets_url}/css.php?{$assets_query_string}" type="text/css" media="screen" id="style_main_css"/>
        <link rel="stylesheet" href="{$assets_url}/themes/{$theme_name}/theme.css" type="text/css" media="screen" id="style_theme_css"/>
        
        <!--[if IE]>
        <link rel="stylesheet" href="{$assets_url}/stylesheets/iefix.css" type="text/css" />
        <link rel="stylesheet" href="{$assets_url}/themes/{$theme_name}/iefix.css" type="text/css" media="screen"/>
        <![endif]-->
        
        <link rel="stylesheet" href="{$assets_url}/print.php?{$assets_query_string}" type="text/css" media="print" />
        <link rel="stylesheet" href="{$assets_url}/themes/{$theme_name}/print.css" type="text/css" media="print" />
        <link rel="alternate stylesheet" href="{$assets_url}/print_preview.php?theme_name={$theme_name}" type="text/css" media="screen" id="print_preview_css" disabled title="Print Preview" />
        
        <script type="text/javascript" src="{$assets_url}/js.php?{$assets_query_string}"></script>
        
        {template_vars_to_js}
        
        {if instance_of($current_language, 'Language')}
            {js_langs locale=$current_language->getLocale()}
        {/if}
        
        <script type="text/javascript">
        if(App.{$request->getModule()} && App.{$request->getModule()}.controllers.{$request->getController()}) {ldelim}
        if(typeof(App.{$request->getModule()}.controllers.{$request->getController()}.{$request->getAction()}) == 'function') {ldelim}
        App.{$request->getModule()}.controllers.{$request->getController()}.{$request->getAction()}();
        {rdelim}
        {rdelim}
        </script>
        
        {page_head_tags}
        
        {if is_foreachable($wireframe->rss_feeds)}
            {foreach from=$wireframe->rss_feeds item=rss_feed}
                <link rel="alternate" type="{$rss_feed.feed_type}" title="{$rss_feed.title|clean}" href="{$rss_feed.url}" />
            {/foreach}
        {/if}
        
    </head>
    
    <body>
    	
        <div class="app">
        
            <!-- Print Preview -->
            <div id="print_preview_header">
                <ul>
                    <li><button type="button" id="print_preview_print">{lang}Print{/lang}</button></li>
                    <li><button type="button" id="print_preview_close">{lang}Close Preview{/lang}</button></li>
                </ul>
                <h2>{lang}Print Preview{/lang}</h2>
            </div>
            
            <!-- HEADER > START -->
            <header>
            
                <div class="container">
                
                    <div id="logo">
                        <a href="{assemble route=homepage}">
                            <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" title="{lang}Back to Start{/lang}" />
                        </a>
                    </div>
                    
                    <div id="user">
                    
                        {if $logged_user->getFirstName()}
                            {assign var=_welcome_name value=$logged_user->getFirstName()}
                        {else}
                            {assign var=_welcome_name value=$logged_user->getDisplayName()}
                        {/if}
                        
                        <span class="inner">
                            {lang name=$_welcome_name}Welcome back :name{/lang} | {if $logged_user->isAdministrator()}<a href="{assemble route=admin}" class="{if $wireframe->current_menu_item == 'admin'}active{/if}">{lang}Admin{/lang}</a> | {/if} <a href="{$logged_user->getViewUrl()}" class="{if $wireframe->current_menu_item == 'profile'}active{/if}">{lang}Profile{/lang}</a> | {link href='?route=logout'}{lang}Logout{/lang}{/link}
                        </span>
                        
                    </div>
                                
                    {menu}
                    
                    {literal}
                        
                        <script type="text/javascript">
                            App.MainMenu.init('menu');
                        </script>
                        
                    {/literal}
                    
                </div>
                
            </header>
            <!-- HEADER > END -->
            
            <!-- MAIN > START -->
            <main>
            
                {if isset($page_tabs)}
                <div id="tabs">
                <div class="container">
                <ul>
                {foreach from=$page_tabs->data key=current_tab_name item=current_tab name=page_tabs}
                <li {if $smarty.foreach.page_tabs.iteration == 1}class="first"{/if} id="page_tab_{$current_tab_name}"><a href="{$current_tab.url}" {if $current_tab_name == $page_tab}class="current"{/if}><span>{$current_tab.text|clean}</span></a></li>
                {/foreach}
                </ul>
                </div>
                </div>
                {/if}
                
                <div id="page_header_container">
                <div class="container">
                <div id="page_header" class="{if $wireframe->details}with_page_details{else}without_page_details{/if}">
                <div class="page_info_container">
                {if instance_of($wireframe->page_company, 'Company') && instance_of($wireframe->page_project, 'Project')}
                <h1 id="page_title"><span>{$wireframe->page_company->getName()|clean} | {$wireframe->page_project->getName()|clean} | </span> {page_title default="Page"}</h1>
                {elseif instance_of($wireframe->page_company, 'Company')}
                <h1 id="page_title"><span>{$wireframe->page_company->getName()|clean} | </span> {page_title default="Page"}</h1>
                {else}
                <h1 id="page_title">{page_title default="Page"}</h1>
                {/if}
                
                {if $wireframe->details}
                <p id="page_details">{$wireframe->details}</p>
                {/if}
                </div>
                {assign var=page_actions value=$wireframe->getSortedPageActions()}
                {if $wireframe->print_button || is_foreachable($page_actions)}
                <ul id="page_actions">
                {if is_foreachable($page_actions)}
                {foreach from=$page_actions key=page_action_name item=page_action name=page_actions}
                {if count($page_actions) == 1}
                <li id="{$page_action_name}_page_action" class="single {if is_foreachable($page_action.subitems)}with_subitems hoverable{else}without_subitems{/if}">
                {else}
                <li id="{$page_action_name}_page_action" class="{if $smarty.foreach.page_actions.first}first{elseif $smarty.foreach.page_actions.last}last {/if} {if is_foreachable($page_action.subitems)}with_subitems hoverable{else}without_subitems{/if}">
                {/if}
                {link id=$page_action.id  href=$page_action.url method=$page_action.method confirm=$page_action.confirm not_lang=yes}<span>{$page_action.text|clean} {if is_foreachable($page_action.subitems)}<img src="{image_url name='dropdown_arrow.gif'}" alt="" />{/if}</span>{/link}
                
                {if is_foreachable($page_action.subitems)}
                <ul>
                {foreach from=$page_action.subitems key=page_action_subaction_name item=page_action_subaction}
                {if $page_action_subaction.text && $page_action_subaction.url}
                <li id="{$page_action_subaction_name}_page_action" class="subaction">{link href=$page_action_subaction.url method=$page_action_subaction.method id=$page_action_subaction.id confirm=$page_action_subaction.confirm}{$page_action_subaction.text|clean}{/link}</li>
                {else}
                <li id="{$page_action_subaction_name}_page_action" class="separator"></li>
                {/if}
                {/foreach}
                </ul>
                {/if}
                </li>
                {counter name=actions_counter_name assign=actions_counter}
                {/foreach}
                {/if}
                {if $wireframe->print_button}
                <li class="single"><a href="javascript:window.print();" id="print_button"><span><img src="{image_url name='icons/print.gif'}" alt="Print" /></span></a></li>
                {/if}
                </ul>
                {/if}
                <div class="clear"></div>
                
                
                </div>
                </div>
                </div>
                
                <div id="page">
                <div class="container">
                <div class="container_inner">
                {if WARN_WHEN_JAVASCRIPT_IS_DISABLED || is_foreachable($wireframe->page_messages)}
                <div id="page_messages">
                {if is_foreachable($wireframe->page_messages)}
                {foreach from=$wireframe->page_messages item=page_message name=page_messages}
                <div class="page_message {$page_message.class|clean} {if $smarty.foreach.page_messages.iteration == 1}first{/if}" style="background-image: url('{$page_message.icon}')">
                <p>{$page_message.body}</p>
                </div>
                {/foreach}
                {/if}
                <div class="page_message {if !is_foreachable($wireframe->page_messages)}first{/if}" id="javascript_required" style="background-image: url('{image_url name=messages/error.gif}')">
                <p>{lang url=$js_disabled_url}It appears that JavaScript is disabled in your web browser. Please enable it to have full system functionality available. <a href=":url">Read more</a>{/lang}.</p>
                </div>
                <script type="text/javascript">
                $('#javascript_required').hide();
                </script>
                </div>
                {/if}
                
                <ul id="breadcrumbs">
                <li class="first"><a href="{assemble route=dashboard}">{lang}Dashboard{/lang}</a>&raquo;</li>
                {foreach from=$wireframe->bread_crumbs item=bread_crumb name=_bread_crumb}
                <li>
                {if $bread_crumb.url}
                <a href="{$bread_crumb.url}" title="{$bread_crumb.text|clean}">{$bread_crumb.text|clean|excerpt:20}</a>&raquo;
                {else}
                <span class="current">{$bread_crumb.text|clean}</span>
                {/if}
                </li>
                {/foreach}
                </ul>
                
                {flash_box}
                <div id="page_content">
                {$content_for_layout}
                <div class="clear"></div>
                </div>
                <div class="content_fix"></div>
                </div>
                </div>
                </div>
            
            </main>
            <!-- MAIN > END -->
            
            <!-- FOOTER > START -->
            <!--<footer>
            
                
                {if $application->copyright_removed()}
                <p id="copyright">&copy;{year} by {$owner_company->getName()|clean}</p>
                {else}
                <p id="powered_by"><a href="http://anex.at/" target="_blank"><img src="{image_url name=acpowered.gif}" /></a></p>
                {/if}
                {benchmark}
                
            </footer>-->
            <!-- FOOTER > END -->
        
        </div>

        
		<div id="side-panel" class="side-panel">
		
			<div class="inner">
			
				<div class="wpsight-support-panel-section wpsight-support-panel-intro">
                
                    <!--<div id="logo">
                        <a href="{assemble route=homepage}">
                            <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" title="{lang}Back to Start{/lang}" />
                        </a>
                    </div>-->
                                        
					<!--<img src="http://wpcasa.com/wp-content/themes/wpc/img/logo.png" />
					<h4>Welcome to the Help Panel of wpCasa.</h4>
					<p>From here you have access to our documentation, some tutorials, snippets and of course our ticket system.</p>-->
				</div>
				
				<div class="wpsight-support-panel-section"> 
					<!--<p class="wpsight-support-panel-section-description">Below you'll find our documentation, tutorials, snippets and faq.</p>-->     
					<nav>
                    
                    <!--
						<ul>
							<li>
								<span>Documentation</span>
								<em class="Counter">6</em>
								<ul>
									<li><a href="/documentation/getting-started">Getting Started</a></li>
									<li><a href="/documentation/installation-setup">Installation & Setup</a></li>
									<li><a href="/documentation/options">Options</a></li>
									<li><a href="/documentation/templates">Templates</a></li>
									<li><a href="/documentation/widgets">Widgets</a></li>
									<li><a href="/documentation/shortcodes">Shortcodes</a></li>
								</ul>
							</li>
							<li>
								<span>Tutorials</span>
								<em class="Counter">34</em>
								<div>
									<p>Find here tutorials about how to accomplish certain tasks within WPCasa.</p>
									<ul>
										<li>
											<span>Install and set up wpCasa Portal</span>
											<div class="wpsight-support-panel-section">
												
												<div class="entry-content">
												<p>Installing a WordPress theme from your local computer on your WordPress backend is easy and a matter of a few minutes.<span id="more-2064"></span></p>
												<p>Please notice that we do not recommend to install the theme by copying the unzipped theme folder to your server manually using an FTP client. We have experienced that this might lead to file/folder permissions issues.</p>
												<p>Our wpSight themes are framework and child themes. But no matter if framework or child theme they will always have to be installed as regular WordPress themes.</p>
												<h2 id="wordpress-dashboard">WordPress Dashboard</h2>
												<p>Please log into your WordPress dashboard and click on <em>WP-Admin → Appearance → Themes</em>:</p>
												<p><img alt="" src="http://support.wpsight.com/wp-content/uploads/2013/01/install-1.png" title="WordPress Dashboard" class="alignnone"></p>
												<h2 id="install-themes-tab">Install Themes Tab</h2>
												<p>Next click on the tab <em>Install Themes</em>:</p>
												<p><img alt="" src="http://support.wpsight.com/wp-content/uploads/2013/01/install-2.png" title="Install Themes Tab" class="alignnone"></p>
												<h2 id="select-zip-folder">Select ZIP Folder</h2>
												<p>The click on the link <em>Upload</em> and select the theme zip folder on your local computer. Finally click the button <em>Install Now</em>:</p>
												<p><img alt="" src="http://support.wpsight.com/wp-content/uploads/2013/01/install-3.png" title="Select ZIP Folder" class="alignnone"></p>
												<h2 id="activate-theme">Activate Theme</h2>
												<p>After the theme has been installed, you can activate it:</p>
												<p><img alt="" src="http://support.wpsight.com/wp-content/uploads/2013/01/install-4.png" title="Activate Theme" class="alignnone"></p>
												<h2 id="manage-themes">Manage Themes</h2>
												<p>You will be automatically redirected to the <em>Manage Themes</em> screen where the new theme is listed as <em>Current Theme</em>:</p>
												<p><img alt="" src="http://support.wpsight.com/wp-content/uploads/2013/01/install-5.png" title="Manage Themes" class="alignnone"></p>
												<h2 id="congratulations">Congratulations</h2>
												<p>That’s it! You have successfully installed the theme.</p>
												</div>                                            
												
											</div>
										</li>
										<li><a href="/tutorials/how-to-change-button-styles">How to change Button Styles</a></li>
										<li><a href="/tutorials/import-decorum-properties">Import deCorum Properties</a></li>
									</ul>
									<a href="#">More</a>
								</div>
							</li>
							<li>
								<span>Snippets</span>
								<em class="Counter">168</em>
							</li>
							<li>
								<span>FAQ</span>
								<em class="Counter">32</em>
							</li>
							
						</ul>-->
					</nav>
				</div>
				
				<!--
                <div class="wpsight-support-panel-section">
				
					<nav>
						<ul>
							<li>
							
								<span>Submit a ticket.</span>
								
								<div class="wpsight-support-request-form">
                                
                                	<p>Please provide as much information as possible.</p>
								
									<form>
										<input type="text" placeholder="Sample" />
										<textarea placeholder="Sample Text"></textarea>
                                        <label><input type="checkbox" class="" />Sample Label</label>
                                        <label><input type="checkbox" class="" />Access to Site</label>
                                        <label><input type="checkbox" class="" />Access to Site Info</label>
                                        <label><input type="checkbox" class="" />Access to Site Info</label>
                                        <p>By hitting submit you will submit a ticket which passes the following information automatically to the receipient: Username, E-Mail, IP Address, Site Information, Server Information and the URL to the website.</p>
										<input type="submit" value="Submit" />
									</form>
				
									<h3 class="Title">Submit your ticket</h3>
									
								</div>
										
							</li>
							
						</ul>
					</nav>
				
				</div>
                -->
				
                <!--
				<div class="wpsight-support-panel-section">
				
					<nav>
						<ul>
							<li>
								<span>Site Info</span>
								<div class="wpsight-support-site-info">

									<h3 class="Title">Site Info</h3>
									
								</div>
							</li>
							<li>
							
								<a href="<?php echo plugins_url('wpsight-support/includes/phpinfo.php'); ?>" target="_blank">PHPInfo</a>
																		
							</li>
							
						</ul>
					</nav>
				
				</div>
                -->
			
			</div>
			
		</div>

        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.3.4/js/jquery.mmenu.min.all.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.3.4/js/addons/jquery.mmenu.fixedelements.min.js"></script>

    </body>
    
</html>