<?php
    require_once 'vendor/autoload.php';

    $mysqli = new mysqli('localhost', 'root', '', 'excel');

    use PhpOffice\PhpSpreadsheet\Spreadsheet;
    use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    $all = $mysqli->query("SELECT * FROM `brands`")->fetch_all(MYSQLI_ASSOC);
    $columnsInfo = $mysqli->query("DESC `brands`")->fetch_all(MYSQLI_ASSOC);

    $columnNameAndType = [];

    foreach ($columnsInfo as $info)
    {
        $name = $info['Field'];
        $type = $info['Type'];

        $columnNameAndType[$name] = $type;
    }

    $i = 2;
    $j = ord('A');

    // Записываем имена столбцов
    foreach ($columnNameAndType as $columnName => $val)
    {
        $sheet->setCellValue(chr($j++) . 1, $columnName);
    }

    // Записываем сами значения в каждый столбец
    for ($a = 0; $a < count($all); $a++)
    {
        $j = ord('A');
        
        foreach ($all[$a] as $columnName => $columnValue)
        {
            $sheet->setCellValue(chr($j++) . $i, $columnValue);
        }

        $i++;
    }

    $writer = new Xlsx($spreadsheet);
    $writer->save('text.xlsx');
?>