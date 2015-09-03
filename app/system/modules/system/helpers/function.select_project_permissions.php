<?php

  /**
   * Render select project permissions widget
   *
   * @package activeCollab.modules.system
   * @subpackage helpers
   */

  /**
   * Render widgert
   *
   * @param array $params
   * @param Smarty $smarty
   * @return string
   */
  function smarty_function_select_project_permissions($params, &$smarty) {
    static $counter = 1;
    
    $id = array_var($params, 'id');
    if(empty($id)) {
      $id = 'select_project_permissions_' . $counter;
      $counter++;
    } // if
    
    $name = array_var($params, 'name');
  	$value = array_var($params, 'value', array());
  	$permissions = Permissions::findProject();
  	
  	if(is_foreachable($permissions)) {
  	  $levels = array(
//  	    PROJECT_PERMISSION_NONE		=> lang('No Access'),
//   	    PROJECT_PERMISSION_ACCESS	=> lang('View'),
//   	    PROJECT_PERMISSION_CREATE	=> lang('Create'),
//   	    PROJECT_PERMISSION_MANAGE	=> lang('Manage'),
		
//  	    PROJECT_PERMISSION_NONE		=> '<i class="uk-icon-remove"></i>',
//   	    PROJECT_PERMISSION_ACCESS	=> '<i class="uk-icon-eye"></i>',
//   	    PROJECT_PERMISSION_CREATE	=> '<i class="uk-icon-pencil"></i>',
//   	    PROJECT_PERMISSION_MANAGE	=> '<i class="uk-icon-hand-stop-o"></i>',
  	    
		PROJECT_PERMISSION_NONE		=> '<span class="lnr lnr-cross"></span>',
   	    PROJECT_PERMISSION_ACCESS	=> '<span class="lnr lnr-eye"></span>',
   	    PROJECT_PERMISSION_CREATE	=> '<span class="lnr lnr-pencil"></span>',
   	    PROJECT_PERMISSION_MANAGE	=> '<span class="lnr lnr-hand"></span>',
  	  );
  	  
  	  $result = '<table class="uk-table" id="' . clean($id) . '">
  	    <tr>
  	      <th>' . lang('Object') . '</th>
  	      <th colspan="4">' . lang('Permissions Level') . '</th>
  	    </tr>';
  	  $counter = 1;
  	  foreach($permissions as $permission => $permission_name) {
  	    $permission_value = array_var($value, $permission);
  	    if($permission_value === null) {
  	      $permission_value = PROJECT_PERMISSION_NONE;
  	    } // if
  	    
  	    $result .= '<tr><td class="permission-name"><h4>' . $permission_name . '</h4></td>';
  	    
  	    foreach($levels as $level_value => $level_label) {
  	      $input_id = 'select_permission_' . $permission . '_' . $level_value;
  	      $input_attributes = array(
  	        'name' => $name . '[' . $permission . ']',
  	        'value' => $level_value,
  	        'type' => 'radio',
  	        'class' => '',
  	        'id' => $input_id,
  	      );
  	      
  	      if($level_value == $permission_value)
			$input_attributes['checked'] = 'checked';
  	      
  	      $label_attributes = array(
  	        'for' => $input_id,
  	        'class' => ''
  	      );
		  
		  $label_attributes['data-uk-tooltip title'] = '';
		  
		  if( $level_value == 0 )
			  $label_attributes['data-uk-tooltip title'] = 'Has no access';
		  elseif( $level_value == 1 )
			  $label_attributes['data-uk-tooltip title'] = 'Can view';
		  elseif( $level_value == 2 )
			  $label_attributes['data-uk-tooltip title'] = 'Can view and write';
		  elseif( $level_value == 3 )
			  $label_attributes['data-uk-tooltip title'] = 'Can view, write and delete';
  	      
  	      $class = $level_value == PROJECT_PERMISSION_NONE ? 'no-access' : 'has-access access-level-' . $level_value;
  	      
  	      $result .= '<td class="permission-value ' . $class . '">' . open_html_tag('input', $input_attributes, true) . ' ' . open_html_tag('label', $label_attributes) . $level_label . '</label></td>';
  	    } // if
  	    
  	    $result .= '</tr>';
  	    
  	    $counter++;
  	  } // foreach
  	  return $result . '</table><script type="text/javascript">App.widgets.SelectProjectPermissions.init("' . clean($id) . '")</script>';
  	} // if
  } // smarty_function_select_project_permissions

?>