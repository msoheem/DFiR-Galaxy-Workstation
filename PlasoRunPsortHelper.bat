@echo off
:: Launcher for RunPsort.ps1

if "%~1"=="" (
    echo Usage: %~nx0 ^<path_to_storage.plaso^>
    echo Example: %~nx0 C:\Cases\Analysis\Evidence1\Filesystem\case1.plaso
    exit /b 1
)

:: Run the PowerShell script
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0PlasoRunPsortHelper.ps1" -Storage "%~1"
