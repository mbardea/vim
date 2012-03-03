set ignorecase
set smartcase
set number
set shellslash
set nocompatible
set hidden
set nowrap
set history=1000
set guioptions-=T
set title
set scrolloff=3
set hlsearch
set incsearch
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp    
set noerrorbells

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4 
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start
set wildmenu
set t_Co=256

call pathogen#infect()
call pathogen#helptags()

"let mapleader = ","
nmap <leader>q :bd<cr>
nmap <silent> <leader>df gf<leader>diff<cr>
"set nobackup
"set noswapfile
nmap <C-j> :bn<cr>
nmap <C-k> :bp<cr>

nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
inoremap jj <esc>

"For surround
"nmap s      <Nop>
"nmap sw     viwS
"nmap sW     viWS
"nmap ss     visS
"nmap sp     vipS
"nmap s[     vi[S
"nmap s]     vi]S
"nmap s(     vi(S
"nmap s)     vi)S
"nmap s{     vi{S
"nmap s}     vi}S
"nmap s<     vi<S
"nmap s>     vi>S
"nmap st     vitS
"nmap s'     vi'S
"nmap s"     vi"S
"nmap s`     vi`S
"
"nmap S      <Nop>
"nmap Sw     vawS
"nmap SW     vaWS
"nmap Ss     vasS
"nmap Sp     vapS
"nmap S[     va[S
"nmap S]     va]S
"nmap S(     va(S
"nmap S)     va)S
"nmap S{     va{S
"nmap S}     va}S
"nmap S<     va<S
"nmap S>     va>S
"nmap St     vatS
"nmap S'     va'S
"nmap S"     va"S
"nmap S`     va`S


set csqf=s-,g-,d-,c-,t-,e-,f-,i-
cs add cscope.out

syntax on
filetype plugin indent on

set listchars=tab:>-,trail:·,eol:$
"nmap <silent> <leader>s :set nolist!<CR>

colorscheme molokai2
runtime macros/matchit.vim

:map <Leader>diff :VCSVimDiff<cr>

" Comments
" Perl, Python, Ruby, shell scripts
autocmd BufNewFile,BufRead *.rb,*.py,*.pl,*.sh vmap u :-1/^#/s///<CR>
autocmd BufNewFile,BufRead *.rb,*.py,*.pl,*.sh vmap c :-1/^/s//#/<CR>
" C, C++
autocmd BufNewFile,BufRead *.h,*.c,*.cpp vmap u :-1/^\/\//s///<CR>
autocmd BufNewFile,BufRead *.h,*.c,*.cpp vmap s :-1/^/s//\/\//<CR>

nmap <F3> :cp<enter>
nmap <F4> :cn<enter>
nmap <F5> :cfile build_log<cr>:copen<cr>/error<cr>
nmap <F6> :cp<enter>
nmap <F7> :cn<enter>
nmap <F8> :cfile build_log<cr>:copen<cr>/error<cr>
nmap <leader>l :view cscope.files<cr>/

runtime macros/gdb_mappings.vim

" Fold at previous search pattern
" User zr to display more, zm to display less
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

let vimclojure#NailgunClient = "/home/mbardea/bin/ng"
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let clj_want_gorilla = 1

let g:gccsenseUseOmniFunc = 1

function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>nt :NERDTreeToggle<cr>

imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>