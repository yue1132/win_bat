@echo off
rem //���ñ��� 
REM set NAME="��̫��"
set NAME="WLAN"
rem //��������ֵ���Ը�����Ҫ����
set ADDR=192.168.100.114
set MASK=255.255.252.0
set GATEWAY=192.168.103.254
set DNS1=223.5.5.5
set DNS2=223.6.6.6
rem //������������ΪIP��ַ���������롢���ء���ѡDNS������DNS


echo ��ǰ���ò����У�
echo 1 ����Ϊ��̬IP
echo 2 ����Ϊ��̬IP
echo 3 �˳�
echo ��ѡ���س���
set /p operate=
if %operate%==1 goto 1
if %operate%==2 goto 2
if %operate%==3 goto 3


:1
echo �������þ�̬IP�����Ե�...
rem //���Ը��������Ҫ���� 
echo IP��ַ = %ADDR%
echo ���� = %MASK%
echo ���� = %GATEWAY%
netsh interface ipv4 set address %NAME% static %ADDR% %MASK% %GATEWAY% 
echo ��ѡDNS = %DNS1% 
netsh interface ipv4 set dns %NAME% static %DNS1%
echo ����DNS = %DNS2% 
if "%DNS2%"=="" (echo DNS2Ϊ��) else (netsh interface ipv4 add dns %NAME% %DNS2%) 
echo ��̬IP�����ã�
pause
goto 3


:2
echo �������ö�̬IP�����Ե�...
echo ���ڴ�DHCP�Զ���ȡIP��ַ...
netsh interface ip set address %NAME% dhcp
echo ���ڴ�DHCP�Զ���ȡDNS��ַ...
netsh interface ip set dns %NAME% dhcp 
echo ��̬IP�����ã�
pause
goto 3


:3
exit
