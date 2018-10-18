#!/usr/bin/env bash

let files_number=$( find . -maxdepth 1 -type f | wc -l )

function compareAnswer {
    if [[ $response -gt $files_number ]] ; then
        echo "guess was  high,try again..."
        readAnswer
    else
        echo "guess was  low,  try again..."
        readAnswer
    fi
}

function readAnswer {
    read response
    while [[ ! $response =~ ^[0-9]+$ ]] ; do
        echo "try again with a positive integer value"
        read response
    done
}

echo "try to guess how many files are in the current directory ($(pwd))..."
readAnswer
while [[ $response -ne $files_number ]] ; do
    compareAnswer
done
echo "Congratulations, your answer is correct."

exit 0
