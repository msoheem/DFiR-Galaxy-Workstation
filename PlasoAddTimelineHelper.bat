@echo off
:: Batch script to add a filesystem timeline to an existing Plaso storage
if "%~1"=="" (
    echo Usage: %~nx0 ^<path_to_bodyfile^>
    echo Example: %~nx0 C:\Cases\Analysis\Evidence1\Filesystem\bodyfile.txt
    exit /b 1
)

set "fsBody=%~1"

echo ========================================
echo        Plaso log2timeline Helper
echo         Add Filesystem Timeline
echo ========================================

:: Step 3 - Storage location
set /p storage=Enter path for storage file (.plaso): 

echo.
echo [+] Adding file system timeline ...
C:\ForensicPrograms\plaso-main\venv\Scripts\log2timeline.exe --parsers "mactime" --storage_file "%storage%" "%fsBody%"

echo.
echo [+] Done.
pause