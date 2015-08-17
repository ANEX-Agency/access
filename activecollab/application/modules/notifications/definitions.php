<?php

  /**
   * notification module definitions
   *
   * @package activeCollab.modules.notifications
   */
  
  return array(
  
    // Config options
    'config_options' => array(
      new ConfigOptionDefinition('notifications_when_to_send', 'notifications', 'system', 24),
      new ConfigOptionDefinition('notifications_enabled', 'notifications', 'system', false),
      new ConfigOptionDefinition('notifications_days_to_due', 'notifications', 'system', false),
      new ConfigOptionDefinition('notifications_notify_today', 'notifications', 'system', false),
    ),
  );

?>