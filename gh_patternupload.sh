#!/bin/bash -x

git config --global user.email "walxar@gmail.com"
git config --global user.name "walxar"
hub config --global hub.protocol https
echo "token $GITHUB_TOKEN"
sudo mkdir ~/repoa && cd ~/repoa
sudo chmod 777 ~/repoa
echo "cloning repo A"
git clone https://$GITHUB_TOKEN:x-oauth-basic@github.com/WALXAR/github-actions-for-ci.git
sudo rm -rf ~/repoa/github-actions-for-ci/.git
sudo rm -rf ~/repoa/github-actions-for-ci/.github && cd ~/repoa/github-actions-for-ci && ls -a
sleep 5
echo "Setup repo B"
sudo mkdir ~/repob && cd ~/repob
sudo chmod 777 ~/repob
sleep 5
# #echo "More description " >> /c/Users/walte/Desktop/test/security-strategy-essentials/README.md
cp -a ~/repoa/github-actions-for-ci/. ~/repob/
cd ~/repob/
echo "init repo"
git init
git remote add origin https://$GITHUB_TOKEN:x-oauth-basic@github.com/WALXAR/pocgithub.git
sleep 5
git add .
git commit -m "new commit"
git branch -M main
git push --set-upstream origin main