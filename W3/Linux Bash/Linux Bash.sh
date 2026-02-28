#!/bin/bash

echo "This script reads a typed directory and sorts the files/directories in it."

while true; do
    read -t 60 -p "Enter your directory here: ~/linux/Bash/" dir 
    fulldir="/home/test/linux/Bash/${dir}" 

    if [ -d "$fulldir" ]; then 
        ls -F "$fulldir" 
        echo -e "These are all files/directories within your directory.\nTask done." 
        touch /home/test/linux/Bash/filenames.txt /home/test/linux/Bash/dirname.txt 

        ls "$fulldir" | while read item; do 
            if [ -f "$fulldir/$item" ]; then 
                echo "$item" >> /home/test/linux/Bash/filenames.txt 
            elif [ -d "$fulldir/$item" ]; then 
                echo "$item" >> /home/test/linux/Bash/dirname.txt 
            else 
                continue 
            fi 
        done 

        read -t 60 -p "Do you want to cat the .txt files? (Press anything other than y to exit) " answer 

        if [[ ${answer,,} == "y" ]]; then 
            echo -e "\nFilenames:\n" 
            cat /home/test/linux/Bash/filenames.txt 
            echo -e "\nDirnames:\n" 
            cat /home/test/linux/Bash/dirname.txt 
        fi 

        break 
    else 
        echo -e "This is a wrong directory! Type in again.\nCurrent directory ls:" 
        ls /home/test/linux/Bash 
    fi 
done