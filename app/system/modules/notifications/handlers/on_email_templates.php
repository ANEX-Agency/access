<?php

  /**
   * Register email templates
   *
   * @param array $templates
   * @return null
   */
  function notifications_handle_on_email_templates(&$templates) {
    $templates[NOTIFICATIONS_MODULE] = array(
      new EmailTemplate(NOTIFICATIONS_MODULE, 'notify_due'), 
    );
  } // notifications_handle_on_email_templates

?>