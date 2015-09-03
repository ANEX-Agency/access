<div id="object_comments_{$_object_comments_object->getId()}" class="comments">

    <div class="header">
    
        <h2>{lang}Comments{/lang}</h2>
    
    </div>

    <div class="body">
    
    	<div class="comments-list">
        
            {if is_foreachable($_object_comments_comments)}
            
                {if !isset($counter)}
                    {assign var=counter value=0}
                {/if}
            
                {assign_var name=black_hole}{counter name=comment_num start=$counter}{/assign_var}
            
                {foreach from=$_object_comments_comments item=_object_comments_comment name=_object_comments_comments}
                    
                    {assign var=_object_comment_author value=$_object_comments_comment->getCreatedBy()}
                    
                    <div class="subobject comment {if $smarty.foreach._object_comments_comments.iteration == 1}first_subobject{/if} {cycle values='odd,even' name=object_comments}" id="comment{$_object_comments_comment->getId()}">
            
            			<div class="subobject_author">
                        
                            <a class="avatar" href="{if instance_of($_object_comment_author, 'User')}{$_object_comment_author->getViewUrl()}{elseif instance_of($_object_comment_author, 'AnonymousUser') && trim($_object_comment_author->getName()) && is_valid_email($_object_comment_author->getEmail())}mailto:{$_object_comment_author->getEmail()}{/if}">
                                <img src="{$_object_comment_author->getAvatarUrl(true)}" alt="avatar" />
                            </a>
            
                            <ul class="comment_options">
                                <li class="comment_options_first">&nbsp;</li>
                                <li>{link href=$_object_comments_comment->getViewUrl() title='Permalink' class='subobject_permalink' not_lang=true}{lang}#{/lang}{counter name=comment_num}{/link}</li>
                                {if $_object_comments_comment->canEdit($logged_user)}
                                    <li>{link href=$_object_comments_comment->getAttachmentsUrl() title='Manage Attachments'}<span class="lnr lnr-paperclip"></span>{/link}</li>
                                    <li>{link href=$_object_comments_comment->getEditUrl() title='Update Comment'}<span class="lnr lnr-pencil"></span>{/link}</li>
                                {/if}
                                {if $_object_comments_comment->canDelete($logged_user)}
                                    <li>{link href=$_object_comments_comment->getTrashUrl() title='Move to Trash' method=post}<span class="lnr lnr-trash"></span>{/link}</li>
                                {/if}
                                {if $_object_comments_comment->getVisibility() == VISIBILITY_PRIVATE}
                                    <li>{object_visibility object=$_object_comments_comment user=$logged_user}</li>
                                {/if}
                            </ul>
                            
                            <script type="text/javascript">
                            App.CommentOptions.init('comment{$_object_comments_comment->getId()}');
                            </script>
            
                            <div class="subobject_author_info">
                                {user_link user=$_object_comment_author} {lang}said{/lang}<br />
                                <span class="subobject_date">{$_object_comments_comment->getCreatedOn()|ago}</span>
                            </div>
                            
                        </div>
            
                        <div class="content" id="comment_body_{$_object_comments_comment->getId()}">
                        	{$_object_comments_comment->getFormattedBody()}
                        </div>
            
                        {if $_object_comments_comment->getSource() == $smarty.const.OBJECT_SOURCE_EMAIL}
                            <script type="text/javascript">
                            App.EmailObject.init('comment_body_{$_object_comments_comment->getId()}');
                            </script>
                        {/if}
            
                        {object_attachments object=$_object_comments_comment brief=yes}
                        
                    </div>
                    
                {/foreach}
                
            {/if}
            
        </div>
        
        {if $_object_comments_next_page}
            <p class="next_page"><a href={$_object_comments_next_page}>{lang}Next Page{/lang}</a></p>
        {/if}

        
        {if $_object_comments_show_form && $_object_comments_object->canComment($logged_user)}
            
            <div class="comment-form">
            
                {form action=$_object_comments_object->getPostCommentUrl() method=post enctype="multipart/form-data" autofocus=no ask_on_leave=yes}
                    
                    <div class="field">
                    
                        <textarea name="comment[body]" id="commentBody" class="redactor" placeholder="{lang}Enter Comment{/lang}">{$comment_data.body}</textarea>
                        
                    </div>
                    
                    <div class="field">
                    
                        <a href="#" class="ctrlHolderToggler button_add attachments">{lang}Attach Files{/lang}</a>
                        
                        {wrap field=attachments}
                            {attach_files max_files=10}
                        {/wrap}
                        
                    </div>
                    
                    <div class="field">
                    
                        {if $_object_comments_object->canChangeCompleteStatus($logged_user) && $_object_comments_object->isOpen()}
                            {checkbox_field name='comment[complete_parent_object]' id=completeParent value="true"} 
                            <label for="completeParent" class="checkbox_complete">{lang object_type=$_object_comments_object->getVerboseType(true)}Complete :object_type with this comment{/lang}</label>
                        {/if}
                        
                    </div>

                    <div class="field">
                        
                        {submit}Comment{/submit}
                        
                    </div>
                    
                {/form}
            
            </div>
            
        {elseif $_object_comments_object->getIsLocked()}
        
            <div class="comments-locked">
            
            	<p>{lang type=$_object_comments_object->getVerboseType(true)}This :type is locked for new comments{/lang}</p>
                
            </div>
            
        {/if}
        
	</div>
  
</div>

<script type="text/javascript">

	// TODO: App.resources.quickCommentForm.init('object_comments_{$_object_comments_object->getId()}');
	//$('#object_comments_{$_object_comments_object->getId()} div.comment div.content').scaleBigImages();
	
</script>