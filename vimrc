" .vimrc - configuration file for Vim

""""""""""""""
" vim behavior
""""""""""""""
set viminfo='1000,f1,\"500,:100,/100 "changes amount of Vim history to record
set mouse=a " allows mouse cursor to change size in all panes/windows
set hlsearch " turns search highlighting on
set ruler "displays position in file at bottom right of editor window
set number "displays line numbers at right of screen
if has("clipboard")
 set clipboard=unnamed "copy to the system clipboard if VIM compiled with +clipboard
 if has("unnamedplus") "X11 support
  set clipboard+=unnamedplus
 endif
endif
filetype plugin indent on " show existing tab with 4 spaces width

set tabstop=4 " when indenting with '>', use 2 spaces width

set shiftwidth=4 " On pressing tab, insert 2 spaces

set expandtab

" Ctrl-c to toggle hlsearch option with inv{option}
nmap <silent> <c-c> <Esc>:set invhlsearch<CR> 

""""""""""""""
" Cosmetics
""""""""""""""

let g:solarized_termcolors=256
syntax enable "option to turn syntax highlighting on
    set background=dark "background color
    colorscheme solarized "choose syntax color profile: instructions and dl of color scheme at https://github.com/altercation/vim-colors-solarized 
hi Comment ctermfg=DarkMagenta "change syntax highlighting color of comments to DarkMargenta


