#!/bin/bash

ls -a
sudo mkdir ./repoa && cd ./repoa
sudo chmod 777 ../repoa
echo "cloning repo A"
git clone https://$GITHUB_TOKEN@github.com/WALXAR/github-actions-for-ci.git
sudo rm -r ./repoa/github-actions-for-ci.git/.git
ls -a
# echo "cloning repo B"
# git clone git@github.com:WALXAR/demorepo-borrar.git
# #echo "More description " >> /c/Users/walte/Desktop/test/security-strategy-essentials/README.md
# cp -r /c/Users/walte/Desktop/test/github-actions-for-ci/* /c/Users/walte/Desktop/test/demorepo-borrar
# cd /c/Users/walte/Desktop/test/demorepo-borrar
# git add .
# git commit -m "new commit"
# git push origin main