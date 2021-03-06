{title}New Comment{/title}
{add_bread_crumb}New Comment{/add_bread_crumb}

<div id="new_comment">

    <p>{lang url=$active_object->getViewUrl() name=$active_object->getName() type=$active_object->getVerboseType(true)}You are about to post a comment to "<a href=":url">:name</a>" :type{/lang}:</p>
    
    {form action=$active_object->getPostCommentUrl() method=post ask_on_leave=yes enctype="multipart/form-data"}
    
        {include_template name=_comment_form module=resource controller=comments}
        
        {wrap field=attachments}
            {label}Attachments{/label}
            {attach_files max_files=5}
        {/wrap}
        
        {wrap_buttons}
            {submit class="uk-button uk-button-primary"}Submit{/submit}
        {/wrap_buttons}
    
    {/form}
    
    {if is_foreachable($recent_comments)}
        <div id="recent_comments">
            {object_comments object=$active_object comments=$recent_comments show_form=no}
        </div>
    {/if}

</div>