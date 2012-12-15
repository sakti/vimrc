call pathogen#infect() 
call pathogen#helptags()

set ignorecase
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set nocursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set wrap
set textwidth=79
set formatoptions=qrnl
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
set hls
set list
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
set background=light
set t_Co=16
let g:solarized_termcolors=16
set guifont="Ubuntu Mono"
syntax on
filetype plugin indent on
filetype plugin on

if has("autocmd")
    autocmd BufWritePre *.py,*.js,*.html,*.php :call <SID>StripTrailingWhitespaces()
endif

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")

    %s/\s\+$//e

    let @/=_s
    call cursor(l,c)
endfunction

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if bufwinnr(1)
    map <kPlus> <C-W>+
    map <kMinus> <C-W>-
    map <C-Left> <c-w><
    map <C-Right> <c-w>>
endif

runtime python_flake8.vim
autocmd BufWritePost *.py call Flake8()
colorscheme default

nmap <F8> :tabn<CR>
nmap <F7> :tabp<CR>
nmap <C-t> :tabnew<CR>
let g:Powerline_symbols = 'fancy'

let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" for ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" call rainbow parenthsis
call rainbow_parenthsis#LoadSquare ()
call rainbow_parenthsis#LoadRound ()
call rainbow_parenthsis#LoadBraces ()
call rainbow_parenthsis#Activate ()
