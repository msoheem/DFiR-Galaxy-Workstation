@echo off
:: Launcher for RunPsort.ps1
:: If you want to launch the one with no GUI just change %~dp0plasoHelper.ps1 to %~dp0plasoHelperNoGUI.ps1
powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0plasoHelper.ps1"' -Verb RunAs"