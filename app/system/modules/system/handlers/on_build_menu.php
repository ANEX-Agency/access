<?php

  /**
   * System module on_build_menu event handler
   *
   * @package activeCollab.modules.system
   * @subpackage handlers
   */
  
  /**
   * Build menu
   *
   * @param Menu $menu
   * @param User $user
   * @return array
   */
  function system_handle_on_build_menu(&$menu, &$user) {
    
    // ---------------------------------------------------
    //  Tools
    // ---------------------------------------------------
    
    $menu->addToGroup(array(
      new MenuItem('people', lang('People'), assemble_url('people'), 'lnr lnr-user'),
      new MenuItem('projects', lang('Projects'), assemble_url('projects'), 'lnr lnr-briefcase'),
    ), 'main');
    
    // ---------------------------------------------------
    //  Folders
    // ---------------------------------------------------
    
    $folders = array(
      new MenuItem('assignments', lang('Assignments'), assemble_url('assignments'), 'lnr lnr-paperclip'),
      new MenuItem('search', lang('Search'), assemble_url('quick_search'), 'lnr lnr-magnifier'),
      new MenuItem('starred_folder', lang('Starred'), assemble_url('starred'), 'lnr lnr-star')
    );
    
    if($user->isAdministrator() || $user->getSystemPermission('manage_trash')) {
      $folders[] = new MenuItem('trash', lang('Trash'), assemble_url('trash'), 'lnr lnr-trash');
    } // if
    
    $folders[] = new MenuItem('quick_add', lang('Quick Add'), assemble_url('homepage'), 'lnr lnr-plus-circle', null, '+');
    
    $menu->addToGroup($folders, 'folders');
  } // system_handle_on_build_menu

?>