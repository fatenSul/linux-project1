# file that containing the name of the selected  commands
COMMANDS_FILE="commands.txt"

# Check if the commands file exists
if [ ! -f "$COMMANDS_FILE" ]; then
    echo "The file $COMMANDS_FILE does not exist."
    exit 1
fi

# Read commands from the file
while IFS= read -r CMD;
 do
    # Skip empty lines
    if [ -z "$CMD" ]; then
        continue
    fi

    # Output file
    OUTPUT_FILE="${CMD}_command_info.txt"

    # Clear the file from any previous data by using overwrite
    > "$OUTPUT_FILE"

    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"

##----------------------------------------------------------------------------  Command Description  --------------------------------------------------------------------
	LONG_DESC=$(man "$CMD" | sed -n '/^DESCRIPTION/,/^[A-Z]/p' | sed '1d' | head -n 3 | tr $'\t' ' ' | sed 's/^[ \t]*//' )  #this will extract only 3 lines from the description man command
	printf "\033[1mDescription\033[0m\t$LONG_DESC" | tr $'\n' ' ' | column -W 2 -s$'\t' -t >> "$OUTPUT_FILE" # this line helps in doing  the templet table with bold title 


    if [ -z "$LONG_DESC" ] # check if the variable is null
	 then
      	LONG_DESC="Description not available."
    fi


    echo " " >> "$OUTPUT_FILE" #save an empty line in the file 
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"

##--------------------------------------------------------------------------Version History of the Command ------------------------------------------------------------------

	case "$CMD"
	  in
	    awk) printf "\033[1mHistory\033[0m\t developed in the 1970s at AT&T Bell Laboratories by Aho, Weinberger, and Kernighan.\n" >> "$OUTPUT_FILE" ;;
	    PS)printf "\033[1mHistory\033[0m\t The ps command has its roots in early versions of Unix. It has been a part of Unix  with its first appearances dating back to the 1970s in early versions.\n" >> "$OUTPUT_FILE" ;;
	esac



	VERSION_INFO=$("$CMD" --version 2>/dev/null | head -n 3 || echo "Version information not available") # this commad will either print the version of the command (or) will print version is not avaialbe if the version does not exit 

	 if [ -n "$VERSION_INFO" ] # check if the variable is null
         then
	printf "\033[1mHistory\033[0m\t$VERSION_INFO" | tr $'\n' ' ' | column -W 2 -s$'\t' -t >> "$OUTPUT_FILE"
	    fi

	echo " " >> "$OUTPUT_FILE"

    echo "" >> "$OUTPUT_FILE"

    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"

##````````````````````````````````````````````````````````````````````````````````` Example ``````````````````````````````````````````````````````````````````````````````````````````````



  case "$CMD"
             in

     ls)
         res=$(ls | head ) 
         printf "\033[1mEXAMPLE\033[0m\tls\n" | column -t  -W 3 -s$'\t' >> "$OUTPUT_FILE"
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> "$OUTPUT_FILE"
	done <<< "${res}" | column -t -W 2 -s$'\t'
         ;; 
    head)  #printf "\033[1mEXAMPLE\033[0m\tprint the first 10 lines of the commands.txt\n" >> "$OUTPUT_FILE"
        #head commands.txt >> "$OUTPUT_FILE";;
        res=$(head commands.txt) 
         printf "\033[1mEXAMPLE\033[0m\tit prints the first 10 lines from a file : head commands.txt-\n" | column -t  -W 3 -s$'\t' >> "$OUTPUT_FILE"
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> "$OUTPUT_FILE"
	done <<< "${res}" | column -t -W 2 -s$'\t'
	;;
    tail)   res=$(tail commands.txt) 
         printf "\033[1mEXAMPLE\033[0m\tit prints the last 10 lines from a file : tail commands.txt-\n" | column -t  -W 3 -s$'\t' >> "$OUTPUT_FILE"
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> "$OUTPUT_FILE"
	done <<< "${res}" | column -t -W 2 -s$'\t'
	;;

    rm)  printf "\033[1mEXAMPLE\033[0m\tit deletes a file.txt : rm file3.txt \n" >> "$OUTPUT_FILE" ;;
    mv)  printf "\033[1mEXAMPLE\033[0m\trename a file: mv  oldname.txt newname.txt \n" >> "$OUTPUT_FILE" ;;
    sed)  printf "\033[1mEXAMPLE\033[0m\tReplace the word 'old' with 'new' in a file1.txt \n" >> "$OUTPUT_FILE"
        sed 's/old/new/' file1.txt >> "$OUTPUT_FILE" ;;
    touch)  printf "\033[1mEXAMPLE\033[0m\tcreate a file  touch file4.txt \n" >> "$OUTPUT_FILE"
        touch file4.txt >> "$OUTPUT_FILE" 
        ;;
    diff)  printf "\033[1mEXAMPLE\033[0m\tCompare two files and show differences\n" >> "$OUTPUT_FILE"
        diff file1.txt file2.txt >> "$OUTPUT_FILE" ;;
    awk)  printf "\033[1mEXAMPLE\033[0m\tPrint the first column of a file : awk '{print $1}' file1.txt .\n" >> "$OUTPUT_FILE"
        awk '{print $1}' file1.txt >> "$OUTPUT_FILE" ;;
    sudo)  printf "\033[1mEXAMPLE\033[0m\tExecute a command with superuser privileges: sudo apt-get update\n" >> "$OUTPUT_FILE" ;;
      #  sudo apt-get update >> "$OUTPUT_FILE" ;;
    find)  printf "\033[1mEXAMPLE\033[0m\tFind files in a directory hierarchy : find /path/to/dir -name *.txt.\n" >> "$OUTPUT_FILE" ;;
     #   find /path/to/dir -name "file1.txt" >> "$OUTPUT_FILE" ;;
    gpg)  printf "\033[1mEXAMPLE\033[0m\tEncrypt a file : gpg -c file5.txt.\n" >> "$OUTPUT_FILE" ;;
 #       gpg -c file5.txt >> "$OUTPUT_FILE" ;;
    lp)  printf "\033[1mEXAMPLE\033[0m\tPrint a file lp : file1.txt.\n" >> "$OUTPUT_FILE" ;;
 #       lp file1.txt >> "$OUTPUT_FILE" ;;
    PS) printf "\033[1mEXAMPLE\033[0m\tDisplay currently running processes.\n" >> "$OUTPUT_FILE"
        (ps -aux | head)>> "$OUTPUT_FILE" ;;

  chown) printf "\033[1mEXAMPLE\033[0m\tChange file owner and group==> chown user:group file2.txt.\n" >> "$OUTPUT_FILE"
