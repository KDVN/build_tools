#!/bin/bash
git remote add upstream git@github.com:ONLYOFFICE/build_tools.git -f
git fetch --all
git push origin
git push -f origin --tags
# Force push all matching branches from upstream to your origin
for branch in $(git ls-remote --heads upstream | sed 's#^.*refs/heads/##'); do
	    git push origin refs/remotes/upstream/$branch:refs/heads/$branch --force
done
# Fetch tags from upstream
git fetch upstream --tags

# Overwrite all tags on your fork to match upstream
git push origin --tags --force
