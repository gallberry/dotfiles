## はじめに

    $ git clone git://github.com/gallberry/dotfiles.git

## clone その後に

    各ファイルへリンクを設定
    $ cd ~/
    $ ln -s dotfiles/.vimrc .vimrc
    $ ln -s dotfiles/vimfiles vimfiles
    $ mv .bashrc .bashrc.original
    $ ln -s dotfiles/.bashrc .bashrc

    vimプラグイン用にneobundle入れる
    $ cd vimfiles/bundle
    $ git clone git://github.com/Shougo/neobundle.vim
