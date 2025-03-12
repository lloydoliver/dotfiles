" plugin loading with pathogen
execute pathogen#infect()

""" Plugin loading with vim-plug
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'luochen1990/rainbow'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'

call plug#end()

""""""" defaults
syntax on
set nocompatible
set showmode
set nohlsearch
set nrformats-=octal
filetype plugin indent on
set t_Co=256
set nofoldenable
set mouse=
set number
call neomake#configure#automake('nrwi', 500)

" disable ex mode
nnoremap Q <Nop>

" Spell check
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

""""""" binds
let mapleader = "\<Space>"


" git commit
map <F9> :Gwrite<CR>:let @" =expand('%:t')<CR>:Gcommit<CR>pA:<Space>

" pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
map <F1> :set nu!<CR>:set relativenumber!<CR>

" Anti Cam button
map <F7> mzgg=G`z<CR>

" whitespace
map <F8> :StripWhitespace<CR>

" spelling
map <F3> :set spell!<CR>

" NeoMake / linting
map <F6> :set Neomake!<CR>

""""""" movement
" make navigating splits easier
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" make navigating tabs easier
map <Leader>l <esc>:tabprevious<CR>
map <Leader>h <esc>:tabnext<CR>
" map sort function to a key
vnoremap <Leader>s :sort<CR>

""""""" dirs
set directory=~/.vim/.swap//
set backupdir=~/.vim/.tmp//
set undodir=~/.vim/.undo//

""""""" tabs and indents
set expandtab
set tabstop=2
set shiftwidth=2
" easier code indenting
vnoremap < <gv
vnoremap > >gv
" tabs and indents per file type
autocmd Filetype sls setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype yml setlocal ts=2 sts=2 sw=2
autocmd Filetype jinja syntax on

" Showing line numbers and length
set colorcolumn=80
highlight ColorColumn ctermbg=233

"""" PLUGIN SETTINGS
let g:rainbow_active = 1

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" generate 128char pw
nnoremap <F6> :r! pwgen 128 -s -1<CR>kJ

nnoremap <F5> :r! ssh-keygen -t rsa -f /tmp/vimkey -N '' >/dev/null<Enter>i<Tab>ssh_rsa_priv:<Space>\|<CR><ESC>:r /tmp/vimkey<CR>kdd<C-v>GI<Tab><Tab><ESC>Go<Tab>ssh_key_pub:<Space>\|<CR><ESC>:r /tmp/vimkey.pub<CR>kddi<Tab><Tab><ESC>:r! rm -rf /tmp/vimkey*<CR>

