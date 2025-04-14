@echo off
:: Check if PowerShell is available
where powershell >nul 2>&1
if errorlevel 1 (
    echo PowerShell is not available on this system.
    exit /b 1
)

:: Retrieve the serial number using PowerShell
for /f "delims=" %%S in ('powershell -NoProfile -Command "Get-CimInstance -ClassName Win32_BIOS | Select-Object -ExpandProperty SerialNumber"') do (
    set "SerialNumber=%%S"
)

:: Display the serial number
echo Serial Number: 
echo %SerialNumber%
pause
