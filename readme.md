#Down them All!

##A script that's designed to download all my repos from a single run

1. Create auth token on GitHub
2. Get ssh access to your repositories
3. Prepare run.sh to run as executable
4. It will download every repo that you participated on
  1. If you already downloaded once with this tool, then it should have a repoConfig file, with the (folder, repo) pair and it needs no input from the user
  2. Altenatively you could config the file and keep it for eternity



##Atention!

This script only works for ssh links (haven't had the time or the patience to do the regex for the normal links)

##Repo Config file - How it works

One line for each repo

folderName repoAddress

## Example

rails git@github.com:rails/rails.git
