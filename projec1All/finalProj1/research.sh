# here i defined a function find the recommended commands
recommend_commands() {
  echo "the recomended commands are the following:"
  >sort.txt # we clean the file from any previous commands

# it is a loop that read each line from the file_list and store the command in the variable file>
  while IFS= read -r filename; do
    # Extract the command name from the filename

      cmd_name="${filename%_command_info.txt}"  # we get the command from the command file 

    # Output the command name

      echo "$cmd_name" > recomended.txt
      cat recomended.txt
 done < "$file_list"
}

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
recommend_commands


