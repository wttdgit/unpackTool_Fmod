@echo off
setlocal enabledelayedexpansion
title batch convert fsb to wav
for /r .\input\ %%i in (*.snd *.igz *.fsb) do (
	set output=%%~dpni
	set output=!output:input=output!
	echo !output!
	if not exist "!output!" mkdir "!output!"
	".\tools\fsb_aud_extr.exe" "%%~i"
	move ".\*.wav" "!output!"
)
echo.
echo ## done. ###
pause