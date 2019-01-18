<?php
/**
 * Header file.
 */
error_reporting(E_ALL);

require_once __DIR__ . '\Bootstrap.php';

$helper = new \PhpOffice\PhpSpreadsheet\Helper\Sample();
if (!defined('EOL')) {
    define('EOL', $helper->isCli() ? PHP_EOL : '<br />');
}

// Return to the caller script when runs by CLI
if ($helper->isCli()) {
    return;
}

$requirements = [
    'PHP 5.5.0' => version_compare(phpversion(), '5.5.0', '>='),
    'PHP extension XML' => extension_loaded('xml'),
    'PHP extension xmlwriter' => extension_loaded('xmlwriter'),
    'PHP extension mbstring' => extension_loaded('mbstring'),
    'PHP extension ZipArchive (optional)' => extension_loaded('zip'),
    'PHP extension GD (optional)' => extension_loaded('gd'),
    'PHP extension dom (optional)' => extension_loaded('dom'),
];
?>

<title>Test</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" />
<link rel="stylesheet" href="bootstrap/css/phpspreadsheet.css" />
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <a href="01_Simple.php">Sample 1</a>
	<br>
	<a href="04_Printing.php">Sample 2</a>
</body>
</html>