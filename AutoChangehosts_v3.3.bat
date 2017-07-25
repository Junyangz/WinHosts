@echo off
rem mode con lines=40 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
rem color 2f
color 2f
echo.----------------------------------------------------------- 
echo.如有360、电脑管家等安全软件提醒，请勾选允许和不再提醒！
echo.
echo.执行该命令 您的hosts将被自动替换,原hosts将会自动备份为hosts.bak！
echo.如您原先的hosts有自己修改过的信息，请自行手动修改！
echo.推荐使用网络版hosts可以保证最新时效(前提是你能正常访问Github)。
echo.
echo.IPv6-hosts更新地址：
echo. https://raw.githubusercontent.com/lennylxx/ipv6-hosts/master/hosts 
echo.
echo.IPv4-hosts更新地址：
echo. https://raw.githubusercontent.com/racaljk/hosts/master/hosts
echo. https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts
echo. 
echo.-----------------------------------------------------------
echo.请选择使用：
echo.
echo. 1.使用IPv6-hosts（即在下面输入1）
echo.
echo. 2.使用IPv4-hosts（即在下面输入2）
echo.
echo. 3.使用网络版IPv6-hosts(最新可用hosts,需要网络下载,请输入3）
echo.
echo. 4.使用网络版IPv4-hosts(最新可用hosts,需要网络下载,请输入4）
echo.
echo. 5.恢复初始hosts（即在下面输入5）
echo.
echo. 6.退出（即在下面输入6）
echo.-----------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=请输入数字并按回车键确认:

echo.
if %choice%==1 goto hostDNS6
if %choice%==2 goto hostDNS4
if %choice%==3 goto NetworkHosts6
if %choice%==4 goto NetworkHosts4
if %choice%==5 goto CL
if %choice%==6 goto end
cls
"set choice="
echo 您输入有误，请重新选择。
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 123456 /n /m "请输入相应数字："
if errorlevel 6 goto end
if errorlevel 5 goto CL
if errorlevel 4 goto NetworkHosts4
if errorlevel 3 goto NetworkHosts6
if errorlevel 2 goto hostDNS4
if errorlevel 1 goto hostDNS6
cls
goto main

:hostDNS6
cls
color 0a
copy /y "%SystemRoot%\System32\drivers\etc\hosts" "%SystemRoot%\System32\drivers\etc\hosts.bak"
copy /y "hosts.v6" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
goto mes

:hostDNS4
cls
color 0a
copy /y "%SystemRoot%\System32\drivers\etc\hosts" "%SystemRoot%\System32\drivers\etc\hosts.bak"
copy /y "hosts.v4" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
goto mes
:NetworkHosts4
cls
color 0c
curl -o hosts https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts
cacls hosts /C /E /T /G everyone:F
copy /y "%SystemRoot%\System32\drivers\etc\hosts" "%SystemRoot%\System32\drivers\etc\hosts.bak"
move /y "hosts" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
goto mes

:NetworkHosts6
cls
color 0c
curl -o hosts https://raw.githubusercontent.com/lennylxx/ipv6-hosts/master/hosts
cacls hosts /C /E /T /G everyone:F
copy /y "%SystemRoot%\System32\drivers\etc\hosts" "%SystemRoot%\System32\drivers\etc\hosts.bak"
move /y "hosts" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
goto mes

:CL
cls
color 0a
if exist "%SystemRoot%\System32\drivers\etc\hosts.bak" goto restorebackup
echo ::1 localhost > %SystemRoot%\System32\drivers\etc\hosts 
echo 恭喜您，hosts恢复初始成功!
echo.
goto end
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:restorebackup
move /y "%SystemRoot%\System32\drivers\etc\hosts.bak" "%SystemRoot%\System32\drivers\etc\hosts"
echo 恭喜您，hosts恢复初始成功!
echo.
goto end

:mes
echo.-----------------------------------------------------------
echo.
echo 覆盖本地hosts并刷新本地DNS解析缓存成功!
echo.
echo 现在去打开https://www.google.com试试吧(推荐使用Chrome内核浏览器)！
echo.
echo.记得使用https进行加密访问！-http可能无法访问
echo.
echo.即：https://www.google.com
echo.
echo.或者：https://www.google.com/ncr
echo.      https://www.google.com.hk/ncr
echo.
goto end

:end
echo.-----------------------------------------------------------
echo.Copyright (c) Sunrisey
echo.
echo 即将自动退出。。。
ping -n 5 127.0>nul