@echo off
rem mode con lines=40 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
rem color 2f
color 2f
echo.----------------------------------------------------------- 
echo.����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ����Ͳ������ѣ�
echo.
echo.ִ�и����� ����hosts�����Զ��滻,ԭhosts�����Զ�����Ϊhosts.bak��
echo.����ԭ�ȵ�hosts���Լ��޸Ĺ�����Ϣ���������ֶ��޸ģ�
echo.�Ƽ�ʹ�������hosts���Ա�֤����ʱЧ(ǰ����������������Github)��
echo.
echo.IPv6-hosts���µ�ַ��
echo. https://raw.githubusercontent.com/lennylxx/ipv6-hosts/master/hosts 
echo.
echo.IPv4-hosts���µ�ַ��
echo. https://raw.githubusercontent.com/racaljk/hosts/master/hosts
echo. https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts
echo. 
echo.-----------------------------------------------------------
echo.��ѡ��ʹ�ã�
echo.
echo. 1.ʹ��IPv6-hosts��������������1��
echo.
echo. 2.ʹ��IPv4-hosts��������������2��
echo.
echo. 3.ʹ�������IPv6-hosts(���¿���hosts,��Ҫ��������,������3��
echo.
echo. 4.ʹ�������IPv4-hosts(���¿���hosts,��Ҫ��������,������4��
echo.
echo. 5.�ָ���ʼhosts��������������5��
echo.
echo. 6.�˳���������������6��
echo.-----------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=���������ֲ����س���ȷ��:

echo.
if %choice%==1 goto hostDNS6
if %choice%==2 goto hostDNS4
if %choice%==3 goto NetworkHosts6
if %choice%==4 goto NetworkHosts4
if %choice%==5 goto CL
if %choice%==6 goto end
cls
"set choice="
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 123456 /n /m "��������Ӧ���֣�"
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
echo ��ϲ����hosts�ָ���ʼ�ɹ�!
echo.
goto end
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:restorebackup
move /y "%SystemRoot%\System32\drivers\etc\hosts.bak" "%SystemRoot%\System32\drivers\etc\hosts"
echo ��ϲ����hosts�ָ���ʼ�ɹ�!
echo.
goto end

:mes
echo.-----------------------------------------------------------
echo.
echo ���Ǳ���hosts��ˢ�±���DNS��������ɹ�!
echo.
echo ����ȥ��https://www.google.com���԰�(�Ƽ�ʹ��Chrome�ں������)��
echo.
echo.�ǵ�ʹ��https���м��ܷ��ʣ�-http�����޷�����
echo.
echo.����https://www.google.com
echo.
echo.���ߣ�https://www.google.com/ncr
echo.      https://www.google.com.hk/ncr
echo.
goto end

:end
echo.-----------------------------------------------------------
echo.Copyright (c) Sunrisey
echo.
echo �����Զ��˳�������
ping -n 5 127.0>nul