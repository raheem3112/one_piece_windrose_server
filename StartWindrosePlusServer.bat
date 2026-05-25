@echo off
setlocal

set "GAMEDIR=%~dp0"
if "%GAMEDIR:~-1%"=="\" set "GAMEDIR=%GAMEDIR:~0,-1%"

set "WP_BUILD=%GAMEDIR%\windrose_plus\tools\WindrosePlus-BuildPak.ps1"

if not exist "%WP_BUILD%" (
    echo [WindrosePlus] Installer not complete. Run install.ps1 first.
    if not "%WP_NOPAUSE%"=="1" pause
    exit /b 1
)

echo [WindrosePlus] Checking config overrides...
where pwsh >nul 2>&1
if %ERRORLEVEL%==0 (
    pwsh -NoProfile -NonInteractive -ExecutionPolicy Bypass ^
      -File "%WP_BUILD%" ^
      -ServerDir "%GAMEDIR%" ^
      -RemoveStalePak
) else (
    powershell -NoProfile -NonInteractive -ExecutionPolicy Bypass ^
      -File "%WP_BUILD%" ^
      -ServerDir "%GAMEDIR%" ^
      -RemoveStalePak
)
set "BUILD_EXIT=%ERRORLEVEL%"

if not "%BUILD_EXIT%"=="0" (
    echo.
    echo [WindrosePlus] Config build failed (exit %BUILD_EXIT%^).
    echo Not launching server. Fix the error above and try again.
    if not "%WP_NOPAUSE%"=="1" pause
    exit /b %BUILD_EXIT%
)

echo.
echo [WindrosePlus] Starting Windrose server...
pushd "%GAMEDIR%"
"%GAMEDIR%\WindroseServer.exe" %*
set "SERVER_EXIT=%ERRORLEVEL%"
popd

endlocal & exit /b %SERVER_EXIT%