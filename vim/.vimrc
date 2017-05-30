" vim:fdm=marker:fen:fdl=0
""""" PLUGINS {{{1

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'airblade/vim-gitgutter' " git indicators in gutter
Plug 'benmills/vimux'         " tmux integration
Plug 'embear/vim-localvimrc'  " local vimrc files
Plug 'janko-m/vim-test'       " test wrapper
Plug 'joshdick/onedark.vim'   " onedark colourscheme
Plug 'tomasr/molokai'         " molokai colourscheme
Plug 'sheerun/vim-polyglot'   " language packs
Plug 'tpope/vim-commentary'   " better commenting
Plug 'tpope/vim-fugitive'     " git plugin
Plug 'tpope/vim-rails'        " rails plugin
Plug 'tpope/vim-vinegar'      " netrw sensible defaults
Plug 'rking/ag.vim'           " silver searcher
Plug 'kien/ctrlp.vim'         " Quick file fuzzy search
Plug 'c-brenn/phoenix.vim'    " Rails Vim for Phoenix
Plug 'tpope/vim-projectionist'
Plug 'slashmili/alchemist.vim'
Plug 'craigemery/vim-autotag'
Plug 'neomake/neomake'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'elmcast/elm-vim'

" Add plugins to &runtimepath
call plug#end()

""" Splits
set splitbelow " new split opens below
set splitright " new split opens right

""" Additional Config
set noswapfile
set backspace=2   " Backspace deletes like most programs in insert mode
set ruler         " show the cursor position all the time
set autowrite     " Automatically :write before running commands
set complete+=kspell

""" Tabs
set expandtab    " expand tabs into spaces
set shiftwidth=2 " use 2 columns for <</>>
set tabstop=2    " use 2 spaces for tab in insert mode

""" No Error bells
set noerrorbells

""" Scrolling
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

set nolist

""" Search
nnoremap <space> :nohlsearch<CR> " rm search highlight on <space>

""" Undo
set undofile                " persistent undo
set undodir=$HOME/.vim/undo " must create this dir
set undolevels=1000         " set undo history
set undoreload=10000        " set lines to save for undo

""" Buffers
set hidden " allow hidden buffers



















""mocha --compilers js:babel-core/register""""" MOVEMENT {{{1

""" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l







""""" AESTHETICS {{{1

""" UI
if exists('+colorcolumn')
  set colorcolumn=80       " highlight column 80
  highlight ColorColumn ctermbg=0 guibg=lightgrey
end
set cursorline             " highlight current line
set list listchars=trail:· " use · to indicate trailing chars
set number                 " show current line number
set showcmd                " show current command in status line
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

""" Use 24-bit colours
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

""" Colourscheme
syntax on " syntax highlight
colorscheme onedark
let g:onedark_termcolors=256

""" Fix for cursor when running under tmux
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

""" Enable syntax highlighting in markdown blocks
let g:markdown_fenced_languages = [
      \'coffee',
      \'css',
      \'javascript',
      \'js=javascript',
      \'json=javascript',
      \'ruby',
      \'sass',
      \'xml',
      \'html',
      \'elixir'
      \]

""" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

""" vim explore
nnoremap <silent> <leader>e :Sexplore<CR>
nnoremap <silent> <leader>re :Rexplore<CR>

""" vim resize
nnoremap <silent> <Leader>+ :exe "resize +10"
nnoremap <silent> <Leader>- :exe "resize -10"
nnoremap <silent> <Leader>> :exe "vertical resize +10"
nnoremap <silent> <Leader>< :exe "vertical resize -10"

""" vim copy
nnoremap <silent> <Leader>c :!tee >(pbcopy)

""" vim tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

let test#strategy = 'vimux' " use vimux test strategy

""" Write/Quit
command! WQ wq " WQ = wq
command! Wq wq " Wq = wq
command! W w   " W = w
command! Q q   " Q = q

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Elixir
let g:alchemist_tag_disable = 1

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set timeoutlen=1000 ttimeoutlen=0

""" Neomake
let g:neomake_verbose=3
let g:neomake_open_list=2
let g:neomake_list_height=20
autocmd! BufWritePost * Neomake

let mapleader=","

