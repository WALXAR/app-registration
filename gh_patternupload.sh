#!/bin/bash

git config --global user.email "walxar@gmail.com"
git config --global user.name "walxar"
ls -a
sudo mkdir ~/repoa && cd ~/repoa
sudo chmod 777 ~/repoa
echo "cloning repo A"
git clone https://$GITHUB_TOKEN@github.com/WALXAR/github-actions-for-ci.git
sudo rm -rf ~/repoa/github-actions-for-ci/.git
sudo rm -rf ~/repoa/github-actions-for-ci/.github && cd ~/repoa/github-actions-for-ci && ls -a
sleep 5
echo "cloning repo B"
sudo mkdir ~/repob && cd ~/repob
sudo chmod 777 ~/repob
git clone https://$GITHUB_TOKEN@github.com/WALXAR/demorepo-borrar.git && ls -a
sleep 5
# #echo "More description " >> /c/Users/walte/Desktop/test/security-strategy-essentials/README.md
cp -a ~/repoa/github-actions-for-ci/. ~/repob/demorepo-borrar/
cd ~/repob/demorepo-borrar
ls -a
git remote add origin https://$GITHUB_TOKEN@github.com/WALXAR/demorepo-borrar.git
git add .
git commit -m "new commit"
git branch -M main
git push -u origin main