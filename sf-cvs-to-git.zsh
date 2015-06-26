#!/bin/zsh

set -e

[ -n "$1" ]

MODULE=$2
[ -z "$2" ] || MODULE=$1

autoload colors
d=$(mktemp -d)

echo $fg[red]created $d
cd $d

echo $fg[red]rsync
rsync -av rsync://$1.cvs.sourceforge.net/cvsroot/$MODULE/\* cvs

echo $fg[red]rsync ok, cvsimport
git cvsimport -v -a -k -d `pwd`/cvs -C $1 $MODULE

echo $fg[red]cvsimport, authors
cd $1
git shortlog |egrep '^\w' |awk '{print $1, "=", $1, "<"$1"@users.sourceforge.net>"}' >../authors.txt
cd ..

less authors.txt
echo 'is it ok? [yn]'

if { read -q ok } {
	rm -rf $1
	git cvsimport -v -a -k -d `pwd`/cvs -C $1 -A authors.txt $1
	echo $fg[red]conversion done, import finished
} else {
	echo $fg[red]import finished
}

