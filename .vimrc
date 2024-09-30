set expandtab
set tabstop=4
set shiftwidth=4
set number
set hlsearch
set display=lastline
set laststatus=2
set foldmethod=marker
set ambiwidth=single
set modifiable
set write
set shortmess-=S

syntax on

" Change Indent by filetype
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2
augroup END

" Command Line Key Map
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Insert Mode時カーソル移動
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-l> <C-o>$

" cursor shape
let &t_ti .= "\e[1 q"
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
let &t_te .= "\e[0 q"

" Clipboard
set clipboard=unnamed,autoselect

" buffer
set hidden

" Quickfix
nnoremap <silent> <C-j> :<C-u>cnext<CR>
nnoremap <silent> <C-k> :<C-u>cprev<CR>

" leader
let mapleader = "\<Space>"

" Escでハイライト解除
nnoremap <ESC><ESC> :nohl<CR>

" インサートモードから抜ける
inoremap <silent> jj <ESC>

" タブ
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap ,q :<C-u>tabclose<CR>
nnoremap <C-Left> :<C-u>-tabm<CR>
nnoremap <C-Right> :<C-u>+tabm<CR>

" Plugin
call plug#begin()
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'tyru/caw.vim'
Plug 'thinca/vim-quickrun'
Plug 'skanehira/preview-markdown.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'
Plug 'mattn/ctrlp-launcher'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'simeji/winresizer'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'LeafCage/yankround.vim'
Plug 'jsborjesson/vim-uppercase-sql'
Plug 'thinca/vim-ref'
Plug 'junegunn/vim-easy-align'
Plug 'Rican7/php-doc-modded'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'machakann/vim-sandwich'
Plug 'tyru/eskk.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/Align'
Plug 'brooth/far.vim'
Plug 'zef/vim-cycle'
Plug 'vim-denops/denops.vim'
Plug 'monaqa/dps-dial.vim'
Plug 'mechatroner/rainbow_csv'
plug 'airblade/vim-gitgutter'
Plug 'iberianpig/tig-explorer.vim'
Plug 'kshenoy/vim-signature'
Plug 'liuchengxu/vista.vim'

" Plug 'yuki-yano/fern-preview.vim'
" Plug 'maximbaz/lightline-ale'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'Raimondi/delimitMate'
" Plug 'mralejandro/vim-phpdoc'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
" Plug 'mattn/vim-lexiv'
" Plug 'alvan/vim-php-manual'
" Plug 'lambdalisue/fern-renderer-devicons.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'vim-syntastic/syntastic'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
call plug#end()

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Fern
let g:fern#renderer = 'nerdfont'
nnoremap <silent> ,e :<C-u>Fern . -drawer -stay -keep -toggle -width=40 -reveal=%<CR>
set guifont=HackGenNerd:h11
set encoding=utf-8
" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
" icon
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" CtrlP
let g:ctrlp_map = '<nop>'
let g:ctrlp_lazy_update = 200
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
let g:ctrlp_match_window = 'bottom,order.btt,min:1,max:15,results:50'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap ,c :<C-u>CtrlP .<CR>
nnoremap ,, :<C-u>CtrlPMRUFiles<CR>

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap ,a :tab split<CR>:Ack ""<Left>
nnoremap ,ak :tab split<CR>:Ack <C-r><C-w><CR>

" Far
let g:far#source="ag"
let g:far#window_layout="tab"

" Quickrun
let g:quickrun_config={'*': {'split': ''}}
nnoremap <C-q> :<C-U>QuickRun<CR>
set splitright

" vim-code-dark
set t_Co=256
set t_ut=
colorscheme codedark

" Lightline
let g:lightline = {
   \  'colorscheme': 'wombat',
   \  'active': {
   \    'left': [
   \       ['mode', 'paste'],
   \       ['gitbranch', 'readonly', 'relativepath', 'modified']
   \    ],
   \  },
   \  'component': {
   \    'relativepath': "%{expand('%:~:gs?\\?/?')}",
   \  },
   \  'component_function': {
   \    'gitbranch': 'FugitiveHead'
   \  },
   \  'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
   \  'subseparator': {'left': "\ue0b1", 'right': "\ue0b3"}
   \ }

