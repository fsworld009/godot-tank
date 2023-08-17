set -e

GIT_DEPLOY_BRANCH=gh-pages
GIT_DEPLOY_REPO=git@github.com:fsworld009/godot-tank.git

cd dist/html
rm -rf .git
git init
git add .
git commit -m "Deploy $(date)"
git remote add origin $GIT_DEPLOY_REPO
git checkout -b $GIT_DEPLOY_BRANCH
git push -f origin $GIT_DEPLOY_BRANCH
