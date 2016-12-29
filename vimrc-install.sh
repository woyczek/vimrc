#!/bin/bash

# v1.0 - nledez

BASE=$(dirname $0)
if [ $BASE = "." ]; then
	BASE=$(pwd)
fi

if [ "$1" = "" ]; then
	TARGET=/root
else
	TARGET="$1"
fi

#toto() {
if [ -d $TARGET/.vim ]; then
	echo "$TARGET/.vim allready exist"
else
	echo "Need to install $TARGET/.vim"
	cd $TARGET
	git clone git@github.com:woyczek/vimrc.git .vim
	rm $TARGET/.vim/.git/hooks/*.sample
	cd $TARGET/.vim/.git/hooks
	ln -s ../../git-post-merge post-merge
fi
#}
cd $TARGET/.vim

pwd | grep -Eq '.vim$'
if [ "$?" != "0" ]; then
	echo "Cannot go in $TARGET/.vim"
	exit 1
fi

# In ksh :
# declare -A bundles
# bundles=( [Vundle]=https://... ... )
# for i in ${!bundles[@]} ; do ...
#
# No associative array in bash -> simulate one with linear array
keys="Vundle molokai jellybeans tabular syntastic vim-puppet vim-sensible"
# Be careful to the order
declare -a bundles=(
https://github.com/gmarik/Vundle.vim.git
https://github.com/vim-scripts/molokai.git
https://github.com/nanotech/jellybeans.vim.git 
https://github.com/godlygeek/tabular.git
https://github.com/vim-syntastic/syntastic
https://github.com/rodjek/vim-puppet
https://github.com/tpope/vim-sensible
)

[ ! -d bundle ] && mkdir bundle
cd bundle

n=0
for i in ${keys} ; do
[ -d $i ] || git clone ${bundles[$n]}
let n=$n+1
done
git config branch.master.remote origin
git config branch.master.merge refs/heads/master
git config user.email github@ryckeboer.org
git config user.name "Gaétan Ryckeboer"
git checkout master

cd $TARGET

#titi(){
if [[ ( -f $TARGET/.vimrc ) && ( "$(readlink $TARGET/.vimrc)" == ".vim/vimrc") ]] ;then
	echo "$TARGET/.vimrc allready exist"
else
	echo "Need to install $TARGET/.vimrc"
	if [ -e $TARGET/.vimrc ] ; then
		rm $TARGET/.vimrc
	fi
	cd && \
	ln -s .vim/vimrc .vimrc
fi

which dpkg >/dev/null && dpkg -l vim-nox | grep -qE '^ii[ ]+vim-nox[ ]+' || apt-get install - vim-nox

vim +PluginInstall +qall

read

reset
#}
