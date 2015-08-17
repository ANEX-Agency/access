<?php

  /**
   * Notifications module on_admin_section event handler
   *
   * @package activeCollab.modules.notifications
   * @subpackage handlers
   */

  /**
   * Register tool in administration tools section
   *
   * @param array $sections
   * @return null
   */
  function notifications_handle_on_admin_sections(&$sections) {
    $sections[ADMIN_SECTION_MAIL][notifications_MODULE] = array(
      array(
        'name'        => lang('Notifications'),
        'description' => lang('Automatically send notifications of upcoming events'),
        'url'         => assemble_url('notifications_admin'),
        'icon'        => get_image_url('icon_big.gif', notifications_MODULE)
      ),
    );
  } // notifications_handle_on_admin_sections

?>