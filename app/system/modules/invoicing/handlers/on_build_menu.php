<?php

  /**
   * Invoicing module on_build_menu event handler
   *
   * @package activeCollab.modules.invoicing
   * @subpackage handlers
   */
  
  /**
   * Add options to main menu
   *
   * @param Menu $menu
   * @param User $user
   * @return null
   */
  function invoicing_handle_on_build_menu(&$menu, &$user) {
    if($user->getSystemPermission('can_manage_invoices')) {
      $menu->addToGroup(array(
        new MenuItem('invoicing', lang('Invoices'), assemble_url('invoices'), 'lnr lnr-book', Invoices::countOverdue())
      ), 'main');
    } else if ($user->isCompanyManager($user->getCompany())) {
      $menu->addToGroup(array(
        new MenuItem('invoicing', lang('Invoices'), assemble_url('people_company_invoices', array('company_id' => $user->getCompanyId())), 'lnr lnr-book', Invoices::countByCompany($user->getCompany(), array(INVOICE_STATUS_ISSUED))),
      ), 'main');        
    } // if
  } // invoicing_handle_on_build_menu

?>