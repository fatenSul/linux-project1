
# File containing the list of filenames
file_list="remover.txt"
echo " "
echo " " 
echo "the recomended commands are the following:" 
 >sort.txt

# it is a loop that read each line from the file_list and store the command in the variable filename
while IFS= read -r filename; do
    # Extract the command name from the filename

echo " file name $filename"
    cmd_name="${filename%_command_info.txt}" # this will take the command 

    # Output the command name
 
     echo "$cmd_name" > sort.txt
    sort sort.txt > uniq.txt
    uniq uniq.txt > recomended.txt
    cat recomended.txt
done < "$file_list"
