<?php
defined('BASEPATH') or exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
| AUTO-LOADER
| -------------------------------------------------------------------
| This file specifies which systems should be loaded by default.
|
| In order to keep the framework as light-weight as possible only the
| absolute minimal resources are loaded by default. For example,
| the database is not connected to automatically since no assumption
| is made regarding whether you intend to use it.  This file lets
| you globally define which systems you would like loaded with every
| request.
|
| -------------------------------------------------------------------
| Instructions
| -------------------------------------------------------------------
|
| These are the things you can load automatically:
|
| 1. Packages
| 2. Libraries
| 3. Drivers
| 4. Helper files
| 5. Custom config files
| 6. Language files
| 7. Models
|
*/

/*
| -------------------------------------------------------------------
|  Auto-load Packages
| -------------------------------------------------------------------
| Prototype:
|
|  $autoload['packages'] = array(APPPATH.'third_party', '/usr/local/shared');
|
*/
$autoload['packages'] = array();
$autoload['libraries'] = array(
    'database',
    'email',
    'session',
    'form_validation',
    'formattanggal',
    'formattanggal2',
);
$autoload['drivers'] = array();
$autoload['helper'] = array(
    'url',
    'file',
    'security',
    'cek_akses',
    // 'get_data_from_simak',
    'date'
);
$autoload['config'] = [
    'pdf_config'
];

$autoload['language'] = array();
$autoload['model'] = array();
