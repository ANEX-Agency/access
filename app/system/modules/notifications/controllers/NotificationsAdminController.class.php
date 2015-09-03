<?php
  // we need admin controller
  use_controller('admin');
  
  /**
   * Manages notification settings
   * 
   * @package activeCollab.modules.notifications
   * @subpackage controllers
   *
   */
  class NotificationsAdminController extends AdminController {
    
    /**
     * Controller name
     *
     * @var string
     */
    var $controller_name = 'notifications_admin';
    
    /**
     * Notifications enabled?
     *
     * @var true
     */
    var $notifications_enabled = false;
    
    /**
     * When should the mails be sent?
     *
     * @var integer
     */
    var $when_to_send = 7;
    
    /**
     * How many days before?
     *
     * @var integer
     */
    var $days_to_due = 5;

    /**
     * Notify today
     *
     * @var integer
     */
    var $notify_today = 7;    
    
    /**
     * Notify owner company only?
     *
     * @var integer
     */
    var $notify_owner_company = 0;    
    
    
    /**
     * Controller constructor
     *
     */
    function __construct($request) {
      parent::__construct($request);
      
      $reference_time = new DateTimeValue(time());
      $this->notifications_enabled = (boolean) ConfigOptions::getValue('notifications_enabled');
      $this->when_to_send = (int) ConfigOptions::getValue('notifications_when_to_send');
      $this->days_to_due = (int) ConfigOptions::getValue('notifications_days_to_due');
      $this->notify_today = (boolean) ConfigOptions::getValue('notifications_notify_today');
      $this->notify_owner_company = (boolean) ConfigOptions::getValue('notifications_notify_owner_company');
      $this->notify_responsible = (boolean) ConfigOptions::getValue('notifications_notify_responsible');

      $this->smarty->assign(array(
        'notifications_admin_url' => assemble_url('notifications_admin'),
        'notifications_enabled'  => $this->notifications_enabled,
        'notifications_when_to_send' => $this->when_to_send,
      	'notifications_days_to_due' => $this->days_to_due,
      	'notifications_notify_today' => $this->notify_today,
        'notifications_system_time' => strftime('%H:%m', $reference_time->getTimestamp()),
        'notifications_notify_owner_company' => $this->notify_owner_company,
        'notifications_notify_responsible' => $this->notify_responsible,
      ));
    } // __construct
    
    /**
     * Main Notification settings page
     *
     */
    function index() {
      $reference_time = new DateTimeValue(time());

      $when_to_send_names = array('00:00-00:59', '01:00-01:59', '02:00-02:59', '03:00-03:59', '04:00-04:59', '05:00-05:59', '06:00-06:59', '07:00-07:59', '08:00-08:59', '09:00-09:59', '10:00-10:59', '11:00-11:59', '12:00-12:59', '13:00-13:59', '14:00-14:59', '15:00-15:59', '16:00-16:59', '17:00-17:59', '18:00-18:59', '19:00-19:59', '20:00-20:59', '21:00-21:59', '22:00-22:59', '23:00-23:59');
      
      $notifications_data = $this->request->post('notifications');
      if (!is_array($notifications_data)) {
        $notifications_data = array(
          'enabled' => $this->notifications_enabled,
          'when_to_send' => $this->when_to_send,
          'days_to_due' => $this->days_to_due,
          'notify_today' => $this->notify_today,
          'notify_owner_company' => $this->notify_owner_company,
          'notify_responsible' => $this->notify_responsible,
        );
      } // if
      
      $this->smarty->assign(array(
        'notifications_data' => $notifications_data,
        'when_to_send_values' => array(
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23
        ),
        'when_to_send_names' => $when_to_send_names,
        'days_to_due_values' => array(
          1, 2, 3, 4, 5, 6, 7
        ),
        'system_time' => strftime('%H:%M', $reference_time->getTimestamp()),
        'when_to_send_fmt' => $when_to_send_names[$notifications_data['when_to_send']],
      ));
      
      if ($this->request->isSubmitted()) {
        ConfigOptions::setValue('notifications_enabled', (boolean) array_var($notifications_data, 'enabled', 0));
        $when_is_it = (integer) array_var($notifications_data, 'when_to_send', 24);
        ConfigOptions::setValue('notifications_when_to_send', $when_is_it < 0 ? 24 : $when_is_it);
        ConfigOptions::setValue('notifications_days_to_due', (integer) array_var($notifications_data, 'days_to_due', 0));
        ConfigOptions::setValue('notifications_notify_today', (boolean) array_var($notifications_data, 'notify_today', 0));
        ConfigOptions::setValue('notifications_notify_owner_company', (boolean) array_var($notifications_data, 'notify_owner_company', 0));
        ConfigOptions::setValue('notifications_notify_responsible', (boolean) array_var($notifications_data, 'notify_responsible', 0));
        flash_success('Notification settings have been updated');
        $this->redirectTo('admin');
      } // if
    } // index
    
  } // NotificationsAdminController

?>