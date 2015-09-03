<?php

class AngieAutoloader {

    private static $_initialized;

    private static $_paths = array();

    public static function register() {
        spl_autoload_register(array(self, 'load'));
    }

    public static function addClass($class, $path = null) {
        if(!self::$_initialized) {
            self::register();
            self::$_initialized = true;
        }

        if(is_array($class)) {
            foreach($class as $k => $v) {
                self::$_paths[strtoupper($k)] = $v;
            }
        } else {
            self::$_paths[strtoupper($class)] = $path;
        }
    }

    public static function load($class) {
        $key = strtoupper($class);

        if(!isset(self::$_paths[$key]))
            return;

        @include self::$_paths[$key];
    }
}

function set_for_autoload($class, $path = null) {
    AngieAutoloader::addClass($class, $path);
}