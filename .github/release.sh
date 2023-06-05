#!/bin/bash
GIT_USERNAME="patternfly-build"
GH_REPO=${GITHUB_REPOSITORY}
REPO="github.com/${GH_REPO}"
echo "Preparing release environment..."
git config user.email "patternfly-build@redhat.com"
git config user.name ${GIT_USERNAME}
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > ~/.npmrc

echo "Doing a release..."
# Lerna is complicated. Commands: https://github.com/lerna/lerna/tree/master/commands
# Identify packages that have been updated since the previous tagged release
# Update their versions and changelogs according to angular commit guidelines
# https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit

# publish to github and npm
yarn run lerna publish --conventional-commits --conventional-prerelease --create-release=github --no-private --dist-tag=alpha --no-verify-access --yes

# dry run
# yarn run lerna version --conventional-commits --conventional-prerelease --no-private --yes --no-git-tag-version --no-push
