#!/bin/sh
cd ./dist
git init
git branch -m gh-pages
git add .
echo "faucet.confluxnetwork.org" >> CNAME
git commit -m "Automatic deploy"
git remote add origin git@github.com:conflux-fans/conflux-faucet.git
git push origin gh-pages -f