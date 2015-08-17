<?php

  /**
   * Files module on_milestone_objects_by_visibility event handler
   *
   * @package activeCollab.modules.files
   * @subpackage handlers
   */

  /**
   * Populate $objects with objects that are in $visibility domain
   *
   * @param Milestone $milestone
   * @param array $objects
   * @param integer $visibility
   * @return null
   */
  function files_handle_on_milestone_objects_by_visibility(&$milestone, &$objects, $visibility) {
    $objects[lang('Files')] = Files::findByMilestone($milestone, STATE_VISIBLE, $visibility);
  } // files_handle_on_milestone_objects_by_visibility

?>