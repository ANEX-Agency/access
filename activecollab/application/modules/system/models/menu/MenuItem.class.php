<?php

  /**
   * Main menu item
   *
   * @author Ilija Studen <ilija.studen@gmail.com>
   */
  class MenuItem extends AngieObject {
    
    /**
     * Unique item name
     *
     * @var string
     */
    var $name;
    
    /**
     * Item caption
     *
     * @var string
     */
    var $caption;
    
    /**
     * Item URL
     *
     * @var string
     */
    var $url;
    
    /**
     * Item icon
     *
     * @var string
     */
    var $icon;
    
    /**
     * Value of menu item badge
     *
     * @var mixed
     */
    var $badge_value;
    
    /**
     * Access key
     *
     * @var string
     */
    var $access_key;
  
    /**
     * Constructor
     *
     * @param string $caption
     * @param string $url
     * @param string $icon_url
     * @param array $subitems
     * @param mixed $badge_value
     * 
     * @return MenuItem
     */
    function __construct($name, $caption, $url, $icon, $badge_value = null, $access_key = null) {
      $this->name = $name;
      $this->caption = $caption;
      $this->url = $url;
      $this->icon = $icon;
      $this->badge_value = $badge_value;
      $this->access_key = $access_key;
    } // __construct
    
	/**
	 * Render this item
	 *
	 * @param void
	 * @return null
	 */
	function render() {
	
		$output = '<a href="' . $this->url . '"';
		
		if ( $this->access_key )
			$output .= ' accesskey="' . $this->access_key . '"';
		
		$output .='>';
		
		if( $this->icon )
			$output .='<span class="' . $this->icon . '"></span> ';
		else
			$output .='<span class="lnr lnr-screen"></span> ';

		if ($this->badge_value)
			$output .= '<span class="badge">' . clean($this->badge_value). '</span>';
		
			$output .= clean($this->caption);
			
		$output .= '</a>';
		
		return $output;
	
	} // render
  
} // MenuItem

?>