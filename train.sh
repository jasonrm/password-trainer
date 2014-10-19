#!/bin/bash

# Reset
Color_Off="\033[0m"       # Text Reset

# Regular Colors
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White

declare -a MASKED
CORRECT_COUNTER=0
INCORRECT_COUNTER=0

echo "Password Trainer"

echo -n -e "${Yellow}password: ${Green}"
read ORIGINAL
echo -n -e "${Color_Off}"

LENGTH=${#ORIGINAL}
clear

echo "got it, lets begin"

_maskAdditionalCharacter() {
    NEWMASK=$(($RANDOM%$LENGTH))
    MASKED[$NEWMASK]=1
}

_unmaskCharacter() {
    NEWMASK=$(($RANDOM%$LENGTH))
    MASKED[$NEWMASK]=0
}

while [[ true ]]; do
    echo -n -e "${Purple}   masked: "
    for (( i=0; i<${#ORIGINAL}; i++ )); do
        if [[ ${MASKED[$i]} -eq 1 ]]; then
          echo -n "␣"
        else
          echo -n "${ORIGINAL:$i:1}"
        fi
    done
    echo -e "${Color_Off}"

    echo -n -e "${Yellow} password: ${Green}"
    read -s CURRENT
    echo -e "${Color_Off}"

    if [[ $ORIGINAL == $CURRENT ]]; then
        CORRECT_COUNTER=$[CORRECT_COUNTER + 1]
        echo -e "${Green} correct${Color_Off} (+${Green}${CORRECT_COUNTER}${Color_Off} -${Red}${INCORRECT_COUNTER}${Color_Off})"
        _maskAdditionalCharacter
    else
        INCORRECT_COUNTER=$[INCORRECT_COUNTER + 1]
        echo -e "${Red}incorrect${Color_Off} (+${Green}${CORRECT_COUNTER}${Color_Off} -${Red}${INCORRECT_COUNTER}${Color_Off})"
        _unmaskCharacter
    fi
    echo ""
    echo ""
done
