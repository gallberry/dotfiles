"---------------------------------------
" basic settings
"---------------------------------------
" Vi互換をオフ
set nocompatible
" クリップボードをWindowsと連携
set clipboard=unnamed
" カラースキーマ設定
syntax on
colorscheme desert
" バックアップを作らないようにする
set nobackup
" 保存時に末尾の空白を除去
autocmd BufWritePre * :%s/\s\+$//e

"---------------------------------------
" display settings
"---------------------------------------
" 自動インデント
set autoindent
set smartindent
" 行番号を表示
set number
" Tab幅
set tabstop=4
set shiftwidth=4
" カーソル行をハイライト
set cursorline
" 制御文字表示
set list
set listchars=tab:>-,trail:~
" カッコの対応
set showmatch
" ステータス表示
set laststatus=2
set statusline=%F%m%r%h%w
set statusline+=%=
set statusline+=[ft=%{&ft}][ff=%{&ff}]\[enc=%{&fileencoding}]\[pos=%v:%l/%L(%p%%)]
" 画面端で折り返さない
set nowrap
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" タブの表示(0:表示しない,1:2つ以上開いている時に表示,2:常に表示)
set showtabline=2

"---------------------------------------
" plugin settings
"---------------------------------------
"""" neobundle
" !exec once
" $ cd ~/dotfiles/vimfiles/bundle
" $ git clone git://github.com/Shougo/neobundle.vim.git
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
  call neobundle#rc(expand('~/vimfiles/bundle/'))
endif
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.vim.git'
filetype plugin indent on

"""" neocomplcache
let g:neocomplcache_enable_at_startup = 1

"""" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'
"noremap <C-e><C-x> :VimFiler -split -simple -winwidth=35 -no-quit

