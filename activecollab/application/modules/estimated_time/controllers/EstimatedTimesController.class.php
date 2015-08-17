<?php

use_controller('project', SYSTEM_MODULE);

class EstimatedTimesController extends ApplicationController  {
//class FinancialsController extends ProjectController  {

	/**
     * Active module
     *
     * @var string
     */
	var $active_module = ESTIMATED_TIME_MODULE;

	/**
     * Constructor
     *
     * @param Request $request
     * @return CalendarController
     */
	function __construct($request) {
		parent::__construct($request);		
	} // __construct

	function index() {
		$this->skip_layout = true;
		$et = null;
		
		if ($_GET['path_info']) {
			$uri = $_SERVER['REQUEST_URI'];
			$pidStrt = strpos($uri, 'pid');
			$pid = substr($uri, $pidStrt+4, strpos($uri, '&') - $pidStrt - 4);
			$tid = substr($uri, strpos($uri, 'tid')+4);
		} else {
			$pid = $_GET['pid'];
			$tid = $_GET['tid'];
		}
		
		if ($pid && $tid) {
			$ets = EstimatedTimes::find(array(
				'conditions' => array('tid = ? AND pid = ?', $tid, $pid),
			));			
			if (count($ets)) {
				$et = $ets[0];
				$et = $et->values;
			}
		}

		$this->smarty->assign(array(
			'json' => json_encode($et),
		));
	}
}

?>