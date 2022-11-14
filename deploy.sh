#!/usr/bin/env sh

# abort on errors
set -e

# build
fvm flutter build web --release --base-href="/Flutter-Theme-demo/"

# navigate into the build output directory
cd build/web

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git checkout gh-pages
git add -A
git commit -m 'deploy'
git push -f https://github.com/t42ji2ji/Flutter-Theme-demo.git

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:t42ji2ji/t42ji2ji.github.io.git main


#finish
echo "Deployed to https://t42ji2ji.github.io/Flutter-Theme-demo/"
cd -