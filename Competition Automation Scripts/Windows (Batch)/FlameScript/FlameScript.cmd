@echo off
mode con: cols=197 lines=78
color 6
IF EXIST "dev.mode" (
set devmode==1
) ELSE (
set devmode==0
)
echo Initializing...
set mypath=%cd%
IF NOT EXIST C:\Temp\Downloads mkdir C:\Temp\Downloads
IF NOT EXIST C:\Temp\systemInfo mkdir C:\Temp\systemInfo
IF NOT EXIST C:\Temp\scripts mkdir C:\Temp\scripts
IF NOT EXIST C:\Temp\mediaFiles mkdir C:\Temp\mediaFiles
copy FlameScript.cmd C:\Temp\scripts\FlameScript.cmd > nul
copy "%cd%\res\DotNetVersions.exe" C:\Temp\scripts\DotNetVersions.exe > nul
copy "%cd%\res\SNAKE.cmd" C:\Temp\scripts\SNAKE.cmd > nul
copy "%cd%\res\ProduKey.exe" C:\Temp\scripts\ProduKey.exe > nul
copy "%cd%\res\Logger.cmd" C:\Temp\scripts\Logger.cmd > nul
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
IF %devmode%==1 (
echo [WARN] Dev mode is enabled. >> C:\Temp\Log.txt    
echo -----------------------------
echo V0.2-alpha-dev, By Cyber Team A ^|
echo -----------------------------   
start C:\Temp\scripts\Logger.cmd 
) ELSE (
echo -----------------------------
echo V0.2-alpha, By Cyber Team A ^|
echo -----------------------------
)
echo.
echo The Working Directory Is %CD%
echo.
echo Press any key
pause > nul
cls
IF %devmode%==1 (
color A
GOTO DEVMENU
) ELSE (
color B
)
GOTO MENU
:DEVMENU
cls
echo.
echo ---------------
echo DEV MENU v1.0.^|
echo ---------------
echo.
echo -------------------------------------
echo SYS - System Info                   ^|
echo DEV - Developement tools installed  ^|
echo NET - Network Information           ^|
echo STREAM - Network Stream*            ^|
echo FIRE - Firewall toggle*             ^|
echo CMD - Opens a command window        ^|
echo HDD - Hard disk utilities*          ^|
echo CRED - Credits                      ^|
echo ERROR - ERROR Screen                ^|
echo EXIT - Exits the program            ^|
echo WAL - Steals current wallpaper      ^|
echo CNFLP - Flips a Coin                ^|
echo CLR - Change the color              ^|
echo SSH - Secure Shell                  ^|
echo SNK - Snake Game                    ^|
echo WIN - Windows Activator*            ^|
echo DOWN - File downloader (http only!) ^|
echo HASH - Hash Generator               ^|
echo PKEY - Product key grabber          ^|
echo PASSWD - Sets password policy       ^|
echo CLEAN - Cleanup C:\Temp             ^|
echo WEED - Uhhhhh..                     ^|
echo RES - Resources                     ^|
echo -------------------------------------
echo.
echo (* Means Requires Admin)
echo.
set /P func=Enter a function: 
GOTO %func%
GOTO ERROR
:MENU
IF %devmode%==1 GOTO DEVMENU
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
echo 9 - Set password policy*                  ^|
echo C - Credits                               ^|
echo R - Resources                             ^|
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
IF %M%==C GOTO CRED
IF %M%==c GOTO CRED
IF %M%==R GOTO RES
IF %M%==r GOTO RES
IF %M%==0 GOTO EXIT
IF %M%==7378 GOTO HIDD
IF %M%==420 GOTO WEED
GOTO ERROR
:SYS
cls
echo Got system info at %time% >> C:\Temp\Log.txt
systeminfo
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
GOTO MENUCHK
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
GOTO MENUCHK
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
GOTO MENUCHK
:STREAM
echo Started streaming network data at %time% >> C:\Temp\Log.txt
cls
netstat -ab
GOTO MENUCHK
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
echo PRESS 1, 2, 3, 4 or 0 to exit                    ^|
echo --------------------------------------------------
echo.
echo ----------------------------------
echo 1 - Scan For Pictures And Videos ^|
echo 2 - Scan For Music               ^|
echo 3 - Scan For Documents           ^|
echo 4 - Scan ALL                     ^|
echo 0 - Exit to Menu                 ^|
echo ----------------------------------
echo.
set /P H=Type a number, then press ENTER: 
IF %H%==1 GOTO PV
IF %H%==2 GOTO MU
IF %H%==3 GOTO DOC
IF %H%==4 GOTO ALL
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
:ALL
cls
set /P filename6=Enter the exact file name or enter x to skip: 
IF %filename6%==x (
set filefiller4==*
) ELSE (
set filefiller4==%filename6%
)
echo Scanned for all media at %time% >> C:\Temp\Log.txt
echo ---------------------------------------------
echo Running Script 1, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%a in ('dir /B /S %filefiller4%.mp4') do echo "%%a" >> C:\Temp\mediaFiles\mp4.txt
echo MP4 Done...
for /f "delims=" %%b in ('dir /B /S %filefiller4%.mov') do echo "%%b" >> C:\Temp\mediaFiles\mov.txt
echo MOV Done...
for /f "delims=" %%c in ('dir /B /S %filefiller4%.png') do echo "%%c" >> C:\Temp\mediaFiles\png.txt
echo PNG Done...
for /f "delims=" %%d in ('dir /B /S %filefiller4%.jpg') do echo "%%d" >> C:\Temp\mediaFiles\jpg.txt
echo JPG Done...
echo Script 1 Complete!
echo ---------------------------------------------
echo Running Script 2, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%e in ('dir /B /S %filefiller4%.mp3') do echo "%%e" >> C:\Temp\mediaFiles\mp3.txt
echo MP3 Done...
for /f "delims=" %%f in ('dir /B /S %filefiller4%.wav') do echo "%%f" >> C:\Temp\mediaFiles\wav.txt
echo WAV Done...
echo Script 2 Complete!
echo ---------------------------------------------
echo Running Script 3, This Will Take A While... ^|
echo ---------------------------------------------
cd C:\Users\
for /f "delims=" %%g in ('dir /B /S %filefiller4%.txt') do echo "%%g" >> C:\Temp\mediaFiles\txt.txt
echo TXT Done...
for /f "delims=" %%h in ('dir /B /S %filefiller4%.docx') do echo "%%h" >> C:\Temp\mediaFiles\docx.txt
echo DOCX Done...
echo Script 3 Complete!
echo You can find all of the media file locations at C:\Temp\mediaFiles\
echo.
echo Press any key
pause > nul
GOTO DSK3
:CRED
cls
echo Viewed credits at %time% >> C:\Temp\Log.txt
echo ###################################################################################################
echo Created by FlameCodex311                                                                          #
echo DotNetVersions by jmalarcon (I do not take any ownership of DotNetVersions nor did I create it.)  #
echo SNAKE.cmd by dbenham (I do not take any ownership of DotNetVersions nor did I create it.)         #
echo ProduKey.exe by nirsoft (I do not take any ownership of DotNetVersions nor did I create it.)      #
echo ###################################################################################################
echo.
echo Press any key
pause > nul
GOTO MENUCHK
:HIDD
cls
echo.
echo --------------------------------------------------
echo Welcome to the hidden menu!!                     ^|
echo --------------------------------------------------
echo.
echo ------------------------------
echo 1 - Steal Current Wallpaper  ^|
echo 2 - Coin Flip                ^|
echo 3 - Change Color             ^|
echo 4 - SSH Terminal             ^|
echo 5 - SNAKE                    ^|
echo 6 - Activate Windows*        ^|
echo 7 - Download A File          ^|
echo 8 - Generate a files hash    ^|
echo 9 - Get product key          ^|
echo 0 - Exit to Menu             ^|
echo ------------------------------
echo.
set /P E=Type a number then press ENTER: 
IF %E%==1 GOTO WAL
IF %E%==2 GOTO CNFLP
IF %E%==3 GOTO CLR
IF %E%==4 GOTO SSH
IF %E%==5 GOTO SNK
IF %E%==6 GOTO WIN
IF %E%==7 GOTO DOWN
IF %E%==8 GOTO HASH
IF %E%==9 GOTO PKEY
IF %E%==0 GOTO MENU
GOTO ERROR
:WAL
cls
copy C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper C:\Temp\stolenWallpaper.jpg
echo Wallpaper Stolen!
echo.
echo Press any key
pause > nul
GOTO MENUHIDDCHK
:CNFLP
cls
set /A num=%RANDOM% * (1 - 0 + 1) / 32768 + 0
IF %num%==0 GOTO HEADS
IF %num%==1 GOTO TAILS
GOTO ERROR
:HEADS
echo It landed on heads!
echo.
echo Press any key
pause > nul
GOTO MENUHIDDCHK
:TAILS
echo It landed on tails!
echo.
echo Press any key
pause > nul
GOTO MENUHIDDCHK 
:CLR
cls
echo ------------------------
echo Pick a color!          ^|
echo ------------------------
echo.
echo ----------------------------------
echo 0 = Black       8 = Gray         ^|
echo 1 = Blue        9 = Light Blue   ^|
echo 2 = Green       A = Light Green  ^|
echo 3 = Aqua        B = Light Aqua   ^|
echo 4 = Red         C = Light Red    ^|
echo 5 = Purple      D = Light Purple ^|
echo 6 = Yellow      E = Light Yellow ^|
echo 7 = White       F = Bright White ^|
echo ----------------------------------
echo.
set /P C=Pick a color, then press ENTER: 
color %C%
echo Color has been changed!
echo.
echo Press any key
pause > nul
GOTO MENUHIDDCHK
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
GOTO MENUHIDDCHK
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
:SNK
IF EXIST C:\Temp\scripts\SNAKE.cmd" (
start C:\Temp\scripts\snake.cmd
) ELSE ( 
echo [WARN] SNAKE.cmd was found missing at %time% >> C:\Temp\Log.txt
echo ---------------------------------------
echo One or more dependencies are missing. ^|
echo ---------------------------------------
)
GOTO MENUHIDDCHK
:WEED
cls
color a
echo                      .                          
echo                      M                          
echo                     dM                          
echo                     MMr                         
echo                    4MMML                  .     
echo                    MMMMM.                xf     
echo    .              "MMMMM               .MM-     
echo     Mh..          +MMMMMM            .MMMM      
echo     .MMM.         .MMMMML.          MMMMMh      
echo      )MMMh.        MMMMMM         MMMMMMM       
echo       3MMMMx.     'MMMMMMf      xnMMMMMM"       
echo       '*MMMMM      MMMMMM.     nMMMMMMP"        
echo         *MMMMMx    "MMMMM\    .MMMMMMM=         
echo          *MMMMMh   "MMMMM"   JMMMMMMP           
echo            MMMMMM   3MMMM.  dMMMMMM            .
echo             MMMMMM  "MMMM  .MMMMM(        .nnMP"
echo =..          *MMMMx  MMM"  dMMMM"    .nnMMMMM*  
echo   "MMn...     'MMMMr 'MM   MMM"   .nMMMMMMM*"   
echo    "4MMMMnn..   *MMM  MM  MMP"  .dMMMMMMM""     
echo      ^MMMMMMMMx.  *ML "M .M*  .MMMMMM**"        
echo         *PMMMMMMhn. *x > M  .MMMM**""           
echo            ""**MMMMhx/.h/ .=*"                  
echo                     .3P"%....                   
echo                   nP"     "*MMnx   
echo -------------------------------------------------
echo Just like snoop.                                ^|
echo -------------------------------------------------
echo.
echo Press any key
pause > nul
GOTO MENUCHK
:WIN
cls
SETLOCAL
SET someOtherProgram=SomeOtherProgram.exe
echo Welcome To Windows Activator V1.0!
timeout /nobreak 2
echo Initialized... Ready!
echo Press Any Key To Begin The Activation Proccess
PAUSE > nul
echo Wait for text box, hit OK, then press any key
slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
PAUSE > nul
echo Wait for text box, hit OK, then press any key
slmgr /skms kms8.msguides.com
PAUSE > nul
echo Wait for text box then hit OK, press any key to exit
slmgr /ato
PAUSE > nul
del %0
GOTO MENUHIDDCHK
:DOWN
echo Welcome to the file downloader.
echo.
set /P url=Enter the URL to the file you want to download, then press enter: 
set /P filename=Enter what you want the file to be named (including extension), then press enter: 
bitsadmin /transfer myDownloadJob /download /priority normal "%URL%" C:\Temp\Downloads\%FILENAME%
echo Press any key
pause > nul
GOTO MENUHIDDCHK
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
GOTO MENUHIDDCHK
:RES
cls
echo -------Helpful Links---------
echo https://www.base64decode.org/
echo.
echo Press any key
pause > nul
GOTO MENUCHK
:PKEY
cls
echo Running script...
start C:\Temp\scripts\ProduKey.exe /WindowsKeys 1 /IEKeys 0 /ExtractEdition 1 /stext C:\Temp\PKEY.txt
echo DONE!
echo.
echo Press any key
pause > nul
GOTO MENUHIDDCHK
:MENUCHK
color B
IF %devmode%==1 (
GOTO DEVMENU
) ELSE (
GOTO MENU    
)
:MENUHIDDCHK
IF %devmode%==1 (
GOTO DEVMENU
) ELSE (
GOTO HIDD    
)
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
GOTO MENU
:EXIT
echo [LOG ENDED] >> C:\Temp\Log.txt
exit
