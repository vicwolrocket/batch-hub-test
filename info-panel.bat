@echo off
Title Cloud Engine Info Panel (made by Hackoo 2017)
mode con cols=80 lines=8
echo( & echo(
echo   Please Wait a While ... Searching for (LAN ,Public)(IP) and MAC addresses ...
Set "LogFile=%~dpn0.txt"
@for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do (
    set "LAN_IP=%%a"
)

for /f "tokens=2 delims=: " %%A in (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do set ExtIP=%%A


@For /f %%a in ('getmac /NH /FO Table') do  (
    @For /f %%b in ('echo %%a') do (
        If /I NOT "%%b"=="N/A" (
            Set "MY_MAC=%%b"
        )
    )
)
    Cls 
    echo(
    echo                Local network IP  : ws://%LAN_IP%:3000/
    echo                Public IP         : ws://%ExtIP%:3000/
)

:pause
pause>nul
goto pause