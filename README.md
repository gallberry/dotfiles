# はぢめてのdotfiles

$ git clone git@github.com:gallberry/dotfiles.git

## neobundle 取得 & 各種インストール

$ cd vimfiles/bundle  
$ git clone git://github.com/Shougo/neobundle.vim.git


vim起動してインストール

:NeoBundleInstall

## vimproc.vim 設定

$ cd vimfiles/bundle/vimproc.vim  
$ make -f make_unix.mak

## シンボリックリンクの生成

$ cd ~/  
$ ln -s dotfiles/.vimrc .vimrc  
$ ln -s dotfiles/vimfiles vimfiles
