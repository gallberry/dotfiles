" File ---------------------------------
set nocompatible                        " vi互換モードOFF
scriptencoding utf-8                    " マルチバイト対応
set encoding=utf-8                      " 文字コード
set fileencoding=utf-8                  " 保存時の文字コード
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,default
set fileformats=unix,dos,mac            " 改行コード
set hidden                              " 編集中も他ファイル開けるように
set noswapfile                          " swapファイルを作らない
set nobackup                            " バックアップを作らない
autocmd BufWritePre * :%s/\s\+$//ge     " 保存時に末尾の空白を除去
syntax on                               " 構文色設定ON

" Indent -------------------------------
set tabstop=4                           " Tab幅
set autoindent                          " 継続インデント
set smartindent                         " 構文チェックして自動インデント
set shiftwidth=4                        " smartindentのTab幅

" Input Assist -------------------------
set backspace=indent,eol,start          " BSで特殊記号も削除可能
set whichwrap=b,s,h,l,<,>,[,]           " カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed,autoselect        " クリップボードをバッファで共有
set wildmenu                            " コマンドモードの補完

" View ---------------------------------
set number                              " 行番号を表示
set cursorline                          " カーソル行に下線表示
set list                                " 制御文字表示
set listchars=tab:>-,trail:~
set showmatch                           " 括弧の対応をハイライト
set nowrap                              " 画面端で折り返さない
set textwidth=0                         " 自動改行OFF
highlight ZenkakuSpace gui=underline guibg=Red cterm=underline ctermfg=Red
match ZenkakuSpace /　/                 " 全角スペースのハイライト

" TabLine ------------------------------
set showtabline=2                       " タブを常に表示

" StatusLine ---------------------------
set laststatus=2                        " ステータスバーを常に表示
set statusline=%!MyStatusLine()
function! MyStatusLine()
	let s ='%F%m%r%h%w'
	let s .='%='
	let s .='[ft=%{&ft}][ff=%{&ff}][enc=%{&fileencoding}][pos=%v:%l/%L(%p%%)]'
	return s
endfunction

"---------------------------------------
" key mapping
"---------------------------------------
nnoremap <Space>. :<C-u>tabedit ~/.vimrc<CR>

nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-w> <C-w>w
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nmap <Space> [unite]
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>

"---------------------------------------
" filetype settings
"---------------------------------------
augroup MyAutoCmd
	autocmd!
augroup END
autocmd MyAutoCmd BufNewFile,BufRead *.phl setlocal filetype=php

"---------------------------------------
" neobundle settings
"---------------------------------------
if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/vimfiles/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'    " Let NeoBundle manage NeoBundle
" --------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomasr/molokai'
" --------
call neobundle#end()
filetype plugin indent on

"---------------------------------------
" NERDTree settings
"---------------------------------------
let NERDTreeShowHidden = 1              " Show hidden files
" autocmd VimEnter * if !argc() | NERDTree | endif
