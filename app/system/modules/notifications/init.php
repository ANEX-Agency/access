<?php
  /**
   * Init notifications module
   *
   * @package activeCollab.modules.notifications
   */
  define('notifications_MODULE', 'notifications');
  define('notifications_MODULE_PATH', APPLICATION_PATH . '/modules/notifications');
  define('notifications_PATH', VAR_PATH.'/notifications');
  define('notifications_MODULE_SEND_ERROR_EMAIL', true);

  function notifications_module_notify_users ($objects, $notify_types, $notify_owner_company) {

  	$owner_company = Companies::findOwnerCompany();
  	$owner_company_id = $owner_company->getId();
    foreach ($objects as $object) {
        // Find out if object type is allowed
    	if (in_array($object->getType(), $notify_types)) {

		    if ($object->hasAssignees()) {

		       	if ($object->getDueOn() == strftime('%Y-%m-%d', time())) {
	   				$due_on = 'today';
	   			} else {
	   				$due_on = $object->getDueOn();
	   			}
		    	
		    	// Get project from Id
		    	$project = Projects::findById($object->getProjectId());
		    	if (ConfigOptions::getValue('notifications_notify_responsible')) {
					$assignees = $object->getResponsibleAssignee();
		    	} else {
		    		$assignees = $object->getAssignees();	
		    	}
				
				if (is_foreachable($assignees) && $notify_owner_company) {
					foreach ($assignees as $assignee) {
						if ($assignee->getCompanyId() == $owner_company_id) {
							notifications_module_notify_send($assignee, $object, $project, $due_on);
						}
					}
				} else {
					notifications_module_notify_send($assignees, $object, $project, $due_on);
				} // if
	
		    } // if
		} // if
    } // foreach
  } // notifications_module_notify_users
  
  function notifications_module_notify_send($assignees, $object, $project, $due_on) {
  	
	// Send notifications to all assigned users
	    ApplicationMailer::instance()->send($assignees, 'notifications/notify_due', array(
			'object_type'       => $object->getType(),
			'object_name'       => $object->getName(),
			'object_url'        => $object->getViewUrl(),
			'project_name'      => $project->getName(),
			'due_on'            => $due_on,
			),
			$object);
  } // notifications_module_notify_send
  
?>
