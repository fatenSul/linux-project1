echo "Which script would you like to run?"
echo "1) Generate the all commands info"
echo "2) Verification"
echo "3) Search && Recommendation"
read -p "PLEASE CHOOSE ONE OF THE RECOMMENDED (1/2/3): " input

case $input in
    1)
        echo "Generating the commands.."
        ./generate.sh 
        ;;
    2)
	./compare.sh
        ;;
    3)
        ./part3.sh
        ;;
#    4)
#	./recommend.sh
#	;;
    *)
        echo "Invalid choice"
	echo "Enter a correct number"''
        ;;
esac
