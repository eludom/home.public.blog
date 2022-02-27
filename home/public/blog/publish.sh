#! /bin/bash
# Push my blog to "production" server

# This is bash. Be safe out there.
set -e
set -u

source ~/lib/bash/bashutils.sh  # for error functions

# be sure we're in the right place
cd ~/blog

# make sure blog source exists

test -f curious.org || die "Blog ox-hugo source curious.org does not exist"

# create the new docs/ directory/files
hugo

# let 'r rip
rsync -avz --delete docs/ hangout:/var/www/curious-html/

git add curious.org
git add images
git add content
git commit -m"Published `date`"
