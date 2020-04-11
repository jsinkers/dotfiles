" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
filetype off

" Vundle 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-sensible'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rdnetto/YCM-Generator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line
"Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" handled by vim-sensible
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
"set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Handled by vim-sensible
" Enable searching as you type, rather than waiting till you press enter.
"set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
" set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" clipboard settings for conventional copy/paste
set clipboard=unnamed
set clipboard=unnamedplus

" remap escape to jk or kj combo
inoremap jk <C-C>
inoremap kj <C-C>

" show line ending and tab characters
" set list 

" cursor settings
" https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
"autocmd InsertEnter,InsertLeave *set cul!
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" indentation
set autoindent
set smartindent
set tabstop=4    " tab width is 4 spaces
set shiftwidth=4 " indent also with 4 spaces
set expandtab      " expand tabs to spaces


if has("autocmd")
    " If the filetype is Makefile then we need to use tabs
    " So do not expand tabs into space.
    autocmd FileType make   set noexpandtab
endif

" so that when using snake case, you can use cw to change word between
" undescores: cw, and to change full word is cW
" see https://superuser.com/questions/244040/how-do-i-change-until-the-next-underscore-in-vim
set iskeyword-=_

" solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" nb for light mode
" set background=light

" Press Space to turn off highlighting and clear any message already displayed.
" https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set hlsearch

" Plugins settings
" set ctrl-n for NERDTree plugin
map <C-n> :NERDTreeToggle<CR>
" start in NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nerdcommenter says you need to do this
"filetype plugin on

" vim-syntastic airline settings
" let g:airline#extensions#syntastic#enabled = 1
" let airline#extensions#syntastic#error_symbol = 'E:'
" let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
" let airline#extensions#syntastic#warning_symbol = 'W:'
" let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0 

" let g:syntastic_c_checkers = ['syntastic-checkers-c']

" gitgutter stuff
" let g:airline#extensions#hunks#enabled = 1

" youcompleteme

" enable/disable YCM integration >
let g:airline#extensions#ycm#enabled = 1

" set error count prefix >
let g:airline#extensions#ycm#error_symbol = 'E:'

" set warning count prefix >
let g:airline#extensions#ycm#warning_symbol = 'W:'

" YCM always show the location list
"let g:ycm_always_populate_location_list = 1
" YCM line highlighting
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_open_loclist_on_ycm_diags = 1
" markdown languages
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java', 'javascript', 'c']

" search for visually selected text with //,
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" remap ctrl+space for YCM
" https://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim/12344382#12344382
"inoremap <C-@> <C-Space>

