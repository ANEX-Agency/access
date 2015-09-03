<?php

  /**
   * EstimatedTime class
   */
  class EstimatedTime extends ApplicationObject {
    
    /**
     * All table fields
     *
     * @var array
     */
    var $fields = array('id', 'pid', 'tid', 'uid', 'time', 'created', 'updated');
    
    /**
     * Primary key fields
     *
     * @var array
     */
    var $primary_key = array('id');
    
    /**
     * Name of AI field (if any)
     *
     * @var string
     */
    var $auto_increment = 'id'; 
    
    /**
     * Construct the object and if $id is present load record from database
     *
     * @param mixed $id
     * @return TimeReport 
     */
    function __construct($id = null) {
      $this->table_name = TABLE_PREFIX . 'estimated_times';
      parent::__construct($id);
    }

    function getId() {
      return $this->getFieldValue('id');
    }
    function getObjectId() {
      return $this->getFieldValue('oid');
    }
    function getTicketId() {
      return $this->getFieldValue('tid');
    }
    function getProjectId() {
      return $this->getFieldValue('pid');
    }
    function getTime() {
      return $this->getFieldValue('time');
    }
    function getCreated() {
      return $this->getFieldValue('created');
    }
    function getUpdated() {
      return $this->getFieldValue('updated');
    }

    function setAttributes($arr) {
    	$arr['updated'] = isset($arr['updated']) ? $arr['updated'] : date('c');
    	if (!$this->getFieldValue('created')) {
    		$arr['created'] = date('c');
    	}
    	return parent::setAttributes($arr);
    }
    
    /**
     * Set value of specific field
     *
     * @param string $name
     * @param mided $value
     * @return mixed
     */
    function setFieldValue($name, $value) {
      $real_name = $this->realFieldName($name);
      
      $set = $value;
      switch($real_name) {
        case 'id':
          $set = intval($value);
          break;
        case 'pid':
          $set = intval($value);
          break;
        case 'tid':
          $set = intval($value);
          break;
        case 'uid':
          $set = intval($value);
          break;
        case 'time':
          $set = intval($value);
          break;
        case 'created':
          $set = datetimeval($value);
          break;
        case 'updated':
          $set = datetimeval($value);
          break;
      } // switch
      
      return parent::setFieldValue($real_name, $set);
    } // switch  
  }

?>