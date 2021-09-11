#!/bin/bash
cd /home/$USER
clear
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
PURPLE="\e[1;35m"
CYAN="\e[1;36m"
WHITE="\e[1;37m"
ENDLN="\e[0m"

if [ "$EUID" -ne 0 ]; then 
  echo -e "$WHITE The Current User is: $USER $ENDLN"
  echo -e "$WHITE Installing applications... $ENDLN"
  clear
  apt-get update
  apt-get -y install gufw auditd clamav libpam-cracklib gnome-tweaks
  clear
  rm /home/$USER/groupinfo.txt &> /dev/null
  rm /home/$USER/mediafiles.txt &> /dev/null
  software-properties-gtk &> /dev/null & return &> /dev/null
else
  rm /home/$USER/groupinfo.txt &> /dev/null
  rm /home/$USER/mediafiles.txt &> /dev/null
  touch /home/$USER/groupinfo.txt &> /dev/null
  touch /home/$USER/mediafiles.txt &> /dev/null
  grep 'users' /etc/group >> /home/$USER/groupinfo.txt
  grep 'sudo' /etc/group >> /home/$USER/groupinfo.txt
  software-properties-gtk &> /dev/null & return &> /dev/null
fi

view_passwd() {
  clear
  echo -e "$WHITE -------------------------------passwd------------------------------- $ENDLN"
  cat /etc/passwd
  echo -e "$WHITE -------------------------------------------------------------------- $ENDLN"
  echo ""
  echo -e "$GREEN Completed Successfully! $ENDLN"
  echo ""
  echo -e "$WHITE Press any key to return... $ENDLN"
}

view_group() {
  clear
  echo -e "$WHITE --------------group-------------- $ENDLN"
  cat /etc/group
  echo -e "$WHITE ---------------------------------- $ENDLN"
  echo ""
  echo -e "$GREEN Completed Successfully! $ENDLN"
  echo ""
  echo -e "$WHITE Press any key to return... $ENDLN"
}

view_usr() {
  clear
  echo -e "$WHITE Which user would you like to inspect? $ENDLN"
  echo ""
  read uservar
  groups $uservar > /dev/null
  if [ "$?" = "1" ]; then
    clear
    echo -e "$RED --------------- $ENDLN"
    echo -e "$RED Invalid User!!! $ENDLN"
    echo -e "$RED --------------- $ENDLN"
    echo ""
    echo -e "$WHITE Press any key to return... $ENDLN"
  else
    clear
    echo -e "$WHITE the user $uservar is in the groups: $ENDLN"
    echo -e "$WHITE ----------------------------------- $ENDLN"
    groups $uservar
    echo -e "$WHITE ----------------------------------- $ENDLN"
    echo ""
    echo -e "$WHITE Press any key to return... $ENDLN"
  fi
}

view_strings() {
  clear
  echo -e "$WHITE Which database would you like to explore? (passwd, group, shadow) $ENDLN"
  echo ""
  read database
  case "$database" in
    passwd | group | shadow)
      clear
      echo ""
      echo -e "$WHITE Which key would you like to use for the database" $database "(use none if you dont know) $ENDLN"?
      echo ""
      read key
      clear
      getent $database $key
      echo -e "$GREEN Completed Successfully! $ENDLN"
      echo ""
      echo -e "$WHITE Press any key to return... $ENDLN"
      ;;
    *)
      clear
      echo -e "$RED --------------- $ENDLN"
      echo -e "$RED Invalid Database!!! $ENDLN"
      echo -e "$RED --------------- $ENDLN"
      echo ""
      echo -e "$WHITEPress any key to return... $ENDLN"
      ;;
  esac
}

file_properties() {
  clear
  echo -e "$WHITE Enter the path to the file you want to explore: $ENDLN"
  echo ""
  read filepath
  ls -l $filepath &> /dev/null
  if [ $? = 2 ]; then
    clear
    echo -e "$RED --------------- $ENDLN"
    echo -e "$RED Invalid filepath!!! $ENDLN"
    echo -e "$RED --------------- $ENDLN"
    echo -e "$WHITE Press any key to return... $ENDLN"
  else
    echo ""
    ls -l $filepath
    echo -e "$GREEN Completed Successfully! $ENDLN"
    echo ""
    echo -e "$WHITE Press any key to return... $ENDLN"
  fi
}

addusers() {
  clear
  echo -e "$WHITE Would you like to add or remove a user? (add/remove) $ENDLN"
  echo ""
  read options1
  echo ""
  if [ "$options1" = "add" ]; then
    echo -e "$WHITE Enter the name of the user you want to add $ENDLN"
    echo ""
    read userEntered
    echo ""
    adduser $userEntered
    echo -e "$GREEN Completed Successfully! $ENDLN"
    echo ""
    echo -e "$WHITE Press any key to return... $ENDLN"
  elif [ "$options1" = "remove" ]; then
    echo -e "$WHITE Enter the name of the user you want to remove $ENDLN"
    echo ""
    read userRemove
    echo ""
    deluser $userRemove
    echo -e "$GREEN Completed Successfully! $ENDLN"
    echo ""
    echo -e "$WHITE Press any key to return... $ENDLN"
  else
    echo -e "$RED Invalid input $ENDLN"
    echo ""
    echo -e "$WHITE Press any key to return... $ENDLN"
  fi
}

addrmgroup() {
  clear
  echo -e "$WHITE Do you want to add or delete a group? (add/remove) $ENDLN"
  echo ""
  read options3
  echo ""
  if [ "$options3" = "add" ]; then
    echo -e "$WHITE Enter the name of the group you want to create $ENDLN"
    echo ""
    read options4
    echo ""
    groupadd $options4
    echo -e "$GREEN Completed Successfully! $ENDLN"
  elif [ "$options3" = "remove" ]; then
    echo -e "$WHITE Enter The name of the group you want to remove $ENDLN"
    echo ""
    read options5
    echo ""
    groupdel $options5
    echo -e "$GREEN Completed Successfully! $ENDLN"
    else
    echo -e "$RED Invalid input $ENDLN"
  fi
}

