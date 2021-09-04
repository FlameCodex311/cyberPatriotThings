#!/bin/bash
clear

view_passwd() {
  clear
  echo -------------------------------passwd-------------------------------
  cat /etc/passwd
  echo --------------------------------------------------------------------
  echo ""
  echo Press any key to return...
}

view_group() {
  clear
  echo --------------group--------------
  cat /etc/group
  echo ----------------------------------
  echo ""
  echo Press any key to return...
}

view_usr() {
  clear
  echo "Which user would you like to inspect?"
  echo ""
  read uservar
  groups $uservar > /dev/null
  if [ "$?" = "1" ]; then
    clear
    echo ---------------
    echo Invalid User!!!
    echo ---------------
    echo ""
    echo Press any key to return...
  else
    clear
    echo the user $uservar is in the groups:
    echo -----------------------------------
    groups $uservar
    echo -----------------------------------
    echo ""
    echo Press any key to return...
  fi
}

view_strings() {
  clear
  echo "Which database would you like to explore? (passwd, group, shadow)"
  echo ""
  read database
  case "$database" in
    passwd | group | shadow)
      clear
      echo ""
      echo "Which key would you like to use for the database" $database "(use none if you dont know)"?
      echo ""
      read key
      clear
      getent $database $key
      echo ""
      echo Press any key to return...
      ;;
    *)
      clear
      echo ---------------
      echo Invalid Database!!!
      echo ---------------
      echo ""
      echo Press any key to return...
      ;;
  esac
}

file_properties() {
  clear
  echo "Enter the path to the file you want to explore:"
  echo ""
  read filepath
  ls -l $filepath &> /dev/null
  if [ $? = 2 ]; then
    clear
    echo ---------------
    echo Invalid filepath!!!
    echo ---------------
    echo Press any key to return...
  else
    echo ""
    ls -l $filepath
    echo ""
    echo Press any key to return...
  fi
}

addusers() {
  clear
  echo "Would you like to add or remove a user? (add/remove)"
  echo ""
  read options1
  echo ""
  if [ "$options1" = "add" ]; then
    echo Enter the name of the user you want to add
    echo ""
    read userEntered
    echo ""
    adduser $userEntered
    echo Completed Successfully!
  elif [ "$options1" = "remove" ]; then
    echo Enter the name of the user you want to remove
    echo ""
    read userRemove
    echo ""
    deluser $userRemove
    echo Completed Successfully!
    echo ""
    echo Press any key to return...
  else
    echo Invalid input
    echo ""
    echo Press any key to return...
  fi
}

addrmgroup() {
  clear
  echo "Do you want to add or delete a group? (add/remove)"
  echo ""
  read options3
  echo ""
  if [ "$options3" = "add" ]; then
    echo "Enter the name of the group you want to create"
    echo ""
    read options4
    echo ""
    groupadd $options4
    echo "Completed Successfully!"
  elif [ "$options3" = "remove" ]; then
    echo "Enter The name of the group you want to remove"
    echo ""
    read options5
    echo ""
    groupdel $options5
    echo "Completed Successfully!"
    else
    echo "Invalid input"
  fi
}

addrmusergroup() {
  clear
  echo "Do you want to add or delete a user from a group? (add/remove)"
  echo ""
  read options6
  echo ""
  if [ "$options6" = "add" ]; then
    echo "Enter the name of the user you want to add to a group"
    echo ""
    read options7
    echo ""
    echo "Enter the group you want to add them to"
    echo ""
    read options8
    echo ""
    gpasswd -a $options7 $options8
    echo "Completed Successfully!"
  elif [ "$options6" = "remove" ]; then
    echo "Enter the name of the user you want to remove from a group"
    echo ""
    read options9
    echo ""
    echo "Enter the name of the group you want to remove them from"
    echo ""
    read options10
    echo ""
    gpasswd -d $options9 $options10
    echo "Completed Successfully!"
    else
    echo "Invalid input"
  fi
}

changepasswd () {
  clear
  echo "Enter the name of the user whos password you want to change"
  echo ""
  read userpasswd
  echo ""
  passwd $userpasswd
  echo ""
  echo "Completed Successfully!"
}

upgrade () {
  clear
  apt-get update && apt-get upgrade
  echo ""
  echo "Completed Successfully!"
}

security() {
  clear
  sudo sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf'
  echo ""
  sudo mv login.defs /etc/login.defs
  echo ""
  sudo apt-get install auditd bum
  echo ""
  sudo auditctl –e 1
  echo ""
  echo "Completed Successfully!"
}

bumrun() {
  clear
  sudo bum
}

runneo() {
  clear
	apt-get update && apt-get install neofetch
	clear
	neofetch
}

menu(){
echo "
███████╗██╗      █████╗ ███╗   ███╗███████╗███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
██╔════╝██║     ██╔══██╗████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
█████╗  ██║     ███████║██╔████╔██║█████╗  ███████╗██║     ██████╔╝██║██████╔╝   ██║
██╔══╝  ██║     ██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║
██║     ███████╗██║  ██║██║ ╚═╝ ██║███████╗███████║╚██████╗██║  ██║██║██║        ██║
╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝

///////////////////////////////////  Version 0.1.4  ///////////////////////////////////"
echo ""
echo "The current working directory is:" $PWD
echo "
1) View passwd file
2) View group file
3) View a users groups
4) View strings in a given database (getent)
5) View information about a given file
6) Add or remove a user (requires root)
7) Add or remove a group (requires root)
8) Add or remove a user from a group (requires root)
9) Change a users password (requires root)
10) Update repositories and upgrade packages (requires root)
11) Update security settings (requires root)
12) Run bum (requires root)
13) Display system information (requires root)
0) Exit

////////////////////////////////////////////////////////////////////////////////////////

Choose an option: "
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
          12) bumrun ; read read -p"Press any key to continue";echo ; clear ; menu ;;
          13) runneo ; read read -p"Press any key to continue";echo ; clear ; menu ;;

			0) clear ; exit 0 ;;
			*) echo Invalid option, please try again ; read read -p"Press any key to continue";echo ; clear ; menu ;;
        esac
}

menu
