## 概要

私(gallberry)のvim用設定ファイルでございます。

    $ git clone git@github.com:gallberry/dotfiles.git

## After clone
### neobundle インストール

    $ cd vimfiles/bundle
    $ git clone git://github.com/Shougo/neobundle.vim.git

vim起動して各種プラグインをインストール

    :NeoBundleInstall

### vimproc 設定

    $ cd vimfiles/bundle/vimproc.vim
    $ make -f make_unix.mak

### symbolic link 作成

    $ cd ~/
    $ ln -s dotfiles/.vimrc .vimr
    $ ln -s dotfiles/vimfiles vimfiles
