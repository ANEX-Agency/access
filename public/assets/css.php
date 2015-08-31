<?php

define( 'ASSETS_PATH', dirname( __FILE__ ) );
define( 'CONFIG_FILE_PATH', realpath( ASSETS_PATH . '/../../config/config.php' ) );

if( is_file( CONFIG_FILE_PATH ) )
	require_once CONFIG_FILE_PATH;

if( !defined( 'COMPRESS_ASSET_REQUESTS' ) )
	define( 'COMPRESS_ASSET_REQUESTS', true );

if( COMPRESS_ASSET_REQUESTS && extension_loaded( 'zlib' ) && !( ( boolean ) ini_get( 'zlib.output_compression' ) ) ) {
	@ob_start( 'ob_gzhandler' );
} else {
	ob_start();
}

// Turn magic quotes OFF
if( get_magic_quotes_gpc() )
	set_magic_quotes_runtime( 0 );

header( "Content-type: text/css; charset: UTF-8" );
header( "Cache-Control: max-age=8640000" );
header( "Expires: " . gmdate( "D, d M Y H:i:s", time() + 8640000 ) . " GMT" );

$files = array(
	ASSETS_PATH . '/stylesheets/global.css',
	ASSETS_PATH . '/modules/system/stylesheets/main.css',
	ASSETS_PATH . '/stylesheets/jquery.ui.css',
	ASSETS_PATH . '/stylesheets/tree_component.css',
//	ASSETS_PATH . '/stylesheets/uni-form-generic.css',
//	ASSETS_PATH . '/stylesheets/uni-form.css',
	ASSETS_PATH . '/modules/resources/stylesheets/main.css',
	
	ASSETS_PATH . '/css/core.global.css',
	ASSETS_PATH . '/css/core.layout.css',
	ASSETS_PATH . '/css/core.typo.css',
	
	ASSETS_PATH . '/css/base.mixed.css',

	ASSETS_PATH . '/css/component.actions.css',
	ASSETS_PATH . '/css/component.accordion.css',
	ASSETS_PATH . '/css/component.breadcrumbs.css',
	ASSETS_PATH . '/css/component.buttons.css',
	//ASSETS_PATH . '/css/component.colorpicker.css',
	ASSETS_PATH . '/css/component.datepicker.css',
	ASSETS_PATH . '/css/component.forms.css',
	ASSETS_PATH . '/css/component.menus.css',
	ASSETS_PATH . '/css/component.modals.css',
	ASSETS_PATH . '/css/component.notifications.css',
	ASSETS_PATH . '/css/component.pagination.css',
	ASSETS_PATH . '/css/component.panels.css',
	ASSETS_PATH . '/css/component.scrollbars.css',
	ASSETS_PATH . '/css/component.tabs.css',
	
	ASSETS_PATH . '/css/extension.redactor.css'
);

$modules = isset($_GET['modules']) && $_GET['modules'] ? explode(',', trim($_GET['modules'], ',')) : null;

$d = dir( ASSETS_PATH . '/modules' );

while( ( $entry = $d->read() ) !== false ) {
  
	if( $entry == '.' || $entry == '..' || $entry == 'system' || $entry == 'resources' )
		continue;
	
	if( $modules && !in_array( $entry, $modules ) )
		continue;
	
	$files[] = ASSETS_PATH . '/modules/' . $entry . '/stylesheets/main.css';
	
}

$d->close();

// Turn magic quotes OFF
foreach( $files as $file ) {
	
	if( !is_file( $file ) )
		continue;
	
	print "\n\n/** File: " . substr( $file, strlen( ASSETS_PATH ) + 1 ) . " **/\n\n";
	
	$f = fopen( $file, 'r' );
	$filesize = filesize( $file );
	
	if( $filesize )
		print fread( $f, $filesize );
	
	fclose( $f );

}