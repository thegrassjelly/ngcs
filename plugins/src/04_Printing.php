<?php

//require __DIR__ . '\index.php';
require_once __DIR__ . '\Bootstrap.php';

$helper = new \PhpOffice\PhpSpreadsheet\Helper\Sample();
if (!defined('EOL')) {
    define('EOL', $helper->isCli() ? PHP_EOL : '<br />');
}

if ($helper->isCli()) {
    echo 'This example should only be run from a Web Browser' . PHP_EOL;

    return;
}

// Create new Spreadsheet object
$spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();

/*
// Set document properties
$helper->log('Set document properties');
$spreadsheet->getProperties()->setCreator('Maarten Balliauw')
        ->setLastModifiedBy('Maarten Balliauw')
        ->setTitle('Office 2007 XLSX Test Document')
        ->setSubject('Office 2007 XLSX Test Document')
        ->setDescription('Test document for Office 2007 XLSX, generated using PHP classes.')
        ->setKeywords('office 2007 openxml php')
        ->setCategory('Test result file');
*/

// Add some data, we will use printing features
//$helper->log('Add some data');
$spreadsheet->getActiveSheet()->setCellValue('A1', 'Count');
$spreadsheet->getActiveSheet()->setCellValue('B1', 'Value');
$spreadsheet->getActiveSheet()->getStyle('A1:B1')->getFont()->setBold(true);
for ($i = 2; $i < 200; ++$i) {
    $spreadsheet->getActiveSheet()->setCellValue('A' . $i, $i);
    $spreadsheet->getActiveSheet()->setCellValue('B' . $i, 'Test value');
}

// Set header and footer. When no different headers for odd/even are used, odd header is assumed.
//$helper->log('Set header/footer');
$spreadsheet->getActiveSheet()
        ->getHeaderFooter()
		->setOddHeader	('&L&G&C&H&BBUREAU OF TREASURY
						  &L&G&C&H&BDEPARTMENT OF FINANCE');
		//->setOddHeader($richText);
$spreadsheet->getActiveSheet()
        ->getHeaderFooter()
        ->setOddFooter('&L&B' . $spreadsheet->getProperties()->getTitle() . '&RPage &P of &N');

// Add a drawing to the header
//$helper->log('Add a drawing to the header');

$drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\HeaderFooterDrawing();
$drawing->setName('PhpSpreadsheet logo');
$drawing->setPath(__DIR__ . '\images\btr-logo.png');
$drawing->setHeight(100);
$spreadsheet->getActiveSheet()->getPageMargins()->setTop(1.75);
$spreadsheet->getActiveSheet()
        ->getHeaderFooter()
        ->addImage($drawing, \PhpOffice\PhpSpreadsheet\Worksheet\HeaderFooter::IMAGE_HEADER_LEFT);

// Set page orientation and size
//$helper->log('Set page orientation and size');
$spreadsheet->getActiveSheet()
        ->getPageSetup()
        ->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
$spreadsheet->getActiveSheet()
        ->getPageSetup()
        ->setPaperSize(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::PAPERSIZE_A4);

// Rename worksheet
//$helper->log('Rename worksheet');
$spreadsheet->getActiveSheet()->setTitle('Printing');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$spreadsheet->setActiveSheetIndex(0);
$spreadsheet->getActiveSheet()->getSheetView()->setView(\PhpOffice\PhpSpreadsheet\Worksheet\SheetView::SHEETVIEW_PAGE_LAYOUT);
// Save
//$helper->write($spreadsheet, __FILE__);

// Redirect output to a client’s web browser (Excel2007)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="01simple.xlsx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
//header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
//header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
//header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
//header('Pragma: public'); // HTTP/1.0

$writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Excel2007');
$writer->save('php://output');
exit;

