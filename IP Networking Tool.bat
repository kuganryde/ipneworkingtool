@echo off

echo Welcome to the RydeTechWiz IP Networking tool by Kugan Ausuvalingam.

:menu
cls
echo 1. Display IP configuration
echo 2. Ping a device
echo 3. Configure network settings
echo 4. Resolve a domain name
echo 5. Trace the path to a device
echo 6. Display ARP cache
echo 7. Display DNS server information
echo 8. Release IP address
echo 9. Renew IP address
echo 10. Enable/disable network adapter
echo 11. Display network statistics
echo 12. Flush DNS cache
echo 13. Display active TCP connections
echo 14. Exit

set /p choice=Enter your choice: 

if "%choice%"=="1" goto displayip
if "%choice%"=="2" goto pingdevice
if "%choice%"=="3" goto configurenetwork
if "%choice%"=="4" goto resolvedomain
if "%choice%"=="5" goto tracepath
if "%choice%"=="6" goto displayarp
if "%choice%"=="7" goto displaydns
if "%choice%"=="8" goto releaseip
if "%choice%"=="9" goto renewip
if "%choice%"=="10" goto enablenic
if "%choice%"=="11" goto netstats
if "%choice%"=="12" goto flushdns
if "%choice%"=="13" goto activeconnections
if "%choice%"=="14" goto exit

:displayip
ipconfig
pause
goto menu

:pingdevice
set /p ip=Enter the IP address to ping: 
ping %ip%
pause
goto menu

:configurenetwork
netsh
pause
goto menu

:resolvedomain
set /p domain=Enter the domain name to resolve: 
nslookup %domain%
pause
goto menu

:tracepath
set /p ip=Enter the IP address to trace: 
tracert %ip%
pause
goto menu

:displayarp
arp -a
pause
goto menu

:displaydns
netsh interface ip show dns
pause
goto menu

:releaseip
set /p nic=Enter the network adapter name: 
ipconfig /release %nic%
pause
goto menu

:renewip
set /p nic=Enter the network adapter name: 
ipconfig /renew %nic%
pause
goto menu

:enablenic
set /p nic=Enter the network adapter name: 
set /p enable=Enable or disable (e/d): 
if "%enable%"=="e" (
  netsh interface set interface "%nic%" admin=enable
) else (
  netsh interface set interface "%nic%" admin=disable
)
pause
goto menu

:netstats
netstat -e
pause
goto menu

:flushdns
ipconfig /flushdns
pause
goto menu

:activeconnections
netstat -a
pause
goto menu

:exit
echo Thank you for using the RydeTechWiz IP Networking tool by Kugan Ausuvalingam.