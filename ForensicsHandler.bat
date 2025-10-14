@echo off
setlocal enabledelayedexpansion

set "file=%~1"
set "ext=%~x1"

echo ==============================
echo  Forensics Handler
echo  File: %file%
echo  Type: %ext%
echo ==============================

:: Handle Prefetch files (*.pf)
if /i "%ext%"==".pf" (
    echo [*] Detected Prefetch file
    "C:\ForensicPrograms\EZTools\PECmd.exe" -f "%file%"
    goto :end
)

:: Handle Prefetch files (*.lnk)
if /i "%ext%"==".lnk" (
    echo [*] Detected lnk file
    "C:\ForensicPrograms\EZTools\leCmd.exe" -f "%file%"
    goto :end
)

:: Handle Jump List files (*.automaticDestinations-ms)
if /i "%ext%"==".automaticDestinations-ms" (
    echo [*] Detected Jump List file
    "C:\ForensicPrograms\EZTools\JLECmd.exe" -f "%file%"
    goto :end
)

:: Handle Jump List files (*.customDestinations-ms)
if /i "%ext%"==".customDestinations-ms" (
    echo [*] Detected Jump List file
    "C:\ForensicPrograms\EZTools\JLECmd.exe" -f "%file%"
    goto :end
)

:: Handle SRUM database files (*.srudb)
if /i "%ext%"==".srudb" (
    echo [*] Detected SRUM database
    "C:\ForensicPrograms\EZTools\SRUMECmd.exe" -f "%file%"
    goto :end
)

:: Handle Amcache hive (*.hve)
if /i "%ext%"==".hve" (
    echo [*] Detected Amcache Hive
    "C:\ForensicPrograms\EZTools\AmcacheParser.exe" -f "%file%"
    goto :end
)

:: Default case
echo [!] Unsupported file type: %ext%
echo You may need to add support in ForensicsHandler.bat

:end
echo.
pause
