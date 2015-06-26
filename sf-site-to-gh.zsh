#!/bin/zsh

set -e

[ -n "$1" ]
[ -n "$2" ]

if { wget http://$1.sourceforge.net/ -k -p -r } {

} else {
	echo 'wget had issues. continue?'
	read -q || exit
}

old=$PWD/$1.sourceforge.net

cd $2

git checkout --orphan gh-pages
git rm -rf \*

mv $old/* .
git add *

git commit -m "import http://$1.sourceforge.net"
