@echo off
setlocal

echo Building TokenViewer.exe...
set "CSC=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe"

if not exist "%CSC%" (
    set "CSC=C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe"
)

if not exist "%CSC%" (
    echo Error: C# compiler (csc.exe) not found!
    pause
    exit /b 1
)

"%CSC%" /target:winexe /win32icon:"%~dp0TokenViewer.ico" /out:"%~dp0TokenViewer.exe" "%~dp0TokenViewer.cs"

if %errorlevel%==0 (
    echo.
    echo Build successful: TokenViewer.exe created.
) else (
    echo.
    echo Build failed!
)

endlocal
