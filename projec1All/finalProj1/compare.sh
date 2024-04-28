#*********** the same steps used in the 4 sections *********
# Prompt user to enter the command
echo "Enter the command name:"
read CMD

# Extract command description from file
file1=$(grep 'Description' "${CMD}_command_info.txt")

echo " " 
LONG_DESC=$(man "$CMD" | sed -n '/^DESCRIPTION/,/^[A-Z]/p' | sed '1d' | tr $'\t' ' ' | sed 's/^[ \t]*//' )   # i used the same command in the generating files info
short2=$(printf "\033[1mDescription\033[0m\t$LONG_DESC" | tr $'\n' ' ' | column -W 2 -s$'\t' -t ) # this line helps in doing  the templet table with bold title 
short3=$(echo "$short2" | head -n 1)


#this function helps in comapring two strings if they contain the same word regardless on the spaces and white tabsa within the words
normalize_string() {
    echo "$1" | tr -s '[:space:]' ' ' | tr '[:upper:]' '[:lower:]'
}
# Normalize both strings
normalized_string1=$(normalize_string "$short3")
normalized_string2=$(normalize_string "$file1")

# Compare the normalized strings
if [ "$normalized_string1" = "$normalized_string2" ]; then
    echo "The Description Comparison is the same"
else
    echo "The Description Comparison is  not the same!!!! "
fi
#------------------------------------------------------------------------



#``````````````````````````````````````````````````````COMPARE THE VERSION ``````````````````````````````````````\
file_version_info=$(grep 'History' -A 3 "${CMD}_command_info.txt")
VERSION_INFO=$("$CMD" --version 2>/dev/null | head -n 3 || echo "Version information not available") # this commad will either print the version of the command (or) will print version is not avai>
history=$(printf "\033[1mHistory\033[0m\t$VERSION_INFO" | tr $'\n' ' ' | column -W 2 -s$'\t' -t )
# Compare the two


normalize_string() {
    echo "$1" | tr -s '[:space:]' ' ' | tr '[:upper:]' '[:lower:]'
}
# Normalize both strings
normalized_string1=$(normalize_string "$history")
normalized_string2=$(normalize_string "$file_version_info")

# Compare the normalized strings
if [ "$normalized_string1" = "$normalized_string2" ]; then
    echo "The Version History Comaparison is the same"
else
    echo "The Version Historyis Comparison is not the same!!!! "
fi

 
#````````````````````````````````````````````````````COMPARE THE RELATED COMMANEDS``````````````````````````````````````````

file_rela_com=$(grep 'RELATED COMMANDS' -A 1 "${CMD}_command_info.txt" )

LONG_RELATED1=$(man "$CMD" | grep '^SEE ALSO' -A 2 | sed '1d'| tr $'\t' ' ' | sed 's/^[ \t]*//' )
related2=$(printf "\033[1mRELATED COMMANDS\033[0m\t$LONG_RELATED1" | tr $'\n' ' ' | column -W 2 -s$'\t' -t )

related=$(echo "$related2" | head -n 2)

normalize_string() {
    echo "$1" | tr -s '[:space:]' ' ' | tr '[:upper:]' '[:lower:]'
}
# Normalize both strings
normalized_string1=$(normalize_string "$related")
normalized_string2=$(normalize_string "$file_rela_com")

# Compare the normalized strings
if [ "$normalized_string1" = "$normalized_string2" ]; then
    echo "The Related Commands are the same"
else
    echo "The Related Commands are  not the same!!!! "
fi


#`````````````````````````````````````````````````````` COMPARE THE EXAMPLES````````````````````````````````````````````````````````


