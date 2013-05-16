# clone後にやること

## neobundle を取得

$ cd vimfiles/bundle  
$ git clone git://github.com/Shougo/neobundle.vim.git

## neobundle定義プラグインインストール

vimを開く

:NeoBundleInstall

## vimproc.vim 設定

$ cd vimfiles/bundle/vimproc.vim  
$ make -f make_unix.mak

## シンボリックリングの生成

$ cd ~/  
$ ln -s dotfiles/.vimrc .vimrc  
$ ln -s dotfiles/vimfiles vimfiles
