read CMD
case "$CMD" in
    ls) echo "list files"
        ls ;;
    head) echo "print the first 10 lines of the commands.txt"
        head commands.txt ;;
    tail) echo "prints the last 10 lines of the commands.txt"
        tail commands.txt ;;
    rm) echo "it deletes a file3.txt"
        rm file3.txt ;;
    mv) echo "rename a file"
        mv file1.txt newname.txt ;;
    sed) echo "Replace the word 'old' with 'new' in a file."
        sed 's/old/new/' file1.txt ;;
    touch) echo "create a file"
        touch file4.txt ;;
    diff) echo "Compare two files and show differences"
        diff file1.txt file2.txt ;;
    awk) echo "Print the first column of a file."
        awk '{print $1}' file1.txt ;;
    sudo) echo "Execute a command with superuser privileges"
        sudo apt-get update ;;
    find) echo "Find files in a directory hierarchy."
        find /path/to/dir -name "file1.txt" ;;
    gpg) echo "Encrypt a file."
        gpg -c file1.txt ;;
    lp) echo "Print a file."
        lp file1.txt ;;
    PS) echo "Display currently running processes."
        ps -aux ;;

  chown) echo " Change file owner and group. "
	chown user:group file2.txt
	LS -l file2.txt
	;;
   chmod) echo " Change file permissions."
 	chmod 755 remover.sh
	ls il remover.sh
	;;

    mkfs) echo " Create a filesystem on a disk partition."
	;;

     grep)echo "Search for a specific word in a file."
	grep "test" file1.txt ;;


    lprm) echo " Remove a print job from the queue." ;;

   cat ) echo "display a file"
	cat file1.txt ;;
 
 *) echo "Unknown command: $CMD" ;;
esac
