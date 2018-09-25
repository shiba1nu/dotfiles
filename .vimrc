set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set display=lastline
set laststatus=2
set statusline=%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%c,%l/%L>%8P
set foldmethod=marker
set ambiwidth=double

syntax on

" commentout.vim
" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>

" ==================== file yanktmp.vimrc ====================
" map <silent> sy :call YanktmpYank()<CR>
" map <silent> sp :call YanktmpPaste_p()<CR>
" map <silent> sP :call YanktmpPaste_P()<CR>
" ==================== end: yanktmp.vimrc ====================
if v:version < 700 || (exists('g:loaded_yanktmp') && g:loaded_yanktmp || &cp)
  finish
endif
let g:loaded_yanktmp = 1

if !exists('g:yanktmp_file')
  let g:yanktmp_file = '/tmp/vimyanktmp'
endif

function! YanktmpYank() range
  call writefile(getline(a:firstline, a:lastline), g:yanktmp_file, 'b')
endfunction

function! YanktmpPaste_p() range
  let pos = getpos('.')
  call append(a:firstline, readfile(g:yanktmp_file, "b"))
  call setpos('.', [0, pos[1] + 1, 1, 0])
endfunction

function! YanktmpPaste_P() range
  let pos = getpos('.')
  call append(a:firstline - 1, readfile(g:yanktmp_file, "b"))
  call setpos('.', [0, pos[1], 1, 0])
endfunction

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" PHP Lint
nmap ,l :call PHPLint()<CR>

""
" PHPLint
"
" @author halt feits <halt.feits at gmail.com>
"
function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction

" ファイルと閉じずに実行結果を得る
nmap ,e :!php %<CR>

" Clipboard
set clipboard=unnamed,autoselect

" buffer
set hidden
nnoremap <C-k> gF

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Plugin
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

call plug#end()
