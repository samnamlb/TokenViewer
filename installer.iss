; ============================================================
; Inno Setup Script for TokenViewer
; Compiles TokenViewer-Setup.exe installer
; ============================================================

#define MyAppName "TokenViewer"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "TokenViewer Project"
#define MyAppURL "https://github.com/samnamlb/TokenViewer"
#define MyAppExeName "TokenViewer.exe"

[Setup]
AppId={{E1B4A5C2-91D7-49F1-A8D6-3A19C1D94B82}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir=dist
OutputBaseFilename=TokenViewer-Setup-{#MyAppVersion}
SetupIconFile=TokenViewer.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "TokenViewer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "index.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "TokenViewer.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "TokenViewer.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "manifest.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "sw.js"; DestDir: "{app}"; Flags: ignoreversion
Source: "icon-192.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "icon-512.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "launch.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\TokenViewer.ico"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\TokenViewer.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
