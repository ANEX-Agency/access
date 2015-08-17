<?php

  /**
   * notifications module definition
   *
   * @package activeCollab.modules.notifications
   * @subpackage models
   */
  class notificationsModule extends Module {
    
    /**
     * Plain module name
     *
     * @var string
     */
    var $name = 'notifications';
    
    /**
     * Is system module flag
     *
     * @var boolean
     */
    var $is_system = false;
    
    /**
     * Module version
     *
     * @var string
     */
    var $version = '1.1';
    
    // ---------------------------------------------------
    //  Events and Routes
    // ---------------------------------------------------
    
    /**
     * Define module routes
     *
     * @param Router $r
     * @return null
     */
    function defineRoutes(&$router) {
      $router->map('notifications_admin', 'admin/tools/notifications', array('controller' => 'notifications_admin', 'action' => 'index'));
    } // defineRoutes
    
    /**
     * Define event handlers
     *
     * @param EventsManager $events
     * @return null
     */
    function defineHandlers(&$events) {
      $events->listen('on_admin_sections', 'on_admin_sections');
      $events->listen('on_hourly', 'on_hourly');
      $events->listen('on_email_templates', 'on_email_templates');
    } // defineHandlers
    
    // ---------------------------------------------------
    //  (Un)Install
    // ---------------------------------------------------
    
    /**
     * Install module
     *
     * @param void
     * @return boolean
     */
    function install() {
      $this->addConfigOption('notifications_enabled', SYSTEM_CONFIG_OPTION, false);
      $this->addConfigOption('notifications_days_to_due', SYSTEM_CONFIG_OPTION, false);
      $this->addConfigOption('notifications_notify_today', SYSTEM_CONFIG_OPTION, false);
      $this->addConfigOption('notifications_notify_owner_company', SYSTEM_CONFIG_OPTION, false);
      $this->addConfigOption('notifications_notify_responsible', SYSTEM_CONFIG_OPTION, false);
      $this->addConfigOption('notifications_when_to_send', SYSTEM_CONFIG_OPTION, 24);
      $this->addEmailTemplate('notify_due', "[:project_name] Reminder for :object_type ':object_name' is due soon", "<p>Hi,</p>\n 
        <p>This is a friendly automatic reminder. :object_type ':object_name' in the ':project_name' project is assigned to you and is due :due_on.</p>\n 
        <p><a href=\":object_url\">Click here</a> for more details</p>\n 
        <p>Kind regards,<br />:owner_company_name</p>", array('due_on', 'owner_company_name', 'project_name', 'object_type', 'object_name', 'object_url'));
      return parent::install();
    } // install
    
    /**
     * Get module display name
     *
     * @return string
     */
    function getDisplayName() {
      return lang('Notifications');
    } // getDisplayName
    
    /**
     * Return module description
     *
     * @param void
     * @return string
     */
    function getDescription() {
      return lang('Automatically send out daily notifications of upcoming events');
    } // getDescription
    
    /**
     * Return module uninstallation message
     *
     * @param void
     * @return string
     */
    function getUninstallMessage() {
      return lang('Module will be deactivated.');
    } // getUninstallMessage
    
  }

?>
