# #!/bin/bash

#Regular expression

regex="[a-zA-Z]*";

#Check if file with token exists

if [ -f token ]; then
	gitToken=$(<token)
	echo "Git token: $gitToken";
else

	read -p "Insert Authorization token for Github: " gitToken;
	echo $gitToken > token;
fi

curl -H "Authorization: token $gitToken " https://api.github.com/user/repos | grep "\"language\": \"[a-zA-Z]*\"" > language

for OUTPUT in $(curl -H "Authorization: token $gitToken " https://api.github.com/user/repos | grep -o git@[a-zA-Z0-9:._\/]*)
do
	ls --color

	#The repo exists in the config file
	if [ -f repoConfig ]; then
	    folderName=$(grep "$regex git@github.com:megajpc/colisoes.git" repoConfig)
	    folderName=$(echo $folderName | grep -E -o "^[a-z]+")
	    
	    #Check if the folder is created or not
	    if [ -d $folderName ]; then
				cd $folderName
			else
				read -p "Which folder should I save $OUTPUT? " complete -F folderName;
			fi

			echo "git clone $OUTPUT";
			cd ..
	fi 
		
	read -p "Which folder should I save $OUTPUT? " complete -F folderName;

		
	if [ -d $folderName ]; then
		cd $folderName
	else
		mkdir $folderName && cd $folderName
	fi

	echo "git clone $OUTPUT";
	cd ..

done