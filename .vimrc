set nocompatible
syntax on           " turn on syntax highlighting
filetype plugin on
filetype indent on

call pathogen#infect()  "activate pathogen

set history=100     " store lots of :cmdline history

set undodir=~/.vimundo
set undofile        " save undo history

hi clear MatchParen " don't highlight matching braces
set incsearch       " match as each character is entered

set mouse=a         " allow using the mouse to resize windows, highlight text, etc.

set directory=~/.vimswap  " store all swap files in the same place

set ignorecase      " ignore case for search
set smartcase       " don't ignore case when capitals present
set nowrap          " don't wrap lines

set shiftwidth=2    " use two spaces for indent
set tabstop=2       " tabs appear two spaces wide
set expandtab       " use spaces instead of <tab>
set smarttab        " <bs> deletes a shiftwidth of spaces

set scrolloff=3     " keep three spaces above/below cursor
set sidescrolloff=7 " keep seven spaces left/right of cursor
set sidescroll=1    " scroll horizontally by only one

set t_Co=256        " use more colors

set hidden          " allow switching from buffers with changes

set backspace=2     " <bs> deletes everything in insert mode

set ruler           " display current position

set foldnestmax=4   " keep folds from going annoyingly deep
hi Folded ctermbg=NONE
hi Folded ctermfg=Yellow
set fillchars="fold: "
autocmd Syntax ruby,eruby setlocal foldmethod=syntax
autocmd Syntax ruby,eruby normal zR

" jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! SetDocumentEdit( arg )
  set wrap lbr
  set spell
  set noexpandtab
  noremap k gk
  noremap j gj
	noremap $$ $
	noremap $ g$
	noremap ^^ ^
	noremap ^ g^
endfunction
command! -nargs=* DocEdit call SetDocumentEdit( '<args>' )


" key remaps
inoremap jk <esc>
inoremap kj <esc>
inoremap m, <esc>
inoremap ,m <esc>
vnoremap m, <esc>
vnoremap ,m <esc>

nnoremap Y y$
nnoremap <space> za

nnoremap <f2> :NERDTreeToggle<cr>
