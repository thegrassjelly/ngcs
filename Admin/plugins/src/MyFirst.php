<?php
/**
 * Header file.
 */
error_reporting(E_ALL);

require_once __DIR__ . '/../src/Bootstrap.php';

$helper = new \PhpOffice\PhpSpreadsheet\Helper\Sample();
if (!defined('EOL')) {
    define('EOL', $helper->isCli() ? PHP_EOL : '<br />');
}

// Return to the caller script when runs by CLI
if ($helper->isCli()) {
    return;
}

?>