#!/bin/bash
press_enter()
{
    echo -en "\nPress Enter to continue"
    read
    clear
}

selection=
until [ "$selection" = "0" ]; do
    echo "
    PROGRAM MENU
    1 - display free disk space
    2 - display free memory
    3 - update Git
    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) df  ;;
        2 ) free  ;;
        3 ) sh git.sh ;;
        0 ) exit ;;
        * ) echo "Please enter 1, 2, 3, or 0"; press_enter
    esac
done
