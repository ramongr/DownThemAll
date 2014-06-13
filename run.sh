#!/bin/bash

mkdir c cmd rails chrome js HTML java docs
cd c

#C repos HERE

git clone git@github.com:ramongr/beep_a_song_windows.git 
git clone git@github.com:ramongr/ceaser_cipher.git
git clone git@github.com:ramongr/roman_to_dec.git

cd ../cmd

git clone git@github.com:ramongr/xcowsay_name.git

#Rails repos HERE

cd ../rails

git clone git@github.com:NelsonBrandao/biobrassica.git
git clone git@github.com:SEMAG/mop.git
git clone git@bitbucket.org:ogmalabs/ogmaclinica.git

#Java respos HERE

cd ../java

git clone git@github.com:ramongr/colisoes.git
git clone git@github.com:ramongr/concurrent-java.git
git clone git@github.com:ramongr/colisoes-processing.git
git clone git@bitbucket.org:ramongr/bannerscalc-java.git

#Chrome plugins HERE

cd ../chrome

git clone git@github.com:ramongr/facebook-extras.git

#JS end-to-en HERE

cd ../js

git clone git@bitbucket.org:ogmalabs/8bitdeals.git

#OgmaLabs documentation HERE

cd ../docs

git clone git@bitbucket.org:ogmalabs/company.git

#HTML websites HERE

cd ../HTML

git clone git@bitbucket.org:ogmalabs/official-website.git
git clone git@bitbucket.org:ramongr/teste-de-turing.git
git clone git@bitbucket.org:ramongr/bannerscalc.git

clear

echo 'Done!'
