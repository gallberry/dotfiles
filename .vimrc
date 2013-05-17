" Common -------------------------------
set nocompatible                        " vi互換OFF
colorscheme desert                      " カラースキーマ設定

" File ---------------------------------
set encoding=utf-8                      " 文字コード
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,default
set hidden                              " 編集中も他ファイル開けるように
set noswapfile                          " swapファイルを作らない
set nobackup                            " バックアップを作らない
autocmd BufWritePre * :%s/\s\+$//ge     " 保存時に末尾の空白を除去
syntax on                               " 構文色設定ON

" Indent -------------------------------
set autoindent                          " 自動インデント
set smartindent
set tabstop=4                           " Tab幅
set shiftwidth=4

" Input Assist -------------------------
set backspace=indent,eol,start          " BSで特殊記号も削除可能
set whichwrap=b,s,h,l,<,>,[,]           " カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed,autoselect        " クリップボードをバッファで共有

" View ---------------------------------
set number                              " 行番号を表示
set cursorline                          " カーソル行に下線表示
set list                                " 制御文字表示
set listchars=tab:>-,trail:~
set showmatch                           " 括弧の対応をハイライト
set nowrap                              " 画面端で折り返さない
set textwidth=0                         " 自動改行OFF
set showtabline=2                       " タブを常に表示

" StatusLine ---------------------------
set laststatus=2                        " 常に表示
set statusline=%F%m%r%h%w
set statusline+=%=
set statusline+=[ft=%{&ft}][ff=%{&ff}]\[enc=%{&fileencoding}]\[pos=%v:%l/%L(%p%%)]
" When insert mode, change statusline
let g:hi_insert = 'highlight StatusLine gui=None guifg=Black guibg=Yellow cterm=None ctermfg=Black ctermbg=Yellow'
if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction
function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

"---------------------------------------
" key mapping
"---------------------------------------
nnoremap <Space>. :<C-u>tabedit ~/.vimrc<CR>

"---------------------------------------
" filetype settings
"---------------------------------------
augroup MyAutoCmd
	autocmd!
augroup END
autocmd MyAutoCmd BufNewFile,BufRead *.phl setlocal filetype=php

"---------------------------------------
" plugin settings
"---------------------------------------
" neobundle ----------------------------
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

" neocomplcache ------------------------
let g:neocomplcache_enable_at_startup = 1

" vimfiler -----------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'
"noremap <C-e><C-x> :VimFiler -split -simple -winwidth=35 -no-quit

