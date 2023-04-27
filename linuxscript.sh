#!/bin/bash

i=0
a=0
b=0
c=0
d=0

fn_bye() { echo "Bye bye."; exit 0; }

fn_fail() { echo "Wrong option."; exit 1; }

dir() {
    echo -ne "
Print the folder: "
    read -r dir
    if [[ $dir == "Exit" ]]
    then
        fn_bye
    elif [[ $dir == "Back" ]]
    then
        clear
        mainmenu
    elif [[ ! -n $dir ]]
    then
        dir
    elif [[ ! -d $dir ]]
    then     
        mkdir $dir
        if [[ zxc -eq 0 ]]
        then
            fn_url
        else
            fn_path
        fi
    else
        if [[ zxc -eq 0 ]]
        then
            fn_url
        else
            fn_path
        fi
    fi
}

fn_url() { 
    TMPDIR=$(mktemp -d)
    curl -sL $anssubmenu -o $TMPDIR/0000.$strurl
    ffmpeg -i $TMPDIR/0000.$strurl $dir/%04d.jpg
    for file in $(ls $dir)
    do
        i=$(( $i + 1 ))
        a=$(( $i % 10 ))
        b=$(( $i % 100 / 10 ))
        c=$(( $i % 1000 / 100 ))
        d=$(( $i % 10000 / 1000 ))
        xdg-open $dir/$d$c$b$a.jpg
        sleep 0.5
        clear
    done
}

fn_path() {
    ffmpeg -i $anspath $dir/%04d.jpg
    for file in $(ls $dir)
    do
        i=$(( $i + 1 ))
        a=$(( $i % 10 ))
        b=$(( $i % 100 / 10 ))
        c=$(( $i % 1000 / 100 ))
        d=$(( $i % 10000 / 1000 ))
        xdg-open $dir/$d$c$b$a.jpg
        sleep 0.5
        clear
    done
}

urlsubmenu() {
    echo -ne "
Print the URL: "
    read -r anssubmenu
    strurl=$(echo $anssubmenu | rev | awk -F '.' '{print $1}' | rev)
    arrurl=(mp4 gif webm mkv)
    if [[ ${arrurl[@]} =~ $strurl ]]
    then
        zxc=0
        dir
    elif [[ $anssubmenu == "Exit" ]]
    then
        fn_bye
    elif [[ $anssubmenu == "Back" ]]
    then
        clear
        mainmenu
    elif [[ ! -n $anssubmenu ]]
    then
        urlsubmenu
    else
        fn_fail
    fi
}

pathsubmenu() {
    echo -ne "
Print the PATH: "
    read -r anspath
    strpath=$(echo $anspath | rev | awk -F '.' '{print $1}' | rev)
    arrpath=(mp4 gif webm mkv)
    if [[ ${arrpath[@]} =~ $strpath ]]
    then
        zxc=1
        dir
    elif [[ $anspath == "Exit" ]]
    then
        fn_bye
    elif [[ $anspath == "Back" ]]
    then
        clear
        mainmenu
    elif [[ ! -n $anspath ]]
    then
        pathsubmenu
    else
        fn_fail
    fi
}

mainmenu() {
    clear
    echo -ne "
MAIN MENU
1) URL
2) PATH
0) Exit
Choose an option: "
    read -r ansmenu
    case $ansmenu in
    1|URL)
        urlsubmenu
        ;;
    2|PATH)
        pathsubmenu
        ;;
    0|Exit)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

mainmenu