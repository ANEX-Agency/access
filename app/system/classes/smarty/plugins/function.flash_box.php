<?php

/**
* Render flash box (success or error message)
*/

/**
* Render smarty flash box
* 
* No parameters expected
*
* @param array $params
* @param Smarty $smarty
* @return string
*/
function smarty_function_flash_box( $params, &$smarty ) {

	if( $message = flash_get( 'success' ) ) {
		$type = 'success';
	} elseif( $message = flash_get( 'error' ) ) {
		$type = 'error';
	} else {
		return '';
	} // if
	
	return '<div id="' . $type . '" class="flash flash-' . $type . '"><span>' . $message . '</span></div>';

} // smarty_function_flash_box

?>