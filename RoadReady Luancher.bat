@echo off
setlocal EnableExtensions
title RoadReady Launcher

REM ============================================================
REM RoadReady Portable Launcher
REM Expected package layout:
REM
REM RoadReady Beta/
REM   Launch RoadReady.bat
REM   README.txt or README.pdf
REM   RoadReady/                 hidden optional
REM     RoadReady_Engine.html
REM     modules/
REM       wv_driver_module.js
REM ============================================================

cd /d "%~dp0"

set "APP_DIR=RoadReady"
set "ENGINE=%APP_DIR%\RoadReady_Engine.html"
set "MODULE_DIR=%APP_DIR%\modules"

cls
echo ============================================
echo              RoadReady Launcher
echo ============================================
echo.
echo Checking RoadReady package...
echo.

if not exist "%APP_DIR%\" (
    echo [ERROR] RoadReady folder was not found.
    echo.
    echo Expected folder:
    echo %APP_DIR%
    echo.
    echo Make sure you extracted the full RoadReady beta package.
    echo.
    pause
    exit /b 1
)

if not exist "%ENGINE%" (
    echo [ERROR] RoadReady engine was not found.
    echo.
    echo Expected file:
    echo %ENGINE%
    echo.
    echo Make sure RoadReady_Engine.html is inside the RoadReady folder.
    echo.
    pause
    exit /b 1
)

if not exist "%MODULE_DIR%\" (
    echo [ERROR] RoadReady modules folder was not found.
    echo.
    echo Expected folder:
    echo %MODULE_DIR%
    echo.
    pause
    exit /b 1
)

set "MODULE_COUNT=0"
for %%F in ("%MODULE_DIR%\*.js") do (
    set /a MODULE_COUNT+=1
)

if "%MODULE_COUNT%"=="0" (
    echo [ERROR] No RoadReady module was found.
    echo.
    echo Expected at least one .js module file inside:
    echo %MODULE_DIR%
    echo.
    pause
    exit /b 1
)

echo [OK] RoadReady folder found.
echo [OK] Engine found.
echo [OK] Modules folder found.
echo [OK] Module files found: %MODULE_COUNT%
echo.
echo Launching RoadReady...
echo.

start "" "%~dp0%ENGINE%"

exit /b 0
