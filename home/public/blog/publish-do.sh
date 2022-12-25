#! /bin/bash
# Push my blog to "production" server
#
# Usage: [DRY_RUN=1] publish-do.sh ["Comment about article/commit"]

# This is bash. Be safe out there.
set -e
set -u

COMMENT="${1:-No comment}"

source ~/lib/bash/bashutils.sh  # for error functions

# be sure we're in the right place
cd ~/blog

# make sure blog source exists

test -f curious.org || die "Blog ox-hugo source curious.org does not exist"

# create the new docs/ directory/files
info Running hugo
test -v DRY_RUN || hugo

info Pushing to web


test -v DRY_RUN || rsync -avz --delete docs/ curious:/var/www/curious.galthub.com/

info Adding things to git

if [[ "$COMMENT" == "No comment" ]]; then
    read -r -p "Enter a comment about this change/article: " COMMENT
else
    debug COMMENT "$COMMENT"
fi


test -v DRY_RUN && PRINT=info || PRINT=

$PRINT rsync -avz --delete docs/ curious:/var/www/curious.galthub.com/
$PRINT git add curious.org
$PRINT git add images
$PRINT git add content
$PRINT git commit -m"Published $(date): ${COMMENT}"


info "done"
