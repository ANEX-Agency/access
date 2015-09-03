$(document).ready(function() {
  
	$( 'html' ).addClass( 'js' );
	
	$( 'header' ).addClass( 'Fixed' );
	
	$( '.avatar + .panel' ).addClass( 'invisible' );
		
	$( '.avatar' ).on('click', function(e){	
	
		e.preventDefault();
			
		if( $(this).next( '.panel' ).hasClass( 'visible' ) ) {
			
			$(this).next( '.panel' ).addClass( 'invisible' );
			$(this).next( '.panel' ).removeClass( 'visible' );
			
		} else {

			$(this).next( '.panel' ).addClass( 'visible' );
			$(this).next( '.panel' ).removeClass( 'invisible' );

		}
		
		return false;
		
	});
	
	$( '#menu' ).prepend( '<a class="ab-item" href="#side-panel"><span class="lnr lnr-menu"></span></a>' );
	
	$( $( '#menu ul' ).clone() ).prependTo( '#side-panel nav' ); 
	
	$( "#side-panel").mmenu({
//		"slidingSubmenus": false,
		"extensions": [
			"border-full",
			"effect-slide-menu",
			"effect-slide-listitems",
			//"effect-slide-panels-100",
			"pageshadow",
			"iconbar",
			"theme-dark"
		],
		"offCanvas": {
			"zposition": "next",
			"position":	"left"
		},
//		"autoHeight": true,
		"navbar": {
			"title": "ANEX ACCESS"
		},
		'onClick': {
			'close': false,
			'preventDefault': false,
			'setSelected': true
		},
		"navbars": [
			{
				"position": "top"
			},
//			{
//				"position": "bottom",
//				"content": [
//					'<a href="//wpcasa.com" target="_blank"><i class="fa fa-globe"></i></a>',
//					'<a href="//twitter.com/wpcasa"><i class="fa fa-twitter"></i></a>',
//					'<a href="//www.facebook.com/wpcasa?ref=br_rs"><i class="fa fa-facebook"></i></a>'
//				]
//			}
		],
		//searchfield: true,
		//dragOpen: true//{
		   // drag open options
		//}
	}, {
		
		clone: false
	
	});
	
	
	
	
	$( ".datepicker" ).each(function( index ) {
		var datepicker = UIkit.datepicker( $(this), { format: 'YYYY-MM-DD' } );	
	});
	
	
	

	var buttons = [
		'html',
		'formatting',
		'|',
		'bold',
		'italic',
		'underline',
		'deleted',
		'|',
		'alignment',
		'|',
		'unorderedlist',
		'orderedlist',
		'outdent',
		'indent',
		'|',
		'image',
		'table',
		'link',
		'|',
		'horizontalrule'
	];

	$( '.redactor' ).redactor( {
		buttons: buttons,
//		cleanup: true,
//		removeEmptyTags: true,
//		linebreaks: false

		focus: true,
		//plugins: ['table', 'bufferbuttons'],
		//buttonSource: true,
		paragraphize: false,
		linebreaks: false

	} );
  	   
});