addrmusergroup() {
  clear
  echo -e "$WHITE Do you want to add or delete a user from a group? (add/remove) $ENDLN"
  echo ""
  read options6
  echo ""
  if [ "$options6" = "add" ]; then
    echo "$WHITE Enter the name of the user you want to add to a group $ENDLN"
    echo ""
    read options7
    echo ""
    echo -e "$WHITE Enter the group you want to add them to $ENDLN"
    echo ""
    read options8
    echo ""
    gpasswd -a $options7 $options8
    echo -e "$GREEN Completed Successfully! $ENDLN"
  elif [ "$options6" = "remove" ]; then
    echo -e "$WHITE Enter the name of the user you want to remove from a group $ENDLN"
    echo ""
    read options9
    echo ""
    echo -e "$WHITE Enter the name of the group you want to remove them from $ENDLN"
    echo ""
    read options10
    echo ""
    gpasswd -d $options9 $options10
    echo -e "$GREEN Completed Successfully! $ENDLN"
    else
    echo -e "$RED Invalid input $ENDLN"
  fi
}

changepasswd () {
  clear
  echo -e "$WHITE Enter the name of the user whos password you want to change $ENDLN"
  echo ""
  read userpasswd
  echo ""
  passwd $userpasswd
  echo ""
  echo -e "$GREEN Completed Successfully! $ENDLN"
}

upgrade () {
  clear
  apt-get update && apt-get upgrade
  echo ""
  echo -e "$GREEN Completed Successfully! $ENDLN"
}

security() {
  clear
   sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf'
  echo ""
   cp -f login.defs /etc/login.defs
  echo ""
   auditctl –e 1
  echo ""
   clamscan / -r
  echo ""
   cp -f common-auth /etc/pam.d/common-auth
   cp -f common-account /etc/pam.d/common-account
   cp -f users.conf /etc/lightdm/users.conf
  echo -e "$GREEN Completed Successfully! $ENDLN"
}

tweaksrun() {
  clear
   gnome-tweaks &> /dev/null & return &> /dev/null
}

findmedia() {
  clear
  echo "$WHITE Finding media files... $ENDLN"
   find /home -type f -iname "*.mp3" > /home/$USER/mediafiles.txt
   find /home -type f -iname "*.avi" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.mov" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.jpg" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.png" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.jpeg" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.wav" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.flac" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.flac" >> /home/$USER/mediafiles.txt
   find /home -type f -iname "*.flac" >> /home/$USER/mediafiles.txt
  echo ""
  echo -e "$GREEN Completed Successfully! $ENDLN"
}

runneo() {
  clear
	apt-get update && apt-get install neofetch
	clear
	neofetch
}

menu(){
echo -e "$CYAN
███████╗██╗      █████╗ ███╗   ███╗███████╗███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
██╔════╝██║     ██╔══██╗████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
█████╗  ██║     ███████║██╔████╔██║█████╗  ███████╗██║     ██████╔╝██║██████╔╝   ██║
██╔══╝  ██║     ██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║
██║     ███████╗██║  ██║██║ ╚═╝ ██║███████╗███████║╚██████╗██║  ██║██║██║        ██║
╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝

///////////////////////////////////  Version 0.1.5  ///////////////////////////////////$ENDLN"
echo ""
echo -e "$RED*****************************************************************$ENDLN"
echo -e "$RED*** DO THE FORENSICS QUESTIONS BEFORE MESSING WITH THE SYSTEM ***$ENDLN"
echo -e "$RED*****************************************************************$ENDLN"
echo ""
echo -e "$YELLOW The current working directory is: $PWD $ENDLN"
echo ""
if [ "$EUID" -ne 0 ]; then 
  echo -e "$YELLOW The Current User is: $USER $ENDLN"
else
  echo -e "$RED The Current User is Root $ENDLN"

fi
echo -e "$WHITE
 1) View passwd file
 2) View group file
 3) View a users groups
 4) View strings in a given database (getent)
 5) View information about a given file
 6) Add or remove a user (Requires Root)
 7) Add or remove a group (Requires Root)
 8) Add or remove a user from a group (Requires Root)
 9) Change a users password (Requires Root)
 10) Update repositories and upgrade packages, also scan for viruses (Requires Root)
 11) Update security settings (Requires Root)
 12) Run gnome-tweaks (used for startup applications) (Requires Root)
 13) Display system information (Requires Root)
 14) Scan for media files (Requires Root)
 0) Exit $ENDLN

$CYAN////////////////////////////////////////////////////////////////////////////////////////$ENDLN

$WHITE Choose an option: $ENDLN"
        read a
        echo ""
        case $a in
	        1) view_passwd ; read read -p"Press any key to continue";echo ; clear ; menu ;;
	        2) view_group ; read read -p"Press any key to continue";echo ; clear ; menu ;;
	        3) view_usr ; read read -p"Press any key to continue";echo ; clear ; menu ;;
	        4) view_strings ; read read -p"Press any key to continue";echo ; clear ; menu ;;
	        5) file_properties ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          6) addusers ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          7) addrmgroup ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          8) addrmusergroup ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          9) changepasswd ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          10) upgrade ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          11) security ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          12) tweaksrun ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          13) runneo ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          14) findmedia ; read read -p"Press any key to continue";echo ; clear ; menu ;;


			0) clear ; exit 0 ;;
			*) echo Invalid option, please try again ; read read -p"Press any key to continue";echo ; clear ; menu ;;
        esac
}

menu
