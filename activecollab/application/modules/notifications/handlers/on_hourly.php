<?php
  /**
   * Notifications module on_hourly event handler
   *
   * @package activeCollab.modules.notifications
   * @subpackage handlers
   */

  /**
   * Send daily mails, this is the actual logic of the module :)
   *
   * @param null
   * @return null
   */
  function notifications_handle_on_hourly() {

  	// Enabled?
    if (!ConfigOptions::getValue('notifications_enabled')) {
      return true;
    } // if
	
    // Time is now?
    $reference_time = new DateTimeValue(time());
    if (ereg_replace("^0+","",strftime('%H', $reference_time->getTimestamp())) != ConfigOptions::getValue('notifications_when_to_send')) {
      return true;
    } // if
    
    $notify_types = array('Milestone', 'Ticket', 'Checklist');
	$notify_owner_company = ConfigOptions::getValue('notifications_notify_owner_company');
	
    // Get objects due in $days_to_due time (in days)
    $days_to_due = ConfigOptions::getValue('notifications_days_to_due');
    $objects = ProjectObjects::find(array(
        'conditions' => array('TO_DAYS(due_on) - TO_DAYS(NOW()) = ?', $days_to_due),
	'order' => 'type DESC',
    ));

    if (count($objects) <= 0) {
      return true;
    } else {
    	notifications_module_notify_users($objects, $notify_types, $notify_owner_company);
    }
    
    // Get objects due today
    if (ConfigOptions::getValue('notifications_notify_today')) {
	    $objects = ProjectObjects::find(array(
	        'conditions' => array('TO_DAYS(due_on) - TO_DAYS(NOW()) = 0'),
		'order' => 'type DESC',
	    ));
	
	    if (count($objects) <= 0) {
	      return true;
	    } else {
		    notifications_module_notify_users($objects, $notify_types, $notify_owner_company);
	    }
    }

    log_message('Sent out daily notifications', LOG_LEVEL_INFO, 'notifications');
  } // notifications_handle_on_hourly
?>