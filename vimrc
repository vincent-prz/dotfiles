" set nocompatible              " required
" filetype off                  " required
set nocompatible | filetype indent plugin on | syn on
set fileencodings=utf-8
set encoding=utf-8
set nu
set noswapfile
set diffopt+=vertical

""""" KEY BINDINGS """""
let mapleader=","

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"

" disable j and k for more efficient vertical moves
" noremap j <NOP>
" noremap k <NOP>
"
" navigate between tabs
nnoremap H gT
nnoremap L gt
"
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
Plugin 'jonathanfilip/vim-lucius'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'Valloric/YouCompleteMe'
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
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css:
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
set colorcolumn=80

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" fzf key binding
map <C-p> :FZF<CR>

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

" allow pasting outside of vim
set clipboard=unnamed

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
