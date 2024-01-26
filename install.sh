#!/bin/bash

## VARIABLE

FILE="/usr/share/X11/xkb/symbols/frop"
DATE=`date '+%F.%H-%M-%S'`


## FUNCTION

banner()
{
  echo "  ___        _   _         _   _                      "
  echo " / _ \\ _ __ | |_(_) ___   / \\ | |_ _ __ ___ _   _ ___ "
  echo "| | | | '_ \\| __| |/ _ \\ / _ \\| __| '__/ _ \\ | | / __|"
  echo "| |_| | |_) | |_| | (_) / ___ \\ |_| | |  __/ |_| \\__ \\"
  echo " \\___/| .__/ \\__|_|\\___/_/   \\_\\__|_|  \\___|\\__,_|___/"
  echo "      |_|                                             "
  echo ""
}

exit_code ()
{
  if [ $? -ne 0 ]
  then
    echo "$1"
    exit 1
  fi
}

## TEST ROOT

if [ $(id -u) != "0" ]
then
   sudo "$0" "$@"  # Modified as suggested below.
   exit $?
 else
   banner
fi

## MAIN

if test -f $FILE ;
then
  echo "The file existe, create backup whith this date : $DATE"
  cp $FILE $FILE.backup.$DATE &> /dev/null 

  exit_code "Error for the backup creation"

  cp ./frop $FILE &> /dev/null
  
  exit_code "Error durong the copy of the file"
  
  echo "The new file is here : $FILE"
else
  echo "The file no existe, copy frop"
  cp ./frop $FILE
  exit_code "Error durong the copy of the file"
fi
