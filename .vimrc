
" 行番号を表示
set number

" シンタックスハイライト
syntax enable
" カラーマップ
" colorscheme parabola
" colorscheme PaperColor
colorscheme gruvbox
" colorscheme lanox
" colorscheme nord
" colorscheme peaksea
" colorscheme ir_black
" colorscheme molokai
set background=dark

" カレント行ハイライト
set cursorline
" アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=None ctermbg=None

" タイトルを表示
set title

" 削除時にヤンクさせない
nnoremap <leader>d "_d
nnoremap <leader>x "_x

" tab
set expandtab
set tabstop=4
set shiftwidth=4
"set smartindent
set cindent

" emacsキーバインド
nnoremap <C-a> 0a
nnoremap <C-e> $a
inoremap <C-a> <Esc>0i
inoremap <C-e> <Esc>$a
inoremap <C-f> <Right>
inoremap <C-b> <Left>

inoremap <C-k> <Up>
inoremap <C-j> <Down>

" ターミナルを開く
set shell=zsh

nnoremap <C-@> :tab<Space>term<Return>
tnoremap <C-[> <C-w>gt
tnoremap <C-]> <C-w>gT
tnoremap <C-q> <C-c><C-d>

" タブ移動
nnoremap <C-]> gt
nnoremap <C-[> gT
nnoremap <C-t> :tabnew<Space>
nnoremap <C-q> :q<Return>

" 保存
nnoremap <C-s> :w<Return>
inoremap <C-s> <Esc>:w<Return>


" かっこの補完
" inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>

" クリップボードを連携
set clipboard+=unnamed

" insert-mode で移動できるように
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" 検索
set hlsearch
set incsearch
nnoremap  <Esc><Esc> :<C-u>nohlsearch<cr><Esc>

"ステータスライン
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2


""""" 各言語の設定
""" Python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" CoCの設定
call plug#begin('~/.vim/plugged')
  " vim-lsp
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " asyncomplete.vim
  Plug 'prabirshrestha/asyncomplete.vim'
  " rust
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " vim-vsnip
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()

syntax enable
filetype plugin indent on

" rust auto format
let g:rustfmt_autosave = 1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_snippet_dir = expand($KYOPURO_LIBRARY_DIR)
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']

