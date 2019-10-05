" set nocompatible              " required
" filetype off                  " required
set nocompatible | filetype indent plugin on | syn on
set fileencodings=utf-8
set encoding=utf-8
set noswapfile
set diffopt+=vertical

""""" KEY BINDINGS """""
let mapleader=","

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable ex mode
noremap Q <NOP>

" disable h, l for more efficient vertical moves
" noremap h <NOP>
" noremap h <NOP>
" noremap l <NOP>
" noremap l <NOP>

" navigate between tabs
nnoremap H gT
nnoremap L gt
"

"To create a new tab
nnoremap <C-t> :tabnew<Enter>
inoremap <C-t> <Esc>:tabnew<Enter>

" fzf key binding
map <C-p> :FZF<CR>
"

" nerdtree
map <C-n> :NERDTreeToggle<CR>
"

" Easier split navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change pydocstring shortcut, to prevent collision with split nav (default
" was <C-l> (FIXME doesn't work)
nmap <silent> <C-Semicolon> <Plug>(pydocstring)

" Remap CapsLock on Esc

" nnoremap <CapsLock> <Esc>

"ghcmod
" nnoremap <Leader>ht :GhcModType<cr>
" nnoremap <Leader>htc :GhcModTypeClear<cr>

""""" END KEY BINDINGS """""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'w0rp/ale'
Plugin 'tommcdo/vim-exchange'
Plugin 'rhysd/vim-color-spring-night'
Plugin 'flowtype/vim-flow'
Plugin 'tpope/vim-surround'
Plugin 'reasonml-editor/vim-reason'
Plugin 'elmcast/elm-vim'
Plugin 'jremmen/vim-ripgrep' 
Plugin 'airblade/vim-gitgutter'
Plugin 'ambv/black' "python formatter
Plugin 'alx741/vim-hindent' "haskell formatter

" Haskell stuff
" Plugin 'eagletmt/ghcmod-vim'

" vimproc
Plugin 'Shougo/vimproc'

" snipmate and dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css,*.java:
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


let python_highlight_all=1
syntax on

colorscheme summerfruit256
set termguicolors
set cursorline
set colorcolumn=88

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"Powerline setup
" Always show statusline
set laststatus=2

" airline fonts. Note: need to install powerline fonts for airline / powerline to work
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" allow pasting outside of vim (including tmux!)
set clipboard=unnamedplus

" black setup
let g:black_linelength = 88

"jedi-vim: python completion and more
"Completion <C-Space>
"Goto assignments <leader>g (typical goto function)
"Goto definitions <leader>d (follow identifier as far as possible, includes
"imports and statements)
"Show Documentation/Pydoc K (shows a popup with assignments)
"Renaming <leader>r
"Usages <leader>n (shows all the usages of a name)
"Open module, e.g. :Pyimport os (opens the os module)
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = "left"

""""" ale stuff """""
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

" display ale errors in airline
let g:airline#extensions#ale#enabled = 1
