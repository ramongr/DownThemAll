# #!/bin/bash
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

#Regular expression
regex="[a-zA-Z]*";

#Check if file with token exists
if [ -f token ]; then
  gitToken=$(<gitHubToken)
  echo "Git token: $gitToken";
else

  read -p "Insert Authorization token for Github: " gitToken;
  echo $gitToken > token;
fi

for OUTPUT in $(curl -H "Authorization: token $gitToken " https://api.github.com/user/repos | grep -o git@[a-zA-Z0-9:._\/]*)
do

  #Check if there exists a repo config file
  if [ -f repoConfig ]; then
    folderName=$(grep "$regex $OUTPUT" repoConfig)
    folderName=$(echo $folderName | grep -E -o "^[a-z]+")
    
    #Check if repo has a folder assigned
    if [ -z $folderName ]; then

      echo "Which folder should I save $OUTPUT?"
      read folderName
      #Save option
      echo "$folderName $OUTPUT" >> repoConfig
    fi

    #Check if folder already exists
    if [ -d $folderName ]; then

      cd $folderName
      echo "git clone $OUTPUT"
    else

      mkdir -m 777 $folderName && cd $folderName
      echo "git clone $OUTPUT"

    fi
    cd ..
  else

    echo "Which folder should I save $OUTPUT?"
    read folderName
    #Save option
    echo "$folderName $OUTPUT" >> repoConfig
    mkdir -m 777 $folderName && cd $folderName
    echo "git clone $OUTPUT"
    cd ..
  fi
done