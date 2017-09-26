#!/bin/sh
#
# usage: ./update.sh [src] [target git annex repo]

usage() {
  echo >&2 "$@"
  echo "usage: ./update.sh [elton dataset dir] [target git annex repo dir]"
  exit 1
}

[ "$#" -eq 2 ] || usage "needs two parameters" 

[ -d $1 ] || usage "dataset dir [$1] does not exist"
[ -d $2 ] || usage "git annex repo dir [$2] does not exist"

cp -R $1 $2
cd $2

# add all files to annex except access logs
git annex add --exclude=*/access.tsv

source $2/.archive.env
git annex copy --to=internet-archive --fast --exclude=*/Dapstrom-integrated-database-and-portal-for-fish-stomach-records/* --exclude=*/inaturalist/* --exclude=*/web-of-life/*
# add all access.tsv files to git (not git annex)
git add **/access.tsv
echo "git annex sync"
