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
highlight ZenkakuSpace gui=underline guibg=Red cterm=underline ctermfg=Red
match ZenkakuSpace /　/                 " 全角スペースのハイライト

" TabLine ------------------------------
set showtabline=2                       " タブを常に表示
highlight TabLineSel gui=None guifg=Gray guibg=DarkCyan cterm=None ctermfg=Gray ctermbg=DarkCyan
highlight TabLine gui=None guifg=Gray guibg=Black cterm=None ctermfg=Gray ctermbg=Gray
highlight TabLineFill gui=None guifg=Gray guibg=Black cterm=None ctermfg=Gray ctermbg=Black
set tabline=%!MyTabLine()
function! MyTabLine()
	let titles = map(range(1, tabpagenr('$')), 'MyTabLabel(v:val)')
	let sep = ''
	let info =''
	return join(titles, sep).'%='.info
endfunction
function! MyTabLabel(n)
	" バッファリスト取得
	let buffs = tabpagebuflist(a:n)
	let buffs_count = len(buffs)
	" タブハイライト設定
	let hl = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
	" タブ内の修正中バッファの有無
	let mod = len(filter(copy(buffs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
	let no = buffs_count
	if no is 1
		let no = ''
	endif
	let no_mod = (no.mod) ==# '' ? '' : mod
	" カレントバッファ
	let current_buff = buffs[tabpagewinnr(a:n) - 1]
	" パス除去
	let fname = substitute(bufname(current_buff), '^.*/', '', '')
	let fname = fname is '' ? '[No Title]' : fname
	" ラベル生成
	let label = fname.no_mod
	return '%'.a:n.'T'.' '.a:n.hl.label.'%T'.'%#TabLineFill#'
endfunction

" StatusLine ---------------------------
set laststatus=2                        " ステータスバーを常に表示
set statusline=%F%m%r%h%w
set statusline+=%=
set statusline+=[ft=%{&ft}][ff=%{&ff}]\[enc=%{&fileencoding}]\[pos=%v:%l/%L(%p%%)]
" When insert mode, change statusline
let g:hi_insert = 'highlight StatusLine gui=None guifg=White guibg=DarkCyan cterm=None ctermfg=White ctermbg=DarkCyan'
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
nnoremap <Tab><Tab> gt

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
endif
call neobundle#rc(expand('~/vimfiles/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	\	'build': {
	\		'windows': 'make -f make_mingw64.mak',
	\		'cygwin' : 'make -f make_cygwin.mak',
	\		'mac'    : 'make -f make_mac.mak',
	\		'unix'   : 'make -f make_unix.mak'
	\	}
	\}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
filetype plugin indent on

" neocomplcache ------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_insert_char_pre = 1

" vimfiler -----------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'
"noremap <C-e><C-x> :VimFiler -split -simple -winwidth=35 -no-quit
"autocmd VimEnter * VimFiler -split -simple -winwidth=35 -toggle -no-quit
"nnoremap <F2> :VimFiler<CR>

