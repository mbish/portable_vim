install:
	git submodule update --init --recursive
	[ -e $$HOME/.vimrc ] || ln -s `pwd`/vimrc $$HOME/.vimrc
	[ -d stat $$HOME/.vim ] || ln -s `pwd` $$HOME/.vim
