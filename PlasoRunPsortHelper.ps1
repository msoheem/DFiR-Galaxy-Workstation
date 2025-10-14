# Plaso log2timeline Helper - Run with Psort (PowerShell Version)

param (
    [Parameter(Mandatory = $true)]
    [string]$Storage
)

Write-Host "========================================"
Write-Host "       Plaso log2timeline Helper"
Write-Host "            Run with Psort"
Write-Host "========================================"

# Ask for time range filtering
$useRange = Read-Host "Filter with specific time range? (y/n)"

if ($useRange -ieq "y") {
    $start = Read-Host "Enter start time (YYYY-MM-DD HH:MM:SS)"
    $end   = Read-Host "Enter end time (YYYY-MM-DD HH:MM:SS)"
    $slice = "date > '$start' AND date < '$end'"
} else {
    $slice = ""
}

# Build output CSV path
$outputCSV = [System.IO.Path]::ChangeExtension($Storage, "Filtered.csv")
$logFile = [System.IO.Path]::ChangeExtension($Storage, ".log.gz")
Write-Host "`n[+] Running psort.exe ..."
# Run psort
& C:\ForensicPrograms\plaso-main\venv\Scripts\psort.exe -o l2tcsv --logfile $logFile -w "$outputCSV" "$Storage" $slice

Write-Host "Results saved to $outputCSV"
Write-Host "`n[+] Done."
Pause
