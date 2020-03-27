<?php
    require_once 'vendor/autoload.php';

    function getCellValue(string $x, int $y)
    {
        global $sheet;
        return $sheet->getCell($x . $y)->getValue();
    }

    $mysqli = new mysqli('localhost', 'root', '', 'excel');

    $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load('text.xlsx');
    $sheet = $spreadsheet->getActiveSheet();

    $i = 2;
    $j = ord('A');

    // TODO: считываем все столбцы

    $quantityOfColumns = 0;

    while (getCellValue(chr($j++), 1) != '')
    {
        $quantityOfColumns++;
    }

    $j = ord('A');

    $value = getCellValue(chr($j), $i);

    while ($value != '')
    {
        $value = getCellValue(chr($j), $i);
        echo $value . ' ';

        while ($j - ord('A') + 1 <= $quantityOfColumns)
        {
            $value = getCellValue(chr(++$j), $i);
            echo $value . ' ';
        }

        echo '<br>';

        $j = ord('A');
        $i++;

        $value = getCellValue(chr($j), $i);
    }
?>