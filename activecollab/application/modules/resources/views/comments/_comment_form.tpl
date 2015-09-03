<!--<textarea name="comment[body]" id="commentBody" class="redactor" placeholder="{lang}Enter Comment{/lang}">{$comment_data.body}</textarea>-->

{wrap field=body}
    {label required=yes}Comment{/label}
    {editor_field name='comment[body]' class='redactor validate_callback tiny_value_present' inline_attachments=$comment_data.inline_attachments placeholder="{lang}Enter Comment{/lang}"}{$comment_data.body}{/editor_field}
{/wrap}
