printf "File path:"
read file_path
echo $file_path
cp -r index.sh  -t "$file_path" && cd $file_path && ./index.sh
