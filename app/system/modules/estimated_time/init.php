<?php

  /**
   * Init estimated_time module
   *
   * @package activeCollab.modules.estimated_time
   */
  
  define('ESTIMATED_TIME_MODULE', 'estimated_time');
  define('ESTIMATED_TIME_MODULE_PATH', APPLICATION_PATH . '/modules/estimated_time');
  
  require ESTIMATED_TIME_MODULE_PATH . '/functions.php';
  
  set_for_autoload(array(
    'EstimatedTime' => ESTIMATED_TIME_MODULE_PATH . '/models/EstimatedTime.class.php',
    'EstimatedTimes' => ESTIMATED_TIME_MODULE_PATH . '/models/EstimatedTimes.class.php',
  ));
?>