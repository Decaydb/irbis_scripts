@echo off
chcp 1251>nul

:: BACKUP IRBIS

set IRBIS_PATH=C:\IRBIS_SERVER\IRBIS64
set BACKUP_PATH=D:\IRBIS\Backup
set LOG_PATH=D:\IRBIS\Backup\log
set NOW=%DATE:~-4%_%DATE:~3,2%_%DATE:~0,2%
set db1=IKNBU
set db2=RDR
set db3=SKS05
set db4=ACTORS
set db5=ARCH
set db6=ATHRA
set db7=ATHRC
set db8=ATHRB
set db9=ATHRG


:: Создаём папку для новой резервной копии                                            `
mkdir %BACKUP_PATH%\%NOW%


:: Создание временного ini для запуска пакетного задания
copy /y %IRBIS_PATH%\irbisa_backup_template.ini %IRBIS_PATH%\irbisa_back.ini > nul
echo %temp%\tmpback.ibf >> %IRBIS_PATH%\irbisa_back.ini

:: Создание временного пакетного задания
:: Экспорт первой базы
echo OpenDB %db1% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db1%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

:: Запускаем бэкап
irbisa.exe irbisa_back.ini

:: Экспорт второй базы
echo OpenDB %db2% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db2%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

:: Запускаем бэкап
irbisa.exe irbisa_back.ini

:: Экспорт третьей базы
echo OpenDB %db3% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db3%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf


cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Экспорт четвёртой базы
echo OpenDB %db4% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db4%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Экспорт пятой базы
echo OpenDB %db5% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db5%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Экспорт шестой базы
echo OpenDB %db6% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db6%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Экспорт седьмой базы
echo OpenDB %db7% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db7%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Экспорт восьмой базы
echo OpenDB %db8% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db8%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Экспорт девятой базы
echo OpenDB %db9% > %temp%\tmpback.ibf
echo ExportDB 0,,1,2,%BACKUP_PATH%\%NOW%\%db9%.txt >> %temp%\tmpback.ibf
echo CloseDB >> %temp%\tmpback.ibf
echo Exit %LOG_PATH%\%NOW%.log >> %temp%\tmpback.ibf

cd /d %IRBIS_PATH%

irbisa.exe irbisa_back.ini

:: Удаляем временный ini
del /Q %IRBIS_PATH%\irbisa_back.ini

exit
