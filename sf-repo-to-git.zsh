#!/bin/zsh

set -e

zparseopts -D s=svn

[ -n "$1" ]

MODULE=$2
[ -z "$2" ] || MODULE=$1

autoload colors
d=$(mktemp -d)
orig=$PWD

echo $fg[red]created $d
cd $d

echo $fg[red]rsync

if [[ -z "$svn" ]] {
	rsync -av rsync://$1.cvs.sourceforge.net/cvsroot/$MODULE/\* $d/cvs

	echo $fg[red]rsync ok, cvsimport
	git cvsimport -v -a -k -d $d/cvs -C $1 $MODULE

	echo $fg[red]cvsimport, authors
	cd $1
	git shortlog |egrep '^\w' |awk '{print $1, "=", $1, "<"$1"@users.sourceforge.net>"}' >../authors.txt
	cd ..

	less authors.txt
	echo 'is it ok? [yn]'

	if { read -q ok } {
		rm -rf $1
		git cvsimport -v -a -k -d $d/cvs -C $1 -A authors.txt $1
		echo $fg[red]conversion done, import finished
	} else {
		echo $fg[red]import finished
	}
} else {
	rsync -av rsync://$1.svn.code.sourceforge.net/p/$1/code/\* $d/svn

	echo $fg[red]rsync ok, svn clone
	git svn clone file://$d/svn $1 -s

	echo $fg[red]clone finished
}
