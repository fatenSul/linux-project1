search(){
        if [ ! -s "$file_list" ]; then
                 echo "ther are no commands that are related to this word!"
        else
                echo "the recomended commands are the following:" 
                while IFS= read -r filename; do

                  cmd_name="${filename%_command_info.txt}"  # we get the command from the comman>
    # Output the command name 
                 echo "$cmd_name" > recomended.txt
                 cat recomended.txt
   done < "$file_list"
   fi
}


echo "Which script would you like to run?"
echo "1) Research"
echo "2) Recommmend commands"
read -p "PLEASE CHOOSE ONE OF THE RECOMMENDED (1/2): " input

if [ $input == '1' ]
then

echo "Please Enter The Word You Are Looking For:"
read word

grep "${word}" ./*_command_info.txt | cut -d ':' -f1 | cut -d '/' -f2 > remover.txt # the output we get from grepping is in this form {{./lspci_command_info.txt}}
                                                                                    # and so in order to get the file name we do cutting twice
cat "remover.txt" | sort | uniq  > remover2.txt
#./remover.sh # generate this file after we get all the recommended commands 


# File containing the list of filenames
file_list="remover2.txt"
echo " "
echo " " 


>sort.txt # we clean the file from any previous commands
search
# it is a loop that read each line from the file_list and store the command in the variable filename


##***********************************************************************************************************************************************************************************************

else
	echo "Enter a Command" 
read command 

case $command 
    in
     cat | head | tail | awk | sed | diff )
        echo "Do you want to print the related commands to the entered command ?"
        read ans
        case $ans 
          in
                yes)
                        echo "This command related to text processing and editing --> the related commands are : cat_command_info.txt, head_command_info.txt,sort_command_info.txt,diff_command_info.txt"
                        printf "\t\t\t\t\t\t\t\t\t\t\t tail_command_info.txt , awk_command_info.txt , sed_command_info.txt\n"
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;

        grep | find )
        echo "Do you want to print the related commands to the entered command ?"
        read ans
        case $ans 
          in
                yes)
                        echo "This command related to Searching Files & Documents --> the related commands are : grep_command_info.txt , find_command_info.txt "
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;







     ls | mv | rm | touch )
         echo "Do you want to print the related .commands to the entered command ?"
         read ans
         case $ans 
          in

	                yes)
                        echo "This command related to File Directory and Management --> the related commands are: ls_command_info.txt , mv_command_info.txt , rm_command_info.txt , touch_command_info.txt"
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;


      sudo | PS | mkfs )
        echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans
          in
                yes)
                        echo "This command related to System Information and Administration --> the related commands are PS_command_info.txt , mkfs_command_info.txt , sudo_command_info.txt "
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;

      lprm | lp)
        echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans 
          in
                yes)
                        echo "This command related to Printing and Document Handling --> the related commands are : lprm_command_info.txt , lp_command_info.txt "
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;

        gpg)
        echo "Do you want to print the related commands to the entered command ?"
         read ans
         case $ans 
          in

               yes)
                        echo "This command related to Security and Encryption --> there are no related commands in the commands file"
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
                        echo "This command related to File Permissions and Ownership --> the related commands are : chmod_command_info.txt , chown_command_info.txt "
                ;;
                no)
                        echo " "
                ;;
        esac
        ;;


       *)echo "WARNING THE COMMAND YOU ARE LOOKING FOR IS NOT IN THE COMMAND FILE !!" ;;

     esac


fi
