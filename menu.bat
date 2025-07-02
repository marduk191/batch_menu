@echo off
setlocal enabledelayedexpansion
color 0A
title Batch File Menu System

:: Set the folder containing your batch files
:: Change this path to your batch files folder
set "BATCH_FOLDER=%~dp0batch_files"

:MAIN_MENU
cls
echo.
echo ========================================
echo        Nothing to see here yet
echo ========================================
echo.

:: Check if batch folder exists
if not exist "%BATCH_FOLDER%" (
    echo Error: Batch folder not found!
    echo Looking for: %BATCH_FOLDER%
    echo.
    echo Please create the folder or update the BATCH_FOLDER variable
    echo in this script to point to your batch files location.
    echo.
    pause
    exit /b
)

:: Count and display batch files
set count=0
echo Available batch files:
echo.

for %%f in ("%BATCH_FOLDER%\*.bat") do (
    set /a count+=1
    set "file!count!=%%f"
    set "name!count!=%%~nf"
    echo !count!. %%~nf
)

if %count%==0 (
    echo No batch files found in: %BATCH_FOLDER%
    echo.
    pause
    exit /b
)

echo.
:: Store the number of batch files before adding menu options
set batch_count=%count%
set /a count+=1
echo %count%. Refresh list
set /a refresh_option=%count%
set /a count+=1
echo %count%. Change folder location
set /a folder_option=%count%
set /a count+=1
echo %count%. Exit
set /a exit_option=%count%
echo.
echo ========================================

set /p choice="Type a selection (1-%count%): "

:: Validate input
if not defined choice goto MAIN_MENU
set choice=%choice: =%
if "%choice%"=="" goto MAIN_MENU

:: Check for non-numeric input
echo %choice%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 goto INVALID_CHOICE

:: Check if choice is within range
if %choice% LSS 1 goto INVALID_CHOICE
if %choice% GTR %count% goto INVALID_CHOICE

:: Handle special menu options
if %choice%==%refresh_option% goto MAIN_MENU
if %choice%==%folder_option% goto CHANGE_FOLDER
if %choice%==%exit_option% goto EXIT

:: Run selected batch file (only if choice is within batch file range)
if %choice% LEQ %batch_count% (
    set selected_file=!file%choice%!
    goto RUN_BATCH
)

:INVALID_CHOICE
echo.
echo Invalid choice! Please enter a number between 1 and %count%.
timeout /t 2 >nul
goto MAIN_MENU

:RUN_BATCH
cls
echo ========================================
echo Running: !name%choice%!
echo File: !selected_file!
echo ========================================
echo.

:: Run the selected batch file
call "!selected_file!"

echo.
echo ========================================
echo Batch file execution completed.
echo ========================================
echo.
echo Press any key to return to menu...
pause >nul
goto MAIN_MENU

:CHANGE_FOLDER
cls
echo ========================================
echo        CHANGE FOLDER LOCATION
echo ========================================
echo.
echo Current folder: %BATCH_FOLDER%
echo.
set /p new_folder="Enter new folder path (or press Enter to cancel): "

if not defined new_folder goto MAIN_MENU
if "%new_folder%"=="" goto MAIN_MENU

:: Remove quotes if present
set new_folder=%new_folder:"=%

:: Check if new folder exists
if not exist "%new_folder%" (
    echo.
    echo Error: Folder does not exist: %new_folder%
    echo.
    pause
    goto CHANGE_FOLDER
)

:: Update the batch folder
set "BATCH_FOLDER=%new_folder%"
echo.
echo Folder updated successfully!
timeout /t 2 >nul
goto MAIN_MENU

:EXIT
cls
echo.
echo Thank you for using Batch File Menu System!
echo.
timeout /t 2 >nul
exit /b

:ERROR
echo An error occurred while running the batch file.
echo.
pause
goto MAIN_MENU