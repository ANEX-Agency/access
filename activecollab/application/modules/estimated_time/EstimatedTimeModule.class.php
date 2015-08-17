<?php

/**
   * Timetracking module definition
   *
   * @package activeCollab.modules.timetracking
   * @subpackage models
   */
class EstimatedTimeModule extends Module {


	/**
     * Plain module name
     *
     * @var string
     */
	var $name = 'estimated_time';

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
	var $version = '2.0';

	function defineRoutes(&$router) {
		$router->map('estimated_time', 'estimatedtime', array('module' => ESTIMATED_TIME_MODULE, 'controller' => 'EstimatedTimes', 'action' => 'index'));		
	}
	
	/**
     * Define module routes
     *
     * @param Router $r
     * @return null
     */
	function defineHandlers(&$events) {
		$events->listen('on_project_tabs', 'on_project_tabs');
		$events->listen('on_build_menu', 'on_build_menu');
		$events->listen('on_before_object_insert', 'on_before_object_insert');
		$events->listen('on_before_object_update', 'on_before_object_update');
		$events->listen('on_project_object_quick_options', 'on_project_object_quick_options');
	}

	/**
     * Install module
     *
     * @param void
     * @return boolean
     */
	function install() {
		$engine = defined('DB_CAN_TRANSACT') && DB_CAN_TRANSACT ? 'ENGINE=InnoDB' : 'ENGINE=MyISAM';
		$default_charset = defined('DB_CHARSET') && DB_CHARSET == 'utf8' ? 'DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci' : '';
		
		db_execute("CREATE TABLE IF NOT EXISTS `" . TABLE_PREFIX . "estimated_times` (
`id` int(10) unsigned NOT NULL auto_increment,
`pid` int(11) unsigned NOT NULL,
`tid` int(10) unsigned NOT NULL,
`uid` smallint(5) unsigned NOT NULL,
`time` int(10) unsigned NOT NULL,
`created` datetime NOT NULL,
`updated` datetime NOT NULL,
PRIMARY KEY  (`id`),
UNIQUE KEY `pid_tid` (`pid`,`tid`),
KEY `uid` (`uid`),
KEY `pid` (`pid`),
KEY `tid` (`tid`)
		) $engine $default_charset");

		return parent::install();
	} // install

	/**
     * Uninstall this module
     *
     * @param void
     * @return boolean
     */
	function uninstall() {
		db_execute('DROP TABLE IF EXISTS ' . TABLE_PREFIX . 'estimated_time');

		return parent::uninstall();
	} // uninstall


	/**
     * Get module display name
     *
     * @return string
     */
	function getDisplayName() {
		return lang('Estimated Time');
	} // getDisplayName

	/**
     * Return module description
     *
     * @param void
     * @return string
     */
	function getDescription() {
		return lang('Adds estimated time support to tickets');
	} // getDescription

	/**
     * Return module uninstallation message
     *
     * @param void
     * @return string
     */
	function getUninstallMessage() {
		return lang('Module will be deactivated. All estimated time records will be deleted');
	} // getUninstallMessage
}

?>