<?php

  /**
   * Render radio field
   * 
   * Parameters:
   * 
   * - name - Field name
   * - value - Initial value. Value of this field is ignored if checked 
   *   attribute is present
   * - array of additional attributes
   *
   * @param array $params
   * @param Smarty $smarty
   * @return string
   */
  function smarty_function_radio_field($params, &$smarty) {
    $params['type'] = 'radio';
    
    if(array_key_exists('checked', $params)) {
      if($params['checked']) {
        $params['checked'] = 'checked';
      } else {
        unset($params['checked']);
      } // if
    } // if
    
    $class = array_var($params, 'class');
    if($class == '') {
      $classes[] = 'inline';
      $classes[] = 'input_radio';
    } else {
      $classes = explode(' ', $class);
      if(!in_array('inline', $classes)) {
        $classes[] = 'inline';
      } // if
      $classes[] = 'input_radio';
    } // if
    $params['class'] = implode(' ', $classes);
    
    if(!isset($params['value'])) {
      $params['value'] = '1';
    } // if
    
    return open_html_tag('input', $params, true);
  } // smarty_function_radio_field

?>