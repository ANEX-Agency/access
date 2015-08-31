<div class="field-group">

    <div class="field">
        {label for=projectName required=1 class="uk-form-label"}Name{/label}
        {text_field name='project[name]' value=$project_data.name id=projectName class="title uk-form-large uk-width-1-1"}
    </div>
  
    <div class="field">
        {label for=projectOverview class="uk-form-label"}Overview{/label}
        {editor_field name='project[overview]' id=projectOverview class=redactor inline_attachments=$project_data.inline_attachments}{$project_data.overview}{/editor_field}
    </div>
    
</div>

<div class="field-group">

    {label for=projectAdditionalLinks class="uk-form-label"}Additional Links{/label}

    {foreach from=$project_data.links key=k item=item}
    
        <div class="field">
        
            <div class="uk-grid">
                <div class="uk-width-1-1 uk-width-medium-1-3">
                    <input type="text" name="project[links][{$k}][name]" placeholder="Link Name" value="{$item.name}" class="uk-width-1-1" />
                </div>
                <div class="uk-width-1-1 uk-width-medium-2-3">
                    <input type="text" name="project[links][{$k}][url]" placeholder="Link URL" value="{$item.url}" class="uk-width-1-1" />
                </div>
            </div>
        
        </div>
                            
    {/foreach}
    
    <div class="field">
    
        <div class="uk-grid uk-grid-small">
            <div class="uk-width-1-1 uk-width-medium-1-3">
                <input type="text" name="project[links][new0][name]" placeholder="Link Name" value="" class="uk-width-1-1" />
            </div>
            <div class="uk-width-1-1 uk-width-medium-2-3">
                <input type="text" name="project[links][new0][url]" placeholder="Link URL" value="" class="uk-width-1-1" />
            </div>
        </div>
    
    </div>
    
    <!--
    <div class="field">
        <a class="btn btn-secondary" href="#">Add another link</a>
    </div>
    -->

</div>