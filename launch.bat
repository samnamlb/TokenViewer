@echo off
:: ============================================================
:: TokenViewer Launcher
:: Opens TokenViewer in Chrome/Edge app mode (no browser chrome)
:: Falls back to default browser if neither is found
:: ============================================================

set "APP_PATH=%~dp0TokenViewer.html"
set "APP_URL=file:///%APP_PATH:\=/%"

:: Try Microsoft Edge first (pre-installed on Windows 10/11)
where msedge >nul 2>nul
if %errorlevel%==0 (
    start "" msedge --app="%APP_URL%" --window-size=1200,800
    exit /b
)

:: Try Chrome
where chrome >nul 2>nul
if %errorlevel%==0 (
    start "" chrome --app="%APP_URL%" --window-size=1200,800
    exit /b
)

:: Check common Edge install path
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" --app="%APP_URL%" --window-size=1200,800
    exit /b
)

if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" --app="%APP_URL%" --window-size=1200,800
    exit /b
)

:: Check common Chrome install path
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" --app="%APP_URL%" --window-size=1200,800
    exit /b
)

if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" --app="%APP_URL%" --window-size=1200,800
    exit /b
)

:: Fallback: open in default browser
start "" "%APP_PATH%"
