<?php
if( !function_exists('json_encode') ) {
	function json_encode($data) {
		return do_json_encode($data);
	}
}

// Future-friendly json_decode
if( !function_exists('json_decode') ) {
	function json_decode($data) {
		return do_json_decode($data);
	}
}
?>