#        chown user:group file2.txt >> "$OUTPUT_FILE"
#        ls -l file2.txt >> "$OUTPUT_FILE"
        ;;
   chmod) printf "\033[1mEXAMPLE\033[0m\tChange file permissions.\n" >> "$OUTPUT_FILE"
        chmod 755 research.sh >> "$OUTPUT_FILE"
        ls -l research.sh >> "$OUTPUT_FILE"
        ;;

    mkfs) printf "\033[1mEXAMPLE\033[0m\t Create a filesystem on a disk partition.\n" >> "$OUTPUT_FILE"
        ;;

     grep)printf "\033[1mEXAMPLE\033[0m\t Search for a specific word in a file. : grep -n (test) file1.txt\n" >> "$OUTPUT_FILE"
          printf " "
          grep -n "test" file1.txt >> "$OUTPUT_FILE" ;;


    lprm) printf "\033[1mEXAMPLE\033[0m\t Remove a print job from the queue : lprm jobnumber.\n" >> "$OUTPUT_FILE" ;;

   cat )
        res=$(cat file1.txt) 
         printf "\033[1mEXAMPLE\033[0m\t display the content of a file : cat file1.txt\n" | column -t  -W 3 -s$'\t' >> "$OUTPUT_FILE"
	# Print each line of the output
	while IFS= read -r line; do
	    printf "\t${line}\n" >> "$OUTPUT_FILE"
	done <<< "${res}" | column -t -W 2 -s$'\t'
# Print the output
         ;; 
 
 *) echo "Unknown command: $CMD" ;;
esac



     echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"


    #````````````````````````````````````````````````````````````````````````` Related Commands ```````````````````````````````````````````````````````````````````````````````````````````

	case "$CMD"
             in
		ls) printf "\033[1mRELATED COMMANDS\t\033[0mcp, mv, rm, tree\n" >> "$OUTPUT_FILE" ;;
		touch) printf "\033[1mRELATED COMMANDS\t\033[0mmkdir \n" >> "$OUTPUT_FILE"  ;;

	      esac

	LONG_RELATED1=$(man "$CMD" | sed -n '/^SEE ALSO/,/^[A-Z]/p' | sed '1d' | head -n 2 | tr $'\t' ' ' | sed 's/^[ \t]*//' )
	LONG_RELATED2=$(echo "$LONG_RELATED1" | sed '/Full documentation <https:\/\/www.gnu.org\/software\/coreutils\/ls/,/> or available locally via: info '\''(coreutils) ls invocation'\''/d' )
	 LONG_RELATED=$(echo "$LONG_RELATED2" | sed '/Full documentation <https:\/\/www.gnu.org\/software\/coreutils\/touch/,/> or available locally via: info '\''(coreutils) touch invocation'\''/d' )


	if [ -z "$LONG_RELATED" ] # check if the variable is null
         then
        LONG_DESC=" "
    else
        printf "\033[1mRELATED COMMANDS\033[0m\t$LONG_RELATED" | tr $'\n' ' ' | column -W 2 -s$'\t' -t >> "$OUTPUT_FILE"

    echo " " >> "$OUTPUT_FILE"

	fi

 	 echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"


	done < "$COMMANDS_FILE"

	echo "Here are the commands you can look at:"
	cat commands.txt
