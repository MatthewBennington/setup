set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"Added by Matt:

Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'andreimaxim/vim-io'
Plugin 'adimit/prolog.vim'
Plugin 'valloric/youcompleteme'
Plugin 'ap/vim-css-color'
Plugin 'airblade/vim-gitgutter'
Plugin 't9md/vim-choosewin'
Plugin 'rafi/vim-tinyline'
Plugin 'keith/swift.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-sensible'
Plugin 'rhysd/vim-crystal'
Plugin 'tpope/vim-markdown'
Plugin 'vim-syntastic/syntastic'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-rails'

"/Added by Matt

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic stuff:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2

let g:syntastic_cpp_checkers=['gcc', 'cppcheck']
let g:syntastic_crystal_checkers=['crystal']

let g:syntastic_cpp_compiler_options = ' -std=c++11'
" /Syntastic stuff
syntax on
set number
set relativenumber
set ruler
set tabstop=4
set shiftwidth=4
set background=dark
colorscheme solarized
autocmd BufNewFile *.html,*.htm,*.php source ~/.vim/ftplugin/htmltemplate.vim
let g:ycm_show_diagnostics_ui = 0
nmap  -  <Plug>(choosewin)
set backspace=indent,eol,start
let delimitMate_expand_cr=1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap Q @q
set foldmethod=syntax
set nofoldenable
set mouse=""
