:: (c) 2026 L702x
:: Licensed under AGPLv3

@echo off
:main
cls
title Lie detector
echo +===================================+
echo ^| Lie detector 3000                 ^|
echo ^|                                   ^|
echo +===================================+
set /p username=^| username ~^> 
cls
goto result

:result
set /a raw=(%RANDOM% %% 1501) + 8500
set /a whole=%raw% / 100
set /a decimal=%raw% %% 100
if %decimal% LSS 10 set decimal=0%decimal%

set "line1=%username% is lying"
set "line2=Confidence: %whole%.%decimal%%%"

call :padline "%line1%" line1pad
call :padline "%line2%" line2pad

echo +===================================+
echo ^| Lie detector 3000                 ^|
echo ^|                                   ^|
echo ^| %line1pad%^|
echo ^| %line2pad%^|
echo +===================================+
pause >nul
goto :eof

:padline
setlocal enabledelayedexpansion
set "str=%~1"
set "out=!str!"
:padloop
if "!out:~34!" == "" (
    set "out=!out! "
    if not "!out:~34!" == "" goto :paddone
    goto padloop
)
:paddone
set "out=!out:~0,34!"
endlocal & set "%2=%out%"
goto :eof