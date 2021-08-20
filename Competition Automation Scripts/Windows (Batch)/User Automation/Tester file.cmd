@echo off


::wmic useraccount where "localaccount=true" get name
SETLOCAL EnableDelayedExpansion EnableExtensions
set /A x = 0
call :loop
set /A x-=2
goto name
:resume
pause

set /A x-=2
set /A y=25
echo User 25 is !user[%y%]!
set /A y=6
echo User 6 is !user[%y%]!
echo number of users is %x%
pause
cmd

:name
FOR /L %%G in (0,1,%x%) do (
 echo %%G = !user[%%G]!
)
goto resume
:loop
FOR /F "skip=1 delims=" %%B in ('wmic useraccount where "localaccount=true" get name') do (
 set user[!x!]=%%B
 
 REM Echo !x! = %%B

 set /A x+=1
)



