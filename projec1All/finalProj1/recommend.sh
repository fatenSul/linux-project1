echo "Enter a Command" 
read command 

case $command 
    in
    grep | cat | head | tail | awk | sed | sort | diff | pico )
	echo "Do you want to print the related commands to the entered command ?"
	read ans
	case $ans 
	  in
		yes)
			echo "This command related to text processing and editing: , the related commands are : cat, head, tail, awk, sed, sort, diff, pico , grep "
		;;
		no)
			echo " "
		;;
	esac
	;;

     ls | cp | mv | rm | touch )
	 echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans 
          in
                yes)
                        echo "This command related to File Management: , the related commands are:ls , cp , mv , rm , touch"
                ;;
                no)
                        echo " "
                ;;
        esac
	;;
	
      lspci | sudo | find | ln )
	echo "Do you want to print the related commands to the entered command ?"
	 read ans
         case $ans 
          in
                yes)
                        echo "This command related to System Information and Management: , the related commands are lspci , sudo , find , ln "
                ;;
                no)
                        echo " "
                ;;
        esac
	;;

      gpg | lp)
	echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans 
          in
                yes)
                        echo "This command related to Miscellaneous: , the related commands are :gpg , lp "
                ;;
                no)
                        echo " "
                ;;
        esac
	;;


	chmod |  chown)
	 echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans 
          in
                yes)
                        echo "This command related to File Permissions and Ownership: , the related commands are : chmod , chown "
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;


       ssh | scp | ping)
         echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans 
          in
                yes)
                        echo "This command related to Networking: , the related commands are :ssh , scp , ping "
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;

       *)echo "WARNING THE COMMAND YOU ARE LOOKING FOR IS NOT IN THE COMMAND FILE !!" ;;

     esac
     

