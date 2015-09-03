<div class="project-progress">

    {if $_project_progress->getTotalTasksCount()}
        
        <div class="uk-progress uk-progress-small" {if !$_project_progress_info}title="{lang completed=$_project_progress->getCompletedTaskCount() total=$_project_progress->getTotalTasksCount() percent=$_project_progress->getPercentsDone()}:completed of :total tasks completed (:percent%){/lang}"{/if}>
            <div class="uk-progress-bar" style="width: {$_project_progress->getPercentsDone()}%"></div>
        </div>
        
        {if $_project_progress_info}
            <p>{lang completed=$_project_progress->getCompletedTaskCount() total=$_project_progress->getTotalTasksCount() percent=$_project_progress->getPercentsDone()}<strong>:completed</strong> of <strong>:total</strong> tasks completed (<strong>:percent%</strong>){/lang}</p>
        {/if}
        
    {else}
    
        <div class="uk-progress uk-progress-small">
            <div class="uk-progress-bar" style="width: 0%"></div>
        </div>
        
        {if $_project_progress_info}
            <p>{lang}There are no tasks in this project{/lang}</p>
        {/if}
        
    {/if}
    
</div>


