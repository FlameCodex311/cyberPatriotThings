@echo off
mode con: cols=197 lines=78
color 6
echo Initializing...
set mypath=%cd%
IF NOT EXIST C:\Temp\systemInfo mkdir C:\Temp\systemInfo
IF NOT EXIST C:\Temp\scripts mkdir C:\Temp\scripts
IF NOT EXIST C:\Temp\mediaFiles mkdir C:\Temp\mediaFiles
IF NOT EXIST C:\Temp\Downloads mkdir C:\Temp\Downloads
copy FlameScript.cmd C:\Temp\scripts\FlameScript.cmd > nul
copy "%cd%\res\DotNetVersions.exe" C:\Temp\scripts\DotNetVersions.exe > nul
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
IF NOT EXIST C:\Temp\mediaFiles\mp4.txt echo [File Created at %time%] > C:\Temp\mediaFiles\mp4.txt
IF NOT EXIST C:\Temp\mediaFiles\mov.txt echo [File Created at %time%] > C:\Temp\mediaFiles\mov.txt
IF NOT EXIST C:\Temp\mediaFiles\png.txt echo [File Created at %time%] > C:\Temp\mediaFiles\png.txt
IF NOT EXIST C:\Temp\mediaFiles\jpg.txt echo [File Created at %time%] > C:\Temp\mediaFiles\jpg.txt
IF NOT EXIST C:\Temp\mediaFiles\mp3.txt echo [File Created at %time%] > C:\Temp\mediaFiles\mp3.txt
IF NOT EXIST C:\Temp\mediaFiles\wav.txt echo [File Created at %time%] > C:\Temp\mediaFiles\wav.txt
IF NOT EXIST C:\Temp\mediaFiles\txt.txt echo [File Created at %time%] > C:\Temp\mediaFiles\txt.txt
IF NOT EXIST C:\Temp\mediaFiles\docx.txt echo [File Created at %time%] > C:\Temp\mediaFiles\docx.txt
IF NOT EXIST C:\Temp\mediaFiles\zip.txt echo [File Created at %time%] > C:\Temp\mediaFiles\zip.txt
IF NOT EXIST C:\Temp\mediaFiles\rar.txt echo [File Created at %time%] > C:\Temp\mediaFiles\rar.txt
IF NOT EXIST C:\Temp\mediaFiles\7z.txt echo [File Created at %time%] > C:\Temp\mediaFiles\7z.txt
IF NOT EXIST C:\Temp\hashes.txt echo [File Created at %time%] > C:\Temp\hashes.txt
echo [LOG START] > C:\Temp\Log.txt
bitsadmin /transfer updateCheck /download /priority normal https://raw.githubusercontent.com/FlameCodex311/FlameCodex311.github.io/master/version.ini C:\Temp\Downloads\version.ini > nul
fc version.ini "C:\Temp\Downloads\version.ini" > nul
IF errorLevel 1 (
echo [WARN] Client out of date! >> C:\Temp\Log.txt
color 4
echo ----------------------------------
echo Application version out of date!!!
echo ----------------------------------
pause
) ELSE (
echo Client up-to date. >> C:\Temp\Log.txt
color a
echo -------------------------------
echo Application version up-to date!
echo -------------------------------
pause
)
color B
cls
echo 
echo ,------,--.                           ,---.            ,--.       ,--.
echo ^|  .---^|  ^|,--,--,--,--,--.,---.     '   .-' ,---,--.--`--',---.,-'  '-.
echo ^|  `--,^|  ' ,-.  ^|        ^| .-. :    `.  `-.^| .--^|  .--,--^| .-. '-.  .-'
echo ^|  ^|`  ^|  \ '-'  ^|  ^|  ^|  \   --.    .-'    \ `--^|  ^|  ^|  ^| '-' ' ^|  ^|
echo `--'   `--'`--`--`--`--`--'`----'    `-----' `---`--'  `--^|  ^|-'  `--'
echo                                                           `--'       
echo -----------------------------
echo V0.2-alpha, By Cyber Team A ^|
echo -----------------------------
echo.
echo The Working Directory Is %CD%
echo.
echo Press any key
pause > nul
:MENU
cls
echo.
echo ------------------------------------
echo Press a button to select your task.^|
echo ------------------------------------
echo.
echo -------------------------------------------
echo 1 - Display System Info                   ^|
echo 2 - Display Developement Tools Installed  ^|
echo 3 - Display Network Information           ^|
echo 4 - Display Network Stream*               ^|
echo 5 - Toggle Firewall For All Users*        ^|
echo 6 - Start A Command Prompt                ^|
echo 7 - Display Disk Operations*              ^|
echo 8 - Cleanup C:\Temp                       ^|
echo 9 - Set password policy                   ^|
echo R - Resources                             ^|
echo S - SSH Terminal                          ^|
echo H - Generate a files hash                 ^| 
echo 0 - Exit                                  ^|
echo -------------------------------------------
echo.
echo (* Means Requires Admin)
echo.
set /P M=Make a selection, then press ENTER: 
IF %M%==1 GOTO SYS
IF %M%==2 GOTO DEV
IF %M%==3 GOTO NET
IF %M%==4 GOTO STREAM
IF %M%==5 GOTO FIRE
IF %M%==6 GOTO CMD
IF %M%==7 GOTO HDD
IF %M%==8 GOTO CLEAN
IF %M%==9 GOTO PASSWD
IF %M%==R GOTO RES
IF %M%==r GOTO RES
IF %M%==S GOTO SSH
IF %M%==s GOTO SSH
IF %M%==H GOTO HASH
IF %M%==h GOTO HASH
IF %M%==0 GOTO EXIT
GOTO ERROR
:SYS
cls
echo Got system info at %time% >> C:\Temp\Log.txt
systeminfo | more
echo ########################################################################################
net user 
echo ########################################################################################
wmic BASEBOARD get manufacturer,product,model > C:\Temp\systemInfo\Motherboard.txt
wmic BIOS get manufacturer,name,version > C:\Temp\systemInfo\BIOS.txt
wmic COMPUTERSYSTEM get manufacturer,name,model > C:\Temp\systemInfo\computerName.txt
wmic CPU get manufacturer,name > C:\Temp\systemInfo\CPU.txt
wmic CSPRODUCT get name > C:\Temp\systemInfo\ProductID.txt 
wmic GROUP get name > C:\Temp\systemInfo\userGroups.txt
wmic NIC get manufacturer,name > C:\Temp\systemInfo\NIC.txt
wmic NTDOMAIN get name > C:\Temp\systemInfo\Domain.txt
wmic OS get manufacturer,name> C:\Temp\systemInfo\operatingSystem.txt
wmic PROCESS get name > C:\Temp\systemInfo\Processes.txt
wmic STARTUP get name > C:\Temp\systemInfo\startupItems.txt
wmic USERACCOUNT get name > C:\Temp\systemInfo\Users.txt
winver
echo Done, all extra system information can be found at C:\Temp\systemInfo
echo.
echo Press any key
pause > nul
GOTO MENU
:DEV
echo Checked for developement tools at %time% >> C:\Temp\Log.txt
cls
IF EXIST "C:\Program Files (x86)\Java" (
echo Java is installed.
) ELSE (
echo Java is not installed.
)
IF EXIST "C:\Users\%username%\AppData\Local\Programs\Python" (
echo Python3 is installed.
) ELSE (
echo Python3 is not installed.
)
IF EXIST "C:\Python27" (
echo Python is installed.
) ELSE (
echo Python is not installed.
)
IF EXIST C:\Temp\scripts\DotNetVersions.exe (
echo ################
echo Press enter here
echo ################
C:\Temp\scripts\DotNetVersions.exe > C:\Temp\dotNetVersions.txt
type C:\Temp\dotNetVersions.txt
) ELSE ( 
echo [WARN] DotNetVersions.exe was found missing at %time% >> C:\Temp\Log.txt
echo ---------------------------------------
echo One or more dependencies are missing. ^|
echo ---------------------------------------
)
echo.
echo Press any key
pause > nul
GOTO MENU
:NET
echo Checked network config at %time% >> C:\Temp\Log.txt
cls
ipconfig
netsh advfirewall show allprofiles
echo External IP: (Non-authoritative answer)
echo.
nslookup myip.opendns.com. resolver1.opendns.com
echo.
echo Press any key
pause > nul
GOTO MENU
:STREAM
echo Started streaming network data at %time% >> C:\Temp\Log.txt
cls
netstat -ab
GOTO MENU
:FIRE
cls
echo.
echo --------------------------------------------------
echo PRESS 1, 2 or 0 to exit                          ^|
echo --------------------------------------------------
echo.
echo ----------------------
echo 1 - Enable Firewall  ^|
echo 2 - Disable Firewall ^|
echo 0 - Exit to Menu     ^|
echo ----------------------
echo.
set /P F=Type a number, then press ENTER: 
IF %F%==1 GOTO FIREEN
IF %F%==2 GOTO FIREDI
IF %F%==0 GOTO MENU
GOTO ERROR
:FIREEN
cls
echo Enabled firewall at %time% >> C:\Temp\Log.txt
netsh advfirewall set allprofiles state on
echo The firewall has been enabled.
echo.
echo Press any key
pause > nul
GOTO FIRE
:FIREDI
cls
echo Disabled firewall at %time% >> C:\Temp\Log.txt
netsh advfirewall set allprofiles state off
echo The firewall has been disabled.
echo.
echo Press any key
pause > nul
GOTO FIRE
:CMD
cls
echo Command window opened at %time% >> C:\Temp\Log.txt
cd C:\Windows\System32\
start
GOTO MENU
:HDD
cls
echo.
echo --------------------------------------------------
echo PRESS 1, 2, 3 or 0 to exit                       ^|
echo --------------------------------------------------
echo.
echo ----------------------------------
echo 1 - Check Disk For Corruption    ^|
echo 2 - Verify System File Integrity ^|
echo 3 - Scan For Media Files         ^|
echo 0 - Exit to Menu                 ^|
echo ----------------------------------
echo.
set /P D=Type a number, then press ENTER: 
IF %D%==1 GOTO DSK1
IF %D%==2 GOTO DSK2
IF %D%==3 GOTO DSK3
IF %D%==0 GOTO MENU
GOTO ERROR
:DSK1
cls
echo Checked disk for corruption at %time% >> C:\Temp\Log.txt
chkdsk
echo.
echo Press any key
pause > nul
GOTO HDD
:DSK2
cls
echo Checked for missing system files at %time% >> C:\Temp\Log.txt
sfc /scannow
echo.
echo Press any key
pause > nul
GOTO HDD
:DSK3
cls
echo.
echo --------------------------------------------------
echo PRESS 1, 2, 3, 4, 5 or 0 to exit                 ^|
echo --------------------------------------------------
echo.
echo ----------------------------------
echo 1 - Scan For Pictures And Videos ^|
echo 2 - Scan For Music               ^|
echo 3 - Scan For Documents           ^|
echo 4 - Scan For Archives            ^|
echo 5 - Scan ALL                     ^|
echo 0 - Exit to Menu                 ^|
echo ----------------------------------
echo.
set /P H=Type a number, then press ENTER: 
IF %H%==1 GOTO PV
IF %H%==2 GOTO MU
IF %H%==3 GOTO DOC
IF %H%==4 GOTO ARC
IF %H%==5 GOTO ALL
IF %H%==0 GOTO HDD
GOTO ERROR
:PV
cls
set /P filename3=Enter the exact file name or enter x to skip: 
IF %filename3%==x (
set filefiller==*
) ELSE (
set filefiller==%filename3%
)
echo Scanned for photos and vidoes at %time% >> C:\Temp\Log.txt
echo ---------------------------------------------
echo Running Script 1, This Will Take A While... ^| 
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%a in ('dir /B /S %filefiller%.mp4') do echo "%%a" >> C:\Temp\mediaFiles\mp4.txt
echo MP4 Done...
for /f "delims=" %%b in ('dir /B /S %filefiller%.mov') do echo "%%b" >> C:\Temp\mediaFiles\mov.txt
echo MOV Done...
for /f "delims=" %%c in ('dir /B /S %filefiller%.png') do echo "%%c" >> C:\Temp\mediaFiles\png.txt
echo PNG Done...
for /f "delims=" %%d in ('dir /B /S %filefiller%.jpg') do echo "%%d" >> C:\Temp\mediaFiles\jpg.txt
echo JPG Done...
echo Script 1 Complete!
echo You can find all of the media file locations at C:\Temp\mediaFiles\
echo.
echo Press any key
pause > nul
GOTO DSK3
:MU
cls
set /P filename4=Enter the exact file name or enter x to skip: 
IF %filename4%==x (
set filefiller2==*
) ELSE (
set filefiller2==%filename4%
)
echo Scanned for audio at %time% >> C:\Temp\Log.txt
echo ---------------------------------------------
echo Running Script 2, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%e in ('dir /B /S %filefiller2%.mp3') do echo "%%e" >> C:\Temp\mediaFiles\mp3.txt
echo MP3 Done...
for /f "delims=" %%f in ('dir /B /S %filefiller2%.wav') do echo "%%f" >> C:\Temp\mediaFiles\wav.txt
echo WAV Done...
echo Script 2 Complete!
echo You can find all of the media file locations at C:\Temp\mediaFiles\
echo.
echo Press any key
pause > nul
GOTO DSK3
:DOC
cls
set /P filename5=Enter the exact file name or enter x to skip: 
IF %filename5%==x (
set filefiller3==*
) ELSE (
set filefiller3==%filename5%
)
echo Scanned for documents at %time% >> C:\Temp\Log.txt
echo ---------------------------------------------
echo Running Script 3, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%g in ('dir /B /S %filefiller3%.txt') do echo "%%g" >> C:\Temp\mediaFiles\txt.txt
echo TXT Done...
for /f "delims=" %%h in ('dir /B /S %filefiller3%.docx') do echo "%%h" >> C:\Temp\mediaFiles\docx.txt
echo DOCX Done...
echo Script 3 Complete!
echo You can find all of the media file locations at C:\Temp\mediaFiles\
echo.
echo Press any key
pause > nul
GOTO DSK3
:ARC
cls
set /P filename6=Enter the exact file name or enter x to skip: 
IF %filename6%==x (
set filefiller4==*
) ELSE (
set filefiller4==%filename6%
)
echo Scanned for Archives at %time% >> C:\Temp\Log.txt
echo ---------------------------------------------
echo Running Script 4, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%i in ('dir /B /S %filefiller4%.zip') do echo "%%i" >> C:\Temp\mediaFiles\zip.txt
echo ZIP Done...
for /f "delims=" %%j in ('dir /B /S %filefiller4%.rar') do echo "%%j" >> C:\Temp\mediaFiles\rar.txt
echo RAR Done...
for /f "delims=" %%k in ('dir /B /S %filefiller4%.7z') do echo "%%k" >> C:\Temp\mediaFiles\7z.txt
echo 7Z Done...
echo Script 4 Complete!
echo You can find all of the media file locations at C:\Temp\mediaFiles\
echo.
echo Press any key
pause > nul
GOTO DSK3
:ALL
cls
set /P filename7=Enter the exact file name or enter x to skip: 
IF %filename7%==x (
set filefiller5==*
) ELSE (
set filefiller5==%filename7%
)
echo Scanned for all media at %time% >> C:\Temp\Log.txt
echo ---------------------------------------------
echo Running Script 1, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%a in ('dir /B /S %filefiller5%.mp4') do echo "%%a" >> C:\Temp\mediaFiles\mp4.txt
echo MP4 Done...
for /f "delims=" %%b in ('dir /B /S %filefiller5%.mov') do echo "%%b" >> C:\Temp\mediaFiles\mov.txt
echo MOV Done...
for /f "delims=" %%c in ('dir /B /S %filefiller5%.png') do echo "%%c" >> C:\Temp\mediaFiles\png.txt
echo PNG Done...
for /f "delims=" %%d in ('dir /B /S %filefiller5%.jpg') do echo "%%d" >> C:\Temp\mediaFiles\jpg.txt
echo JPG Done...
echo Script 1 Complete!
echo ---------------------------------------------
echo Running Script 2, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%e in ('dir /B /S %filefiller5%.mp3') do echo "%%e" >> C:\Temp\mediaFiles\mp3.txt
echo MP3 Done...
for /f "delims=" %%f in ('dir /B /S %filefiller5%.wav') do echo "%%f" >> C:\Temp\mediaFiles\wav.txt
echo WAV Done...
echo Script 2 Complete!
echo ---------------------------------------------
echo Running Script 3, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%g in ('dir /B /S %filefiller5%.txt') do echo "%%g" >> C:\Temp\mediaFiles\txt.txt
echo TXT Done...
for /f "delims=" %%h in ('dir /B /S %filefiller5%.docx') do echo "%%h" >> C:\Temp\mediaFiles\docx.txt
echo DOCX Done...
echo Script 3 Complete!
echo ---------------------------------------------
echo Running Script 4, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%i in ('dir /B /S %filefiller5%.zip') do echo "%%i" >> C:\Temp\mediaFiles\zip.txt
echo ZIP Done...
for /f "delims=" %%j in ('dir /B /S %filefiller5%.rar') do echo "%%j" >> C:\Temp\mediaFiles\rar.txt
echo RAR Done...
for /f "delims=" %%k in ('dir /B /S %filefiller5%.7z') do echo "%%k" >> C:\Temp\mediaFiles\7z.txt
echo 7Z Done...
echo Script 4 Complete!
echo You can find all of the media file locations at C:\Temp\mediaFiles\
echo.
echo Press any key
pause > nul
GOTO DSK3
:SSH
cls
echo.
echo ------------------------------
echo Welcome To The SSH Terminal! ^|
echo ------------------------------
echo.
set /P usernme=Enter your username, then press ENTER: 
echo.
set /P ip=Enter your IP and press ENTER: 
echo.
ssh %usernme%@%ip%
echo.
echo Press any key
pause > nul
color B
GOTO MENU
:ERROR
cls
echo Program crashed at %time% >> C:\Temp\Log.txt
color 4
echo ---------------------------------------------------------------------------------------
echo Uh-oh you seemed to have run into an error, try your best to report this in detail :) ^|
echo ---------------------------------------------------------------------------------------
echo ###THE PROGRAM WILL NOW CLOSE###
echo.
echo Press any key
pause > nul
GOTO exit
:HASH
cls
echo Welcome to the hash generator.
echo.
set /P hashtype=Enter MD2, MD4, MD5, SHA1, SHA256, SHA384, SHA512, and press enter: 
set /P filename2=Choose the file that you want to generate the hash for, and then press enter: 
certutil -hashfile %filename2% %hashtype% >> C:\Temp\hashes.txt
echo.
echo Your hashes can be found at C:\Temp\hashes.txt
echo.
echo Press any key
pause > nul
GOTO MENU
:RES
cls
echo -------Helpful Links---------
echo https://www.base64decode.org/
echo.
echo Press any key
pause > nul
GOTO MENU
:CLEAN
cls
echo Cleaning up...
IF EXIST C:\Temp  rmdir /S /Q C:\Temp
echo Done!
echo The program will now close...
echo.
echo Press any key
pause > nul
GOTO EXIT
:PASSWD
echo Setting policy...
NET ACCOUNTS /MAXPWAGE:60 > nul
echo Set max password age...
NET ACCOUNTS /MINPWLEN:12 > nul
echo Set minimum password length...
NET ACCOUNTS /UNIQUEPW:8 > nul
echo Set password history...
echo.
echo Press any key
pause > nul
GOTO MENUCHK
:EXIT
echo [LOG ENDED] >> C:\Temp\Log.txt
exit
