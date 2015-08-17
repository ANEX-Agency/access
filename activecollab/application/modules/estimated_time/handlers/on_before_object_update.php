<?php

  /**
   * System module on_before_object_update event handler
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
  function estimated_time_handle_on_before_object_update($object) {
  	if (is_object($object) && $object->fieldExists('type') && $object->getType() == 'Ticket' && isset($_POST['ticket']['estimated_time'])) {
			$user =& get_logged_user();
	  	$ets = EstimatedTimes::find(array(
				'conditions' => array('tid = ? AND pid = ?', $object->getFieldValue('ticket_id'), $object->getFieldValue('project_id')),
			));			
			$time = $_POST['ticket']['estimated_time'] * 3600;
			if (count($ets)) {
				$et = $ets[0];
		    $et->setAttributes(array(
		    	'uid' => $user->getId(),
		    	'time' => $time,
		    ));
			} else {
				$et = new EstimatedTime();
		    $et->setAttributes(array(
		    	'tid' => $object->getFieldValue('ticket_id'),
		    	'pid' => $object->getFieldValue('project_id'),
		    	'uid' => $user->getId(),
		    	'time' => $time,
		    ));
			}
	    $et->save();  	  	
  	} else {
  		return ;
  	}
  }
  
?>