" vim-fugitive
nnoremap ,gs :<C-u>Git<CR>
nnoremap ,gd :<C-u>Gdiff<CR>
nnoremap ,gb :<C-u>Git blame<CR>
set diffopt+=vertical

" vim-gitgutter
" プレビューウィンドウをフローティングウィンドウ表示する
let g:gitgutter_preview_win_floating = 1
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red
" 反映時間を短くする
set updatetime=100

" yankRound
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" open-browser
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" previm-open
nnoremap ,p :<C-u>PrevimOpen<CR>

" Custom command
cabbrev fx %s/></>\r</g \| filetype indent on \| setf xml \| normal gg=G
cabbrev fj %!jq '.'
cabbrev ev e $MYVIMRC
cabbrev mktag term ++close ctags -R -f tags
cabbrev sw StripWhitespace
cabbrev it IndentLinesToggle
cabbrev ef EnablePHPFolds
cabbrev df DisablePHPFolds
cabbrev lf set ff=unix
cabbrev utf set fenc=utf-8

" indentLine
let g:indentLine_char = '|'

" ctags
set tags=./tags,tags

" dict
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
set complete=.,w,b,u,t,i,k

" 補完表示時のEnterで改行をしない
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"

" vim-ref
let g:ref_phpmanual_path = $HOME . '/.vim/ref/php-chunked-xhtml'

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" php-doc-modded
inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-d> :call PhpDocSingle()<CR>
vnoremap <C-d> :call PhpDocRange()<CR>

" iabbrev
iab debug \Cake\Log\Log::write(LOG_DEBUG, );<ESC>F)
iab debugp \Cake\Log\Log::write(LOG_DEBUG, print_r(, true));<ESC>F,
iab debugv \Cake\Log\Log::write(LOG_DEBUG, var_export(, true));<ESC>F,
iab err \Cake\Log\Log::write(LOG_ERR, );<ESC>F)
iab errp \Cake\Log\Log::write(LOG_ERR, print_r(, true));<ESC>F,
iab errv \Cake\Log\Log::write(LOG_ERR, var_export(, true));<ESC>F,

" search php.net
function! s:search_phpnet() abort
    let searchWord = expand("<cword>")
    if searchWord != ''
        let query = substitute(searchWord, '_', '-', 'g')
        let url = 'https://www.php.net/manual/ja/function.' . query . '.php'
        execute 'OpenBrowser ' . url
    endif
endfunction
command! SearchPhpnet call s:search_phpnet()
nnoremap <silent> ,sp :SearchPhpnet<CR>

" phpfolding
let g:DisableAutoPHPFolding = 1

" vim-cycle
autocmd VimEnter * call AddCycleGroup('php', ['int', 'string', 'array', 'bool'])
autocmd VimEnter * call AddCycleGroup('php', ['private', 'protected', 'public'])

" dps-dial
let g:dps_dial#augends#register#i = [ 'case' ]
nmap gc "i<Plug>(dps-dial-increment)

" tig-explorer
" tigを開く
nnoremap ,t :TigOpenProjectRootDir<CR>
" 現在のファイルの履歴を見る
nnoremap ,T :TigOpenCurrentFile<CR>

" 対応する開始/終了タグに移動
filetype plugin on
runtime macros/matchit.vim

" Vista.vim
let g:vista_sidebar_width = 50
let g:vista_default_executive = 'coc'
nnoremap <silent> ,v :<C-u>Vista!!<CR>

" rainbow_csv
nnoremap <expr> <C-Up> get(b:, 'rbcsv', 0) == 1 ? ':RainbowCellGoUp<CR>' : '<C-Up>'
nnoremap <expr> <C-Down> get(b:, 'rbcsv', 0) == 1 ? ':RainbowCellGoDown<CR>' : '<C-Down>'
