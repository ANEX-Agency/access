{title}Reschedule milestone{/title}
{add_bread_crumb}Reschedule{/add_bread_crumb}

<div id="reschedule_milestone">

    {form action=$active_milestone->getRescheduleUrl() method=post id=reschedule_milestone_form class="uk-form uk-form-stacked"}

        <div class="uk-grid" data-uk-grid-margin>
        
            <div class="uk-width-1-1">
    
                <div class="field-group">
                
                    <div class="uk-grid">
                    
                        <div class="uk-width-1-1 uk-width-medium-1-2">
                        
                            <div class="field">
                                {label for=milestoneStartOn required=yes class="uk-form-label"}Start on{/label}
                                <div class="uk-form-icon uk-width-1-1">
                                    <i class="uk-icon-calendar"></i>
                                    <input type="text" name="milestone[start_on]" id="milestoneStartOn" class="datepicker uk-form-large uk-width-1-1" value="{$milestone_data.start_on}" />
                                </div>                    
                            </div>
                        
                        </div>
                        
                        <div class="uk-width-1-1 uk-width-medium-1-2">
                        
                            <div class="field">
                                {label for=milestoneDueOn required=yes class="uk-form-label"}Due on{/label}
                                <div class="uk-form-icon uk-width-1-1">
                                    <i class="uk-icon-calendar"></i>
                                    <input type="text" name="milestone[due_on]" id="milestoneDueOn" class="datepicker uk-form-large uk-width-1-1" value="{$milestone_data.due_on}" />
                                </div>                    
                            </div>
                        
                        </div>
                        
                    </div>
                    
                </div>
            
            </div>
            
            <div class="uk-width-1-1">
                
                <div class="field-group">
                
                    <div class="field">
                        {label class="uk-form-label"}With Successive Milestones{/label}
                        {with_successive_milestones name=milestone[with_sucessive] value=$milestone_data.with_sucessive milestone=$active_milestone}
                    </div>
                    
                    <div class="field">
                        <input type="checkbox" name="milestone[reschedule_milstone_objects]" id="milestoneRescheduleTasks" class="inline input_checkbox" {if $milestone_data.reschedule_milstone_objects}checked="checked"{/if} />
                        {label class=inline for=milestoneRescheduleTasks}Also reschedule all tickets and tasks that belong to milestones you are rescheduling{/label}
                    </div>
                    
                </div>
                
            </div>
            
            <div class="uk-width-1-1">
                
                <div class="field-group">
                
                    <div class="field">
                    	<input type="submit" value="Reschedule" accesskey="s" class="uk-button button button-primary" />
                    </div>
                    
                </div>
                
            </div>
            
        </div>
    
    {/form}
    
</div>