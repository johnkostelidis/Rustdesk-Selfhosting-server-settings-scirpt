@echo off
setlocal enabledelayedexpansion

echo Hello to Rustdesk selfhosting server configuration script
echo.
echo.
echo.

set /p "SERVER= Please wright the IP/Domain of your server:"
set /p "RELAY_SERVER= Please wright the IP/Domain of your relay server"
set /p "KEY= Please wright the public key of your server"


REM === Paths ===
set "CONFIG=%APPDATA%\RustDesk\config\RustDesk2.toml"
set "TEMP_FILE=%CONFIG%.tmp"

echo Updating RustDesk config...

REM Flags για να δουμε τι βρηκαμε
set "FOUND_RENDEZVOUS=0"
set "FOUND_CUSTOM=0"
set "FOUND_RELAY=0"
set "FOUND_KEY=0"
set "FIRST_RENDEZVOUS=1"
set "FIRST_CUSTOM=1"

REM Αντικατασταση γραμμων
(
for /f "usebackq delims=" %%a in ("%CONFIG%") do (
    set "line=%%a"
    
    REM Πρώτη εμφάνιση rendezvous-server (πάνω κομμάτι)
    if "!line:~0,17!"=="rendezvous-server" (
        if !FIRST_RENDEZVOUS!==1 (
            echo rendezvous-server = "%SERVER%"
            set "FOUND_RENDEZVOUS=1"
            set "FIRST_RENDEZVOUS=0"
        ) else (
            echo !line!
        )
    ) else if "!line:~0,24!"=="custom-rendezvous-server" (
        REM Πρώτη εμφάνιση custom-rendezvous-server (κάτω κομμάτι)
        if !FIRST_CUSTOM!==1 (
            echo custom-rendezvous-server = "%SERVER%"
            set "FOUND_CUSTOM=1"
            set "FIRST_CUSTOM=0"
        ) else (
            echo !line!
        )
    ) else if "!line:~0,12!"=="relay-server" (
        echo relay-server = "%RELAY_SERVER%"
        set "FOUND_RELAY=1"
    ) else if "!line:~0,3!"=="key" (
        echo key = "%KEY%"
        set "FOUND_KEY=1"
    ) else (
        echo !line!
    )
)

REM Προσθεση γραμμων που δεν υπηρχαν
if !FOUND_RENDEZVOUS!==0 echo rendezvous-server = "%SERVER%"
if !FOUND_CUSTOM!==0 echo custom-rendezvous-server = "%SERVER%"
if !FOUND_RELAY!==0 echo relay-server = "%RELAY_SERVER%"
if !FOUND_KEY!==0 echo key = "%KEY%"

) > "%TEMP_FILE%"

REM Αντικατασταση αρχειου
move "%TEMP_FILE%" "%CONFIG%" >nul

echo Done! Restart RustDesk.
pause