> example_paragraph.txt
> example_FILE.txt
sed -n '/EXAMPLE/,/-------/{/-------/d;p;}' "${CMD}_command_info.txt"  > example_paragraph.txt
#cat example_paragraph.txt

	  case "$CMD"
             in

     ls) #printf "\033[1mEXAMPLE\033[0m\tlist files\n" >> example_FILE.txt
         #printf "\t\t\t$(ls)" >> example_FILE.txt
         res=$(ls | head ) 
         printf "\033[1mEXAMPLE\033[0m\tls\n" | column -t  -W 3 -s$'\t' >> example_FILE.txt
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> example_FILE.txt
	done <<< "${res}" | column -t -W 2 -s$'\t'
         ;;
    head)
        res=$(head commands.txt) 
         printf "\033[1mEXAMPLE\033[0m\tit prints the first 10 lines from a file : head commands.txt-\n" | column -t  -W 3 -s$'\t' >> example_FILE.txt
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> example_FILE.txt
	done <<< "${res}" | column -t -W 2 -s$'\t'
	;;
    tail)   res=$(tail commands.txt) 
         printf "\033[1mEXAMPLE\033[0m\tit prints the last 10 lines from a file : tail commands.txt-\n" | column -t  -W 3 -s$'\t' >> example_FILE.txt
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> example_FILE.txt
	done <<< "${res}" | column -t -W 2 -s$'\t'
	;;
	
    rm)  printf "\033[1mEXAMPLE\033[0m\tit deletes a file.txt : rm file3.txt \n" >> example_FILE.txt ;;
    mv)  printf "\033[1mEXAMPLE\033[0m\trename a file: mv  oldname.txt newname.txt \n" >> example_FILE.txt ;;
    sed)  printf "\033[1mEXAMPLE\033[0m\tReplace the word 'old' with 'new' in a file1.txt \n" >> example_FILE.txt
        sed 's/old/new/' file1.txt >> example_FILE.txt ;;
    touch)  printf "\033[1mEXAMPLE\033[0m\tcreate a file  touch file4.txt \n" >> example_FILE.txt
        touch file4.txt >> example_FILE.txt 
        ;;
    diff)  printf "\033[1mEXAMPLE\033[0m\tCompare two files and show differences\n" >> example_FILE.txt
        diff file1.txt file2.txt >> example_FILE.txt ;;
    awk)  printf "\033[1mEXAMPLE\033[0m\tPrint the first column of a file : awk '{print $1}' file1.txt .\n" >> example_FILE.txt
        awk '{print $1}' file1.txt >> example_FILE.txt ;;
    sudo)  printf "\033[1mEXAMPLE\033[0m\tExecute a command with superuser privileges: sudo apt-get update\n" >> example_FILE.txt ;;
      #  sudo apt-get update >> example_FILE.txt ;;
    find)  printf "\033[1mEXAMPLE\033[0m\tFind files in a directory hierarchy : find /path/to/dir -name *.txt.\n" >> example_FILE.txt ;;
     #   find /path/to/dir -name "file1.txt" >> example_FILE.txt ;;
    gpg)  printf "\033[1mEXAMPLE\033[0m\tEncrypt a file : gpg -c file5.txt.\n" >> example_FILE.txt ;;
 #       gpg -c file5.txt >> example_FILE.txt ;;
    lp)  printf "\033[1mEXAMPLE\033[0m\tPrint a file lp : file1.txt.\n" >> example_FILE.txt ;;
 #       lp file1.txt >> example_FILE.txt ;;
    PS) printf "\033[1mEXAMPLE\033[0m\tDisplay currently running processes.\n" >> example_FILE.txt
        (ps -aux | head)>> example_FILE.txt ;;

  chown) printf "\033[1mEXAMPLE\033[0m\tChange file owner and group==> chown user:group file2.txt.\n" >> example_FILE.txt
#        chown user:group file2.txt >> example_FILE.txt
#        ls -l file2.txt >> example_FILE.txt
        ;;
   chmod) printf "\033[1mEXAMPLE\033[0m\tChange file permissions.\n" >> example_FILE.txt
        chmod 755 research.sh >> example_FILE.txt
        ls -l research.sh >> example_FILE.txt
        ;;

    mkfs) printf "\033[1mEXAMPLE\033[0m\t Create a filesystem on a disk partition.\n" >> example_FILE.txt
        ;;

     grep)printf "\033[1mEXAMPLE\033[0m\t Search for a specific word in a file. : grep -n (test) file1.txt\n" >> example_FILE.txt
  printf " "
  grep -n "test" file1.txt >> example_FILE.txt ;;


    lprm) printf "\033[1mEXAMPLE\033[0m\t Remove a print job from the queue : lprm jobnumber.\n" >> example_FILE.txt ;;

   cat ) printf "\033[1mEXAMPLE\033[0m\t display the content of a file : cat file1.txt\n" >> example_FILE.txt
        cat file1.txt  >> example_FILE.txt;;
 
 *) echo "Unknown command: $CMD" ;;
esac




#here i compare between two files to see if they are matching 
if diff example_FILE.txt example_paragraph.txt > /dev/null; then
    echo "The Examples for both commands are equal."
else
    echo "The Examples for both commands are not equal."
fi

