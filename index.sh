printf "Full Name of the file to Copy(.pdf and everything):"
read name_file

printf "New Title(Only the name, without .pdf):"
read title

printf "dFirstPage:"
read n

printf "dLastPage:"
read n2


echo "First Page:$n"
echo "Last Page:$n2"
echo "Title:$title"
echo "Name of the file to Copy:$name_file"

printf "Remove the file index.sh in the path of the new file after exit?Y/N:"
read delete
if [ $delete = "Y" ]; then 
  echo "Ok, will delete."
else 
  echo "Ok, will not delete"
fi 
sleep 2 

printf "Confirm?Y/N(or anything else)"
read confirm 
if [ $confirm = "Y"  ]; then
    echo "Ok."
else
    if [ $delete == "Y" ]; then 
      rm -rf index.sh
    fi
    exit 0;
fi

gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dFirstPage=$n -dLastPage=$n2 -sOutputFile=$title.pdf "$name_file"
[ $delete == "Y" ] && { rm -rf index.sh; } 

