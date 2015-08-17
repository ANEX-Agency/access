<?php

  /**
   * System module on_before_object_insert event handler
   *
   * @package activeCollab.modules.system
   * @subpackage handlers
   */
  
  /**
   * Set created_ properties for a given object if not set
   *
   * @param DataObject $object
   * @return null
   */
  function estimated_time_handle_on_before_object_insert($object) {
  	if (is_object($object) && $object->fieldExists('type') && $object->getType() == 'Ticket' && isset($_POST['ticket']['estimated_time'])) {
			$user =& get_logged_user();
	  	$et = new EstimatedTime();
	    $et->setAttributes(array(
	    	'tid' => $object->getFieldValue('ticket_id'),
	    	'pid' => $object->getFieldValue('project_id'),
	    	'uid' => $user->getId(),
	    	'time' => $_POST['ticket']['estimated_time'] * 3600,
	    ));
	    $et->save();  	  	
  	} else {
  		return ;
  	}
  } // system_handle_on_before_object_insert

?>