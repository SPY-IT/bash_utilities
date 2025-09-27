#!/bin/bash
set -e
# exits script upon command with non-zero return


# script to contribute the latest version of the (django) project
# handy tool I made for my git commits, use at your own discretion and risk...
printf  "Enter the commit message: "
read -r message
printf "Enter path of (project)  origin "
read -r originpath
printf "Enter name of project "
read -r projectname
printf "Enter user email for git"
read -r usermail
printf "Enter username for git"
read -r username  
printf "Commit message: %s\n" "$message"



if [[ ! -d "$originpath" ]]; then
  echo "Origin path does not exist or is not a directory."
  exit 1
fi
cp -r "$originpath" ./ || { echo "Copy failed"; exit 1; }

git add "$projectname"/

git config user.email "$usermail" && git config user.name "$username"
# u might want to add --global argument back in if commit fails... 
git commit -m "$message"

read -p "Push to origin/main? (y/n): " confirm
[[ $confirm == y ]] && git push origin main
# u might want to alter the branch type to match your needs...
exit 0 
