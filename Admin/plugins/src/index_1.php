<?php
$spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load('test.xlsx');
$worksheet = $spreadsheet->getActiveSheet();

var_dump($worksheet->getHeaderFooter()->getOddFooter());
var_dump($worksheet->getHeaderFooter()->getEvenFooter());
var_dump($worksheet->getHeaderFooter()->getOddHeader());
var_dump($worksheet->getHeaderFooter()->getEvenHeader());
?>
