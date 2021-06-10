#!/bin/bash

menu="Enter the number for the option you want."
menu1="1. Read file"
menu2="2. Type message"
menu3="3. Quit"

message=""
fileContent=""
baseStringy=""
input=0
quit=0

encryptionChooser () {
    cipherChoice=0
    echo -n "Enter 1 for ROT13 or 2 for Caesar's cipher: "
    read cipherChoice
    
    if [ "$cipherChoice" == 1 ];
    then
        ROT13
    else
        CC
    fi

}

ROT13 () {
    cryptionInput=0
    echo -n "Enter 1 for Encryption or 2 for Decryption: "
    read cryptionInput
    
    if [ "$cryptionInput" == 1 ];
    then
        result=$(echo "$baseStringy" | tr "[A-Za-z]" "[N-ZA-Mn-za-m]")
    elif [ "$cryptionInput" == 2 ];
    then
        result=$(echo "$baseStringy" | tr "[N-ZA-Mn-za-m]" "[A-Za-z]") 
    fi
        
    outputFile=""
    echo -n "Input name of the output file: "
    read outputFile
    
    echo "Result: $result" | tee $outputFile
    
    #newText=""
    #currOrd=0
    #circularAnchor=0

    #for letter in baseStringy 
    #do
    #    currOrd=ord $letter
    #
    #   if [ ! "${baseStringy:letter:1}" \< "A" ] && [ ! "${baseStringy:letter:1}" \> "Z" ];
    #   then
    #       circularAnchor=ord A

    #    elif [ ! "${baseStringy:letter:1}" \< "a" ] && [ ! "${baseStringy:letter:1}" \> "z" ];
    #   then
    #        circularAnchor=ord a

    #   else
    #        newText+=${baseStringy:letter:1}
    #        continue
    #    fi

    #    currOrd=$((currOrd-circularAnchor))
    #    currOrd=$(((currOrd + cipher) % 26))
    #    currOrd=$((currOrd+circularAnchor))
    #    newText+=chr $currOrd
    #done
    
    #echo $newText | tee outputFile
}

CC () {

    alphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZbcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

    cipher=0
    echo -n "Input number of shifts you want to do: "
    read cipher

    cryptionInput=0
    echo -n "Enter 1 for Encryption or 2 for Decryption: "
    read cryptionInput
    
    if [ "$cryptionInput" == 1 ];
    then
        result=$(echo $baseStringy | tr "${alphabet:0:52}" "${alphabet:${cipher}:52}")
    elif [ "$cryptionInput" == 2 ];
    then
        #following two lines end up not being needed
        #negator=-1
        #cipher=$(($cipher * $negator))
        result=$(echo $baseStringy | tr "${alphabet:${cipher}:52}" "${alphabet:0:52}" )
    fi
        
    outputFile=""
    echo -n "Input name of the output file: "
    read outputFile
    
    echo "Result: $result" | tee $outputFile
    
    #newText=""
    #currOrd=0
    #circularAnchor=0

    #for letter in baseStringy 
    #    do
    #    currOrd=${baseStringy:letter:1}
    #    echo $currOrd
    #    if [ ! "${baseStringy:letter:1}" \< "A" ] && [ ! "${baseStringy:letter:1}" \> "Z" ];
    #    then
    #        circularAnchor="A"

    #    elif [ ! "${baseStringy:letter:1}" \< "a" ] && [ ! "${baseStringy:letter:1}" \> "z" ];
    #    then
    #        circularAnchor="a"

    #    else
    #        newText+=${baseStringy:letter:1}
    #        continue
    #    fi


    #    currOrd=$((currOrd-circularAnchor))
    #    currOrd=$(((currOrd + cipher) % 26))
    #    currOrd=$((currOrd+circularAnchor))
    #    newText+=$currOrd
    #done
    
    #echo $newText | tee outputFile


};

# this is the menu and "main" of the script
while [ $quit == 0  ];
do
    echo "$menu"
    echo "$menu1"
    echo "$menu2"
    echo "$menu3"
    read input
    if [ "$input" == 1 ];
    then
        file=""
        echo -n "Input name of the file: "
        read file
        
        baseStringy=$fileContent
        echo "File contents: $baseStringy"
        encryptionChooser

    elif [ "$input" == 2 ];
    then
        echo -n "Input message: "
        read message
        
        baseStringy=$message
        encryptionChooser
        
    elif [ "$input" == 3 ];
    then
        quit=1
        exit
    fi
done
