#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_bak
curdir=$(pwd)
files=(bashrc i3 tmux.conf vimrc Xdefaults xinitrc zshrc)
num_files=${#files[@]}

for ((i=0; i<${num_files}; i++)); do
    echo "$i:${files[$i]}"
done

echo "Select files to dit(e.g., 0 3 4):"
read dits
echo 

echo "Creating $olddir for backup of existing dotfiles"
mkdir -p $olddir
echo "Done"
echo

echo "cd to dotfile dir"
cd $dir
echo

echo "Backing up files and symlinking to dotfiles"
for i in $dits; do
    file=${files[$i]}
    if [ -f ~/.$file ]
    then
        mv ~/.$file $olddir/
    fi
    ln -s $dir/$file ~/.$file
done
echo "Done"
