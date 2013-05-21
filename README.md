## 概要

私(gallberry)のvim用設定ファイルでございます。

    $ git clone git://github.com/gallberry/dotfiles.git

## clone その後に

### symbolic link 作成

    $ cd ~/
    $ ln -s dotfiles/.vimrc .vimrc
    $ ln -s dotfiles/vimfiles vimfiles

### neobundle インストール

*注* neobundleはvimのバージョンが7.0だと使えないっぽいです

    $ cd vimfiles/bundle
    $ git clone git://github.com/Shougo/neobundle.vim.git

vim起動して各種プラグインをインストール

    :NeoBundleInstall
