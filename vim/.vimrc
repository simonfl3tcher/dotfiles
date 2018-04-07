" vim:fdm=marker:fen:fdl=0
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
Plug 'rking/ag.vim'           " silver searcher
Plug 'kien/ctrlp.vim'         " Quick file fuzzy search
Plug 'craigemery/vim-autotag'
Plug 'neomake/neomake'
Plug 'fatih/vim-go' 
Plug 'ecomba/vim-ruby-refactoring' " Quickly refactor ruby code https://github.com/ecomba/vim-ruby-refactoring#default-bindings
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

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

autocmd! BufWritePost * Neomake

set timeoutlen=1000 ttimeoutlen=0

""" Write/Quit
command! WQ wq " WQ = wq
command! Wq wq " Wq = wq
command! W w   " W = w
command! Q q   " Q = q

""" Neomake
let g:neomake_open_list=2

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

let test#strategy = 'vimux' " use vimux test strategy



""""" MOVEMENT {{{1

""" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
nnoremap <silent> <Leader>c :pbcopy!

""" vim tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

""" Refactoring Ruby bindings
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

""" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

""" bind \a to :Ag
nnoremap \a :Ag<SPACE>

""""" AESTHETICS {{{1

""" UI
if exists('+colorcolumn')
  set colorcolumn=80       " highlight column 80
end
set cursorline             " highlight current line
set list listchars=trail:· " use · to indicate trailing chars
set number                 " show current line number
set relativenumber         " relative line numbers
set showcmd                " show current command in status line

""" Use 24-bit colours
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

""" Colourscheme
syntax on " syntax highlight

let g:onedark_terminal_italics=1
colorscheme onedark

""" GO
let g:go_version_warning = 0

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

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

