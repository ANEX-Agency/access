{if $show_welcome_message}

    {title}Welcome to activeCollab{/title}
    {add_bread_crumb}Welcome{/add_bread_crumb}
    
    <div id="dashboard">{empty_slate module=system name=dashboard}</div>
  
{else}

    {title}Dashboard{/title}
    {add_bread_crumb}View{/add_bread_crumb}

    <div id="dashboard">
    
    	<div class="uk-grid">
        
        	<div class="uk-width-1-1 uk-width-medium-3-4">
            
                <!-- Dashboard sections -->
                <div id="dashboard_sections">
              
                    <ul class="top_tabs dashboard_tabs">
                        {foreach from=$dashboard_sections->data key=dashboard_section_name item=dashboard_section name=dashboard_sections}
                            <li id="dashboard_section_{$dashboard_section_name}"><a href="{$dashboard_section.url}"><span>{$dashboard_section.text}</span></a></li>
                        {/foreach}
                    </ul>
                
                    <div class="top_tabs_object_list dashboard_wide_sidebar alt">
                        <div class="dashboard_wide_sidebar_inner">
                            <div class="dashboard_wide_sidebar_inner_2">
                                <div class="dashboard_section_content" id="dashboard_section_recent_activities_content">
                                    {include_template name=recent_activities controller=dashboard module=system}
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                
                <script type="text/javascript">
					App.widgets.DashboardSections.init('dashboard_sections');
                </script>
                
                <!-- / dashboard sections -->
            
            </div>
        
        	<div class="uk-width-1-1 uk-width-medium-1-4">
            
                <aside id="dashboard_sidebars" class="aside">
                
                    <!--
                    {if $important_items->count()}
                    
                        <div class="dashboard_sidebar" id="dashboard_important">
                            <div class="dashboard_sidebar_inner">
                                <div class="dashboard_sidebar_inner_2">
                                    <h2>{lang}Important{/lang}</h2>
                                    <ul class="dashboard_important_list">
                    
                                        {foreach from=$important_items->data item=important_item}
                                            <li class="{$important_item.class}">
                                                <a href="{$important_item.url}">
                                                    {if $important_item.icon}
                                                        <img src="{$important_item.icon}" alt="" />
                                                    {/if}
                                                    <span>{$important_item.label}</span>
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <script type="text/javascript">
                        App.widgets.DashboardImportantItems.init('dashboard_important');
                        </script>
                        
                    {/if}
                    
                    <div class="dashboard_sidebar" id="pinned_projects">
                        <div class="dashboard_sidebar_inner">
                            <div class="dashboard_sidebar_inner_2">
                                <h2>{lang}Favorite Projects{/lang}</h2>
                                <ul class="dashboard_sidebar_list">
                                    {if is_foreachable($pinned_projects)}
                                        {foreach from=$pinned_projects item=project}
                                            <li class="with_icon pinned_project" id="project_{$project->getId()}">
                                                <a href="{$project->getUnpinUrl()}" class="unpin">{image name=dismiss.gif}</a>
                                                <img src="{$project->getIconUrl()}" alt="{$project->getName()|clean}" />
                                                <span class="name">{project_link project=$project}</span>
                                            </li>
                                        {/foreach}
                                    {/if}
                                    <li class="drop_here">{lang}Drop project here{/lang}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <script type="text/javascript">
                    App.widgets.DashboardFavoriteProjects.init('pinned_projects');
                    </script>
                    
                    <div class="dashboard_sidebar alt" id="who_is_online">
                        <div class="dashboard_sidebar_inner">
                            <div class="dashboard_sidebar_inner_2">
                            
                                <div class="title">
                                    <h2>{lang}Who is Online?{/lang}</h2>
                                </div>
                    
                                <div id="who_is_online_container">
                                    {if is_foreachable($online_users)}
                                        <p>{lang}People who were online in the last 15 minutes{/lang}:</p>
                                        <ul class="online_users_list dashboard_sidebar_list">
                                            {foreach from=$online_users item=user}
                                                <li class="with_icon">
                                                    <img src="{$user->getAvatarUrl()}" alt="" />
                                                    <span class="name" title="{$user->getLastActivityOn()|datetime|clean}">{user_link user=$user}</span>
                                                </li>
                                            {/foreach}
                                        </ul>
                                        <p>{lang}Loaded at{/lang} {$request_time|time}</p>
                                    {else}
                                        <p class="empty_page">{lang}Nobody was online in the last 15 minutes{/lang}</p>
                                    {/if}
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <!-- WIDGET: IMPORTANT > START -->
                    {if $important_items->count()}
                    
                        <div id="widget-important" class="widget widget-important">
                        
                        	<div class="widget-header">
                                <h2>{lang}Important{/lang}</h2>
                            </div>
                        
                        	<div class="widget-body">
                                <ul>
                                    {foreach from=$important_items->data item=important_item}
                                        <li class="{$important_item.class}">
                                            <a href="{$important_item.url}" title="">
                                                <i class="uk-icon-warning"></i> {$important_item.label}
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                            
                        </div>
                        
                        <script type="text/javascript">
							App.widgets.DashboardImportantItems.init('widget-important');
                        </script>
                        
                    {/if}
                    <!-- WIDGET: IMPORTANT > END -->

                    
                    
                    <!-- WIDGET: PINNED PROJECTS > START -->
                    <div id="widget-pinned-projects" class="widget widget-pinned-projects">
                    
                        <div class="widget-header">
                            <h2>{lang}Favorite Projects{/lang}</h2>
                        </div>
                    
                        <div class="widget-body">
                            <ul class="dashboard_sidebar_list">
                                {if is_foreachable($pinned_projects)}
                                    {foreach from=$pinned_projects item=project}
                                        <li class="with_icon pinned_project" id="project_{$project->getId()}">
                                            <a href="{$project->getUnpinUrl()}" class="unpin"><span class="lnr lnr-cross"></span></a>
                                            <img src="{$project->getIconUrl()}" alt="{$project->getName()|clean}" />
                                            {project_link project=$project}
                                        </li>
                                    {/foreach}
                                {/if}
                                <li class="drop">{lang}Drop project here{/lang}</li>
                            </ul>
                        </div>
                                
                    </div>
                    
                    <script type="text/javascript">
						App.widgets.DashboardFavoriteProjects.init('widget-pinned-projects');
                    </script>
                    <!-- WIDGET: PINNED PROJECTS > END -->



                    <!-- WIDGET: WHO IS ONLINE > START -->
                    <div id="widget-who-is-online" class="widget widget-who-is-online" >
                            
                        <div class="widget-header">
                            <h2>{lang}Who is Online?{/lang}</h2>
                        </div>
                    
                        <div class="widget-body">
                        
                            {if is_foreachable($online_users)}
                            
                                <p>{lang}People who were online in the last 15 minutes{/lang}:</p>
                                
                                <ul>
                                	{foreach from=$online_users item=user}
                                    <li>
                                    	
                                        <img src="{$user->getAvatarUrl(true)}" alt="" />
                                        <h5>{user_link user=$user}</h4>
                                        <!--<div class="meta">{$user->getLastActivityOn()|datetime|clean}</div>-->
                                        
                                    </li>
                                   	{/foreach} 
                                </ul>                                

                                <!--<ul>
                                    {foreach from=$online_users item=user}
                                        <li>
                                            <img src="{$user->getAvatarUrl(true)}" alt="" />
                                            <span class="name" title="{$user->getLastActivityOn()|datetime|clean}">{user_link user=$user}</span>
                                            <span class="name" title="{$user->getLastActivityOn()|datetime|clean}">Company, Position</span>
                                        </li>
                                    {/foreach}
                                </ul>-->
                                <p>{lang}Loaded at{/lang} {$request_time|time}</p>
                                
                            {else}
                            
                                <p class="empty_page">{lang}Nobody was online in the last 15 minutes{/lang}</p>
                                
                            {/if}
                            
                        </div>
                                
                    </div>
                    <!-- WIDGET: WHO IS ONLINE > END -->
                    
                    
                
                </aside>
            
            </div>
        
        </div>
    
    </div>

{/if}