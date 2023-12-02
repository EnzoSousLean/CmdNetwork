@setlocal DisableDelayedExpansion
@echo off

:MainMenu 
title Main Menu
cls

echo:
echo:
echo:       ______________________________________________________________
echo:
echo:             [1] FireWall 
echo:
echo:             [2] IPconfig
echo:
echo:             [3] Ping 
echo:
echo:             [9] Close
echo:
echo:       ______________________________________________________________
echo:
echo:		Enter a menu option in the Keyboard [1,2,3,9] :
choice /C:123456789 /N
set _erl=%errorlevel%

if %_erl%==1 setlocal & call :FireWall
if %_erl%==2 setlocal & call :IPconfig
if %_erl%==3 setlocal & call :Ping
if %_erl%==9 setlocal & call :exit

::========================================================================================================================================

:FireWall
title FireWall Menu
cls 

echo:
echo:
echo:       ______________________________________________________________
echo:
echo:             [1] FireWall Activation 
echo:
echo:             [2] FireWall Desactivation 
echo:
echo:             [3] Allow ICMP Request 
echo:
echo:             [4] Not Allow ICMP Request 
echo:
echo:             [9] Main Menu
echo:
echo:       ______________________________________________________________
echo:
echo:		Enter a menu option in the Keyboard [1,2,3,4,9] :
choice /C:123456789 /N
set _erl=%errorlevel%

if %_erl%==1 setlocal & call :FireWallActivationAll
if %_erl%==2 setlocal & call :FireWallDesactivationAll
if %_erl%==3 setlocal & call :FirewallActivationICMP
if %_erl%==4 setlocal & call :FireWallDesactivationICMP
if %_erl%==9 setlocal & call :MainMenu

::=================

:FireWallActivationAll

cls

echo: Activation of the FireWall

netsh advfirewall set allprofiles state on

echo: The FireWall was bean Activated

pause

goto :FireWall

::=================

:FireWallDesactivationAll

cls

echo The FireWall we Going to be desactivated

netsh advfirewall set allprofiles state off

echo The FireWall was desactivated

pause

goto :FireWall 

::=================

:FirewallActivationICMP

cls 

echo The ICMP Request We Going Allow....

netsh advfirewall firewall add rule name="Allow ICMP Echo Request" protocol=icmpv4:8,any dir=in action=allow

echo The ICMP Request Was Been Allow 

pause

goto :FireWall 

::=================

:FireWallDesactivationICMP

cls 

echo The ICMP Request We Going Deny....

netsh advfirewall firewall add rule name="Block ICMP Echo Request" protocol=icmpv4:8,any dir=in action=block

echo The ICMP Request Was Been Deny

pause

goto :FireWall

::========================================================================================================================================

:IPconfig
title "ipconfig Menu"
cls 

echo:
echo:
echo:       ______________________________________________________________
echo:
echo:             [1] ipconfig
echo:
echo:             [2] ipconfig /all
echo:
echo:             [3] DHCP Release
echo:
echo:             [4] DHCP Renew
echo:
echo:             [9] Main Menu
echo:
echo:       ______________________________________________________________
echo:
echo:		Enter a menu option in the Keyboard [1,2,3,4,9] :
choice /C:123456789 /N
set _erl=%errorlevel%

if %_erl%==1 setlocal & call :IPconf1
if %_erl%==2 setlocal & call :IPconf2
if %_erl%==3 setlocal & call :IPconf3
if %_erl%==4 setlocal & call :IPconf4
if %_erl%==9 setlocal & call :MainMenu

::=================

:IPconf1

cls 

echo ipconfig still starting......

ipconfig /all

pause 

goto :IPconfig


::=================

:IPconf2

cls 

echo ipconfig still starting......

ipconfig /all

pause 

goto :IPconfig

::=================

:IPconf3

cls

echo DHCP Release still starting......

ipconfig /release

pause 

goto :IPconfig

::=================

:IPconf3

cls

echo DHCP Renew still starting......

ipconfig /renew

pause 

goto :IPconfig

::========================================================================================================================================

:Ping 

cls 

set /p IP="Address IP : "

echo Ping in progress......

ping %IP%

echo Ping Done !

Pause 

goto :MainMenu

::========================================================================================================================================

:exit 

exit 


:: Code By Enzo_Sous_Lean
:: https://github.com/Enzo_Sous_Lean