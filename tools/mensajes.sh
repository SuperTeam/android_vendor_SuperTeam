#!/bin/bash

#Colores
YELLOW="\033[1;33m" #el primer número es 1 (negrita); después el color
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
BLUEs="\033[1;36m"
WHITE="\033[1;37m"
ENDCOLOR="\033[0m"

ECHO="echo -e"

msgErr(){
  $ECHO $RED"$1"$ENDCOLOR
}

msgWarn(){
  $ECHO $BLUE"$1"$ENDCOLOR
}

msgOK(){
  $ECHO $GREEN"$1"$ENDCOLOR
}

msgInfo(){
  $ECHO $WHITE"$1"$ENDCOLOR
}

msgStatus(){
  $ECHO $YELLOW"$1"$ENDCOLOR
}

msgList(){
  $ECHO $YELLOW"$1: "$GREEN"$2"$ENDCOLOR
}

