<?php

namespace App\Exports;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use Illuminate\Support\Facades\Response;
use App\Models\Task;

class TaskExport
{
    public function export()
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $headers = [
            '№',
            'Ҳужжат тури',
            'Ҳужжат рақами ва санаси',
            'Топшириқ мазмуни',
            'Топшириқ муддати',
            'Ижрочи(лар)',
            'Топшириқ ҳолати'
        ];

        // Apply styles to header row
        $sheet->fromArray($headers, null, 'A1');
        $sheet->getStyle('A1:G1')->applyFromArray([
            'font' => ['bold' => true, 'size' => 12],
            'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER],
            'fill' => [
                'fillType' => Fill::FILL_SOLID,
                'startColor' => ['rgb' => 'D9D9D9']
            ],
            'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN]]
        ]);

        // Fetch tasks with relations
        $tasks = Task::with(['users', 'user', 'taskAssignments'])->get();
        $row = 2;

        foreach ($tasks as $index => $task) {
            // Task status label
            $status = $this->getStatusLabel($task->taskAssignments->pluck('status')->toArray());

            // Task type mapping
            $taskTypeLabels = [
                'meeting' => 'Эслатмалар',
                'hr_task' => 'Ҳужжат алмашинуви',
                'emp_task' => 'Шахсий топшириқ'
            ];
            $documentType = $taskTypeLabels[$task->task_type] ?? 'Номаълум';

            // Format Document Number and Date (Fixing Incorrect Quotes)
            $documentNumberAndDate = "{$task->id}\n" . optional($task->start_date)->format('Y-m-d');

            // Assigned executors
            $executors = implode("\n", $task->users->pluck('name')->toArray());

            // Set values in cells
            $sheet->setCellValue('A' . $row, $index + 1);
            $sheet->setCellValue('B' . $row, $documentType);
            $sheet->setCellValue('C' . $row, $documentNumberAndDate);
            $sheet->setCellValue('D' . $row, $task->description);
            $sheet->setCellValue('E' . $row, optional($task->end_date)->format('d.m.Y') ?? '');
            $sheet->setCellValue('F' . $row, $executors);
            $sheet->setCellValue('G' . $row, $status);

            // Apply styles to content rows
            $sheet->getStyle("A{$row}:G{$row}")->applyFromArray([
                'alignment' => ['vertical' => Alignment::VERTICAL_TOP, 'wrapText' => true],
                'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN]]
            ]);

            $row++;
        }

        // Adjust column widths
        foreach (range('A', 'G') as $col) {
            $sheet->getColumnDimension($col)->setAutoSize(true);
        }

        // Create and return the XLSX file
        $fileName = 'tasks_export.xlsx';
        $writer = new Xlsx($spreadsheet);
        $filePath = storage_path("app/public/{$fileName}");
        $writer->save($filePath);

        return Response::download($filePath, $fileName)->deleteFileAfterSend(true);
    }

    /**
     * Convert task status codes to readable labels.
     */
    private function getStatusLabel(array $statuses)
    {
        $statusLabels = [
            'pending' => 'Корилмаган',
            'in_progress' => 'Бажарилмоқда',
            'completed' => 'Бажарилган',
            'rejected' => 'Бажарилмаган',
            'delayed' => 'Муддатидан кеч бажарилган'
        ];

        // Map each status to readable text
        $translatedStatuses = array_map(function ($status) use ($statusLabels) {
            return $statusLabels[$status] ?? 'Номаълум';
        }, $statuses);

        return implode("\n", array_unique($translatedStatuses));
    }
}
