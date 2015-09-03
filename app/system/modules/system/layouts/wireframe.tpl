<!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us">
    
    <head>
    
        <title>{page_title default="Projects"} / {$owner_company->getName()|clean}</title>

        <!-- Meta -->
        <meta name="mobile-web-app-capable" content="yes">

        <!-- Make it responsive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        {assign_var name=assets_query_string}v={$application->version}&modules={foreach from=$loaded_modules item=loaded_module}{$loaded_module->getName()},{/foreach}{/assign_var}
        
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        
        <link rel="shortcut icon" href="{brand what=favicon}" type="image/x-icon" />

        {php}
        do_action('print_head');
        {/php}
        
        <link rel="stylesheet" type="text/css" media="screen" id="style-external" href="{$assets_url}/stylesheets/external.css" />
        <link rel="stylesheet" type="text/css" media="screen" id="style-main" href="{$assets_url}/css.php?{$assets_query_string}" />
        <link rel="stylesheet" type="text/css" media="screen" id="style-theme" href="{$assets_url}/themes/{$theme_name}/theme.css" />
        
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
    
    <body class="app">
    	
        <div class="wrap remodal-bg">
        
            <!--
            <div class="remodal" data-remodal-id="modal">
                <button data-remodal-action="close" class="remodal-close"></button>
                <h1>Remodal</h1>
                <p>
                Responsive, lightweight, fast, synchronized with CSS animations, fully customizable modal window plugin with declarative configuration and hash tracking.
                </p>
                <br>
                <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
                <button data-remodal-action="confirm" class="remodal-confirm">OK</button>
            </div>
            -->

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
            
                <div id="logo" class="logo">
                    <a href="{assemble route=homepage}">
                        <img src="{brand what=logo}" alt="{$owner_company->getName()|clean} logo" title="{lang}Back to Start{/lang}" />
                    </a>
                </div>
                    
                <div id="user" class="widget widget-user">
                
                    <!--{if $logged_user->getFirstName()}
                        {assign var=_welcome_name value=$logged_user->getFirstName()}
                    {else}
                        {assign var=_welcome_name value=$logged_user->getDisplayName()}
                    {/if}-->
                    
                    <a href="#" class="avatar">
                        <img src="{$logged_user->getAvatarUrl(true)}" alt="" class="" />
                    </a>
                    
                    <div class="panel invisible">
                        <ul>
                            {if $logged_user->isAdministrator()}
                                <li>
                                    <a href="{assemble route=admin}" class="{if $wireframe->current_menu_item == 'admin'}active{/if}">
                                        {lang}Admin{/lang}
                                    </a>
                                </li>
                            {/if}
                            <li><a href="{$logged_user->getViewUrl()}" class="{if $wireframe->current_menu_item == 'profile'}active{/if}">{lang}Profile{/lang}</a></li>
                            <li>{link href='?route=logout'}{lang}Logout{/lang}{/link}</li>
                            <!--<li><a href="#modal">Call the modal with data-remodal-id="modal"</a></li>-->
                        </ul>
                    </div>
                    
                </div>
                
                {menu}
                
                {literal}
                    
                    <script type="text/javascript">
                        App.MainMenu.init('menu');
                    </script>
                    
                {/literal}
                
            </header>
            <!-- HEADER > END -->
            
            <!-- MAIN > START -->
            <main>
            
                <div class="container">
            
                    {if isset($page_tabs)}
                    
                        <div class="tabs">
                        
                            <ul>
                                {foreach from=$page_tabs->data key=current_tab_name item=current_tab name=page_tabs}
                                    <li {if $smarty.foreach.page_tabs.iteration == 1}{/if} id="page_tab_{$current_tab_name}">
                                    	<a href="{$current_tab.url}" {if $current_tab_name == $page_tab}class="current"{/if}>{$current_tab.text|clean}</a>
                                    </li>
                                {/foreach}
                            </ul>
                            
                        </div>
                        
                    {/if}
                    
                    <div class="page-header {if $wireframe->details}with_page_details{else}without_page_details{/if}">
                    
                        <div class="uk-grid">
                                            
                            <div class="page-header-left uk-width-1-1 uk-width-medium-2-3">
                        
                                <div class="page-title">
                                    {if instance_of($wireframe->page_company, 'Company') && instance_of($wireframe->page_project, 'Project')}
                                        <h1>{page_title default="Page"}</h1>
                                    {elseif instance_of($wireframe->page_company, 'Company')}
                                        <h1>{page_title default="Page"}</h1>
                                    {else}
                                        <h1>{page_title default="Page"}</h1>
                                    {/if}
                                </div>
                                
                                <div class="page-details">
                                    {if $wireframe->details}
                                        <p>{$wireframe->details}</p>
                                    {/if}
                                </div>
                                
                                <div class="breadcrumbs">
                                
                                    <ul>
                                        <li class="first"><a href="{assemble route=dashboard}">{lang}Dashboard{/lang}</a>&nbsp;&nbsp;/&nbsp;&nbsp;</li>
                                        {foreach from=$wireframe->bread_crumbs item=bread_crumb name=_bread_crumb}
                                            {if $bread_crumb.url}
                                                <li><a href="{$bread_crumb.url}" title="{$bread_crumb.text|clean}">{$bread_crumb.text|clean|excerpt:20}</a>&nbsp;&nbsp;/&nbsp;&nbsp;</li> 
                                            {else}
                                                <li><span class="current">{$bread_crumb.text|clean}</span></li>
                                            {/if}
                                        {/foreach}
                                    </ul>
                                    
                                </div>
                            
                            </div>
                            
                            <div class="page-header-right uk-width-1-1 uk-width-medium-1-3">
                            
                                <div class="actions">
                                
                                    {assign var=page_actions value=$wireframe->getSortedPageActions()}
                        
                                    {if $wireframe->print_button || is_foreachable($page_actions)}
                                        <ul>
                                            {if is_foreachable($page_actions)}
                                                {foreach from=$page_actions key=page_action_name item=page_action name=page_actions}
                                                    {if count($page_actions) == 1}
                                                        <li id="{$page_action_name}_page_action" class="single {if is_foreachable($page_action.subitems)}with_subitems hoverable{else}without_subitems{/if}">
                                                    {else}
                                                        <li id="{$page_action_name}_page_action" class="{if $smarty.foreach.page_actions.first}first{elseif $smarty.foreach.page_actions.last}last {/if} {if is_foreachable($page_action.subitems)}with_subitems hoverable{else}without_subitems{/if}">
                                                    {/if}
                                                    
                                                    {link id=$page_action.id class="btn" href=$page_action.url method=$page_action.method confirm=$page_action.confirm not_lang=yes}
                                                        <span>
                                                            {$page_action.text|clean}
                                                            {if is_foreachable($page_action.subitems)}
                                                                <img src="{image_url name='dropdown_arrow.gif'}" alt="" />
                                                            {/if}
                                                        </span>
                                                    {/link}
                        
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
                                                <li class="single">
                                                    <a href="javascript:window.print();" id="print_button" class="btn">
                                                        <span class="lnr lnr-printer"></span>
                                                    </a>
                                                </li>
                                            {/if}
                                        </ul>
                                    {/if}
                                    
                                </div><!-- /.actions -->
                                
                            </div>
                        
                        </div>
                    
                    </div>
                    
                    <div class="clear"></div>
                    
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
                    
                                {flash_box}
                                
                                <div id="page_content">
                                
                                    {$content_for_layout}
                                    
                                    <div class="clear"></div>
                                    
                                </div>
                                
                            </div><!-- /.container_inner -->
                            
                        </div><!-- /.container -->
                        
                    </div><!-- /#page -->
                
                </div><!-- /.container -->
                
            </main>
            <!-- MAIN > END -->
            
            <!-- FOOTER > START -->
            <footer>
                    
                {benchmark}
                
            </footer>
            <!-- FOOTER > END -->
        
        </div>

        <!-- SIDE PANEL > START -->
		<div id="side-panel" class="side-panel">
		
			<div class="inner">
            
				<div class="side-panel-section"> 
                
                    <div id="user" class="widget widget-user">
                    
                    	<div class="uk-grid" data-uk-grid-margin>
                        
                        	<div class="uk-width-1-1">
                            
                                <div class="uk-grid" data-uk-grid-match>
                                
                                    <div class="uk-width-1-2">
                                    
                                        <div class="avatar uk-vertical-align-middle">
                                    
                                            <img src="{$logged_user->getAvatarUrl(true)}" alt="" class="" />
                                        
                                        </div>
                                        
                                    </div>
                                
                                    <div class="uk-width-1-2">
                                    
                                        {if $logged_user->getFirstName()}
                                            {assign var=_welcome_name value=$logged_user->getFirstName()}
                                        {else}
                                            {assign var=_welcome_name value=$logged_user->getDisplayName()}
                                        {/if}
                                        
                                        <div class="message uk-vertical-align-middle">{lang name=$_welcome_name}Welcome back :name{/lang}</div>
                                    
                                    </div>
                                    
                                </div>                        
                                                            
                            </div>
                        
                        	<div class="uk-width-1-1">
                            
                                <div class="buttons">
                                    <a href="{$logged_user->getViewUrl()}" class="user-link-profile {if $wireframe->current_menu_item == 'profile'}active{/if}"><span class="lnr lnr-user"></span></a>
                                    {if $logged_user->isAdministrator()}
                                        <a href="{assemble route=admin}" class="user-link-settings {if $wireframe->current_menu_item == 'admin'}active{/if}">
                                            <span class="lnr lnr-cog"></span>
                                        </a>
                                    {/if}
                                    {link href='?route=logout' class="user-link-logout"}<span class="lnr lnr-exit"></span>{/link}
                                </div>
                            
                            </div>
                        
                        </div>
                    
                    </div>
                    
                </div>
							
				<div class="side-panel-section"> 
					<nav></nav>
				</div>
			
			</div>
			
		</div>
        <!-- SIDE PANEL > START -->

        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.4/hammer.min.js"></script>
        
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.3.4/js/jquery.mmenu.min.all.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.3.4/js/addons/jquery.mmenu.dragopen.min.js"></script>        
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.3.4/js/addons/jquery.mmenu.fixedelements.min.js"></script>
        
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/uikit.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/components/grid.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/components/datepicker.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/components/accordion.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/components/tooltip.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/core/tab.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.22.0/js/core/switcher.min.js"></script>

        <!--<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/remodal/1.0.2/remodal.min.js"></script>-->

    </body>
    
</html>
