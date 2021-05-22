#!/bin/bash

git config --global user.email "walxar@gmail.com"
git config --global user.name "walxar"
ls -a
sudo mkdir ./repoa && cd ./repoa
sudo chmod 777 ../repoa
echo "cloning repo A"
git clone https://$GITHUB_TOKEN@github.com/WALXAR/github-actions-for-ci.git
sudo rm -rf ./repoa/github-actions-for-ci/.git
sudo rm -rf ./repoa/github-actions-for-ci/.github 
ls -a
echo "cloning repo B"
sudo mkdir ../repob && cd ./repob
sudo chmod 777 ../repob
git clone https://$GITHUB_TOKEN@github.com/WALXAR/demorepo-borrar.git
# #echo "More description " >> /c/Users/walte/Desktop/test/security-strategy-essentials/README.md
cp -r ./repoa/github-actions-for-ci/ ./repob/demorepo-borrar/
cd ./demorepo-borrar
ls -a
git add .
git commit -m "new commit"
git push origin main