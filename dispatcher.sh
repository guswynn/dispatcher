
while true; do
  echo -n "Bash Dispatcher:"
  echo -n "$USER:"
  echo -n $PWD
  echo "$ "
  read -e line
  eval $line
  if [ $? -eq 127 ]; then
    echo "Command not found, trying to apt-get it, you will need to confirm sudo"
    sudo apt-get install $(echo $line | awk '{print $1;}')
 fi
done
