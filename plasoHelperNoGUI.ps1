function Run-Plaso {

    # --- Step 1: Timezone selection ---
    $timezone = Read-Host "Enter timezone (or type 'list' to show all)"
    if ($timezone -eq "list") {
        & log2timeline.exe --timezone list
        $timezone = Read-Host "Enter timezone to use"
    }

    # --- Step 2: Parser selection ---
    $parsers = Read-Host "Enter parsers (default 'win7,!filestat', or type 'list' to show all)"
    if ($parsers -eq "list") {
        & log2timeline.exe --parsers list
        $parsers = Read-Host "Enter parsers (default 'win7,!filestat')"
    }
    if ([string]::IsNullOrWhiteSpace($parsers)) {
        $parsers = "win7,!filestat"
    }

    # --- Step 3: Storage location ---
    $storage = Read-Host "Enter path for storage file (.plaso)"
    if (-not $storage.EndsWith(".plaso")) {
        $storage = "$storage.plaso"
    }

    # --- Step 4: Evidence path ---
    $evidence = Read-Host "Enter evidence path (directory or file)"

    # --- Step 5: File system timeline (body file) ---
    $addFsTimeline = Read-Host "Do you want to add a file system timeline? (y/n)"
    $fsBodyFile = $null
    if ($addFsTimeline -match '^[Yy]') {
        $fsBodyFile = Read-Host "Enter path to body file"
    }

    # --- Step 6: Run psort after parsing ---
    $runPsort = Read-Host "Run psort after parsing? (y/n)"
    $psortTimeFilter = $null
    if ($runPsort -match '^[Yy]') {
        $useTimeRange = Read-Host "Filter with specific time range? (y/n)"
        if ($useTimeRange -match '^[Yy]') {
            $start = Read-Host "Enter start time (YYYY-MM-DD HH:MM:SS)"
            $end = Read-Host "Enter end time (YYYY-MM-DD HH:MM:SS)"
            $psortTimeFilter = "date > '$start' AND date < '$end'"
        }
    }

    # Escape paths safely
    #$storageEsc = '"' + ($storage -replace '\\','\\') + '"'
    #$evidenceEsc = '"' + ($evidence -replace '\\','\\') + '"'

    # --- Build and run log2timeline command ---
    Write-Host "`n[+] Running log2timeline.exe ..."
    $logFile = [System.IO.Path]::ChangeExtension($storage, ".log.gz")
    $cmd = "C:\ForensicPrograms\plaso-main\venv\Scripts\log2timeline.exe --timezone $timezone --parsers $parsers --logfile $logFile --storage_file $storage $evidence"
    Write-Host $cmd -ForegroundColor Yellow
    Invoke-Expression $cmd

    # --- Add file system timeline if requested ---
    if ($fsBodyFile) {
        #$fsBodyEsc = '"' + $fsBodyFile + '"'
        Write-Host "`n[+] Adding file system timeline ..."
        $cmd = "C:\ForensicPrograms\plaso-main\venv\Scripts\log2timeline.exe --parsers 'mactime' --logfile $logFile --storage_file $storage '$fsBodyFile'"
        Write-Host $cmd -ForegroundColor Yellow
        Invoke-Expression $cmd
    }

    # --- Run psort if requested ---
    if ($runPsort -match '^[Yy]') {
        Write-Host "`n[+] Running psort.exe ..."
        $outputCSV = [System.IO.Path]::ChangeExtension($storage, ".csv")
        #$outputEsc = '"' + $outputCSV + '"'
        $cmd = "C:\ForensicPrograms\plaso-main\venv\Scripts\psort.exe --logfile $logFile -o l2tcsv -w $outputCSV $storage $psortTimeFilter"
        Write-Host $cmd -ForegroundColor Yellow
        Invoke-Expression $cmd
        Write-Host "`nResults saved to $outputCSV" -ForegroundColor Green
    }

    Write-Host "`n[+] Done." -ForegroundColor Green
}

# Run it
Run-Plaso
