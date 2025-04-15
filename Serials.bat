@echo off
setlocal

:: Try WMIC first
wmic bios get serialnumber >nul 2>&1
if %errorlevel%==0 (
    for /f "skip=1 tokens=* delims=" %%I in ('wmic bios get serialnumber') do (
        set "serial=%%I"
        goto show
    )
)

:: If WMIC fails, fallback to PowerShell
for /f "delims=" %%I in ('powershell -NoProfile -Command "(Get-CimInstance Win32_BIOS).SerialNumber"') do set "serial=%%I"

:show
echo Serial Number: %serial%
pause