set term=xterm
set autoread                    " Don't bother me hen a file changes
set ruler                       " Show row/col and percentage
set ignorecase                  " Case insensitive
set noerrorbells
set expandtab
set smarttab
set tabstop=4
set number
set autoindent
set shiftround
set shiftwidth=4
set hlsearch                    " enable search highlighting
set incsearch                   " enable incremental search
set backspace=indent,eol,start  " Allow backspace beyond insertion point
set laststatus=2
set noshowmode
set wildmenu                    " Show possible completions on command line
set wildmode=list:longest,full  " List all options and complete
filetype indent plugin on

" vim-Plug
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" Initialize plugin system
call plug#end()

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Section: Color and syntax {{{1
"--------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with newer 256
" color terminals like iTerm2.
set background=dark
let g:rehash256 = 1
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
  if $TMUX != ""
    set t_ut=
  endif
endif
syntax on
