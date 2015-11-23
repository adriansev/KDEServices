#!/bin/bash

nameext=$(basename "$1")
name=${nameext%.*}
name2=${name%.*}
password=$(extract_pw_dialog.sh "$getpw")
dir=$(dirname "$1") 

cd "$dir" 
overw="0"

if ( [ -d "$name2" ] || [ -f "$name2" ] ); then
echo "file/folder exists"
overw=$(overwrite_dialog.sh "$ow")
fi
echo $overw

if [ "$overw" == "0" ];then
mkdir "$name2"
cp "$nameext" "$name2"
cd "$name2"
unace x -o -y -p"$password" "$nameext"
rm "$nameext"
extract_dialog.sh
else
extract_cancel_dialog.sh
fi