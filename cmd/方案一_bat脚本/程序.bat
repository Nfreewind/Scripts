@echo off
::File                    :   .bat
::Programmer              :   YuCong windmillyucong@163.com
::Description             :   Windows������ű�����ping����
::Modification History	  :   ver1.0, 2017.09.16, William Yu
::                            ver1.1, 2017.09.17, William Yu add notes  
setlocal enabledelayedexpansion
set /a num=0
echo ���Կ�ʼʱ�� %date% %time:~0,2%:%time:~3,2%:%time:~6,2%
echo ���Կ�ʼʱ�� %date% %time:~0,2%:%time:~3,2%:%time:~6,2%>>log.txt  
for /f "delims=" %%a in (��վ�б�.txt) do (
	set /a num+=1 
	echo !num! %%a
	set /p = !num! %%a < nul  >> log.txt 
	ping %%a | find "ƽ��" >> log.txt || echo ��ʱ  >> log.txt
	echo %%a test over.
	echo -----------------------------------------
	)
echo ���Խ���ʱ�� %date% %time:~0,2%:%time:~3,2%:%time:~6,2%
echo ���Խ���ʱ�� %date% %time:~0,2%:%time:~3,2%:%time:~6,2%>>log.txt  
echo ȫ��ִ�н���,�Ѽ�¼��log.txt��
pause