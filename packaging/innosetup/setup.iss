; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Glassomium"
#define MyAppVersion "0.3"
#define MyAppPublisher "Piero Toffanin"
#define MyAppURL "http://www.glassomium.org"
#define MyAppExeName "Launcher.bat"
#define MyFolderName "C:\Users\piero\Desktop\glassomium"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{4CF3B569-044E-4F77-AFD2-64C6E75B30BC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile={#MyFolderName}\build\dist\LICENSE.txt
OutputDir={#MyFolderName}\packaging\innosetup\output
OutputBaseFilename=setup
;SetupIconFile={#MyFolderName}\src\icon.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MyFolderName}\build\dist\*"; DestDir: "{userappdata}\{#MyAppName}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#MyFolderName}\packaging\innosetup\dependencies\rubyinstaller-1.9.3-p194.exe"; DestDir: "{tmp}"
Source: "{#MyFolderName}\packaging\innosetup\dependencies\vcredist_x86.exe"; DestDir: "{tmp}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppExeName}"; Filename: "{userappdata}\{#MyAppName}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppExeName}"; Filename: "{userappdata}\{#MyAppName}\{#MyAppExeName}"; Tasks: desktopicon

[Run] 
Filename: "{tmp}\rubyinstaller-1.9.3-p194.exe"; Parameters: "/silent /dir=""c:\ruby193"" /tasks=""assocfiles,modpath"""
Filename: "{tmp}\vcredist_x86.exe"; Parameters: "/passive /norestart"


