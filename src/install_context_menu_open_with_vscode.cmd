@echo off

set BASEDIR=%~dp0
if "%BASEDIR:~-1%" == "\" set BASEDIR=%BASEDIR:~0,-1%

set action=Edit with VSCode
set command=%BASEDIR%\Code.exe


:: Detect if we have Administrator rights
net session >nul 2>&1
if %errorlevel% == 0 (
	set hkey=HKEY_LOCAL_MACHINE
) else (
	set hkey=HKEY_CURRENT_USER
)

:: File right click
reg.exe add "%hkey%\Software\Classes\*\shell\%action%\command" /ve /t REG_EXPAND_SZ /d "\"%command%\"\"%%1\"" /f
reg.exe add "%hkey%\Software\Classes\*\shell\%action%" /v Icon /t REG_SZ /d "%command%,0" /f


:: Folder right click
reg.exe add "%hkey%\Software\Classes\Directory\shell\%action%\command" /ve /t REG_EXPAND_SZ /d "\"%command%\"\"%%1\"" /f
reg.exe add "%hkey%\Software\Classes\Directory\shell\%action%" /v Icon /t REG_SZ /d "%command%,0" /f


:: Explorer Background right click
reg.exe add "%hkey%\Software\Classes\Directory\Background\shell\%action%\command" /ve /t REG_EXPAND_SZ /d "\"%command%\"\"%%V\"" /f
reg.exe add "%hkey%\Software\Classes\Directory\Background\shell\%action%" /v Icon /t REG_SZ /d "%command%,0" /f
reg.exe add "%hkey%\Software\Classes\Directory\Background\shell\%action%" /v NoWorkingDirectory /t REG_SZ /d "" /f
