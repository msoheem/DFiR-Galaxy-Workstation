@echo off
setlocal enabledelayedexpansion

:: Ask user for Evidence Name
set /p EvidenceName=Enter Current Evidence Name: 

:: Set environment variable (persistent)
setx EvidenceName "%EvidenceName%"

:: Define base path
set BasePath=C:\Cases\Analysis

:: Create main Evidence folder
mkdir "%BasePath%\%EvidenceName%"

:: Create subfolders
mkdir "%BasePath%\%EvidenceName%\EventLog"
mkdir "%BasePath%\%EvidenceName%\Filesystem"
mkdir "%BasePath%\%EvidenceName%\FileFolderAccess"
mkdir "%BasePath%\%EvidenceName%\ProgramExecution"
mkdir "%BasePath%\%EvidenceName%\Registry"
mkdir "%BasePath%\%EvidenceName%\SRUMDatabase"
mkdir "%BasePath%\%EvidenceName%\FileDetetion"
mkdir "%BasePath%\%EvidenceName%\RDPBitmap"
mkdir "%BasePath%\%EvidenceName%\Kape"
mkdir "%BasePath%\%EvidenceName%\Supertimeline"

echo.
echo Evidence folder and subfolders created successfully at:
echo %BasePath%\%EvidenceName%
echo EvidenceName environment variable set to: %EvidenceName%

pause