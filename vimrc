" THIS IS AN UNHOLY MIX OF STUFF, THINGS AND WOTSITS. USE AT THINE PROPER PERIL.

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" Disable mode lines to prevent unwanted code execution (CVE-2007-2438)
set modelines=0

" Searching
set ignorecase
set smartcase
set incsearch
map <F7> :set hlsearch!<CR>

" Interface
set ruler
set laststatus=2
set showmode
set showmatch
set showcmd
set nowrap
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·
set mouse=a
map <F8> :set list!<CR>

" Buffers, tabs and windows
nnoremap <Leader>b :buffers<CR>:buffer<Space>

set splitright
set splitbelow

set tabpagemax=1024

" History
set history=1024
set undolevels=1024

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Syntax highlighting
color twilight256
syntax on
syntax sync fromstart
set synmaxcol=16384

" Indentation settings
set autoindent

" Do not extend the visual selection beyond the last character.
vnoremap $ $h

" Whitespace settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Open resource


" Ruby has whitespace other settings
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

" Auto-completion
set wildmode=longest,list,full
set wildmenu

" Folding
set foldmethod=marker

" Highlight log levels
highlight Warning ctermfg=yellow
autocmd BufWinEnter * match Warning /^\[warn\].*/
highlight Error ctermfg=red
autocmd BufWinEnter * match Error /^\[\(fatal\|error\|err\)\].*/
highlight Info ctermfg=green
autocmd BufWinEnter * match Info /^\[\(info\|notice\)\].*/

" Do not pollute the working directory with swap and other files
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" From http://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/
function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

"au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
"au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
"set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=blue ctermfg=white
"hi StatColor guibg=#95e454 guifg=black ctermbg=blue ctermfg=white
"hi Modified guibg=orange guifg=black ctermbg=blue ctermfg=red
" ^^ ^^ ^^ end of http://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/

" Easier input through insert mode mappings, abbreviations and digraphs
" -----------------------------------------------------------------------------
" Used everywhere, independent of file type.

ab ... …
ab <3 ♥
	" Note: <3 is jarring when using XML/HTML, because the cursor does not
	" immediately move to the right when typing “<”, because there might be a
	" “3” coming up.
dig <3 2665 " ♥
	" Related predefined digraphs:
	" cS: ♠ = black spade
	" cH: ♡ = white heart (think: _c_ard _H_earts)
	" cD: ♢ = white diamond
	" cC: ♣ = black club

" Map the Mac US QWERTY keyboard combinations; easier than using digraphs
" Note that these conflict pretty badly with any action immediately after
" exiting insert mode. For example: “Oh shit, mistake”, <Esc> to exit insert
" mode, immediately followed by “u” to undo. Either I will retrain myself to
" always use <Esc> twice, or –better yet– fix the bloody terminal to send <Alt>
" instead of <Esc>.
imap <Esc>@ €
imap <Esc>- –
imap <Esc>_ —
imap <Esc>; …
" imap <Esc>g ©
" imap <Esc>r ®
" imap <Esc>p π
" imap <Esc>P Π
" imap <Esc>[ “
" imap <Esc>{ ”
" imap <Esc>] ‘
" imap <Esc>} ’
" Alt+U triggers the ¨ diacritical mark, which will be combined with the next
" character if possible.
" imap <Esc>u ¨
" imap <Esc>ua ä
" imap <Esc>ue ë
" imap <Esc>ui ï
" imap <Esc>uo ö
" imap <Esc>uu ü
" imap <Esc>uy ÿ
" Alt+I triggers the ˆ diacritical mark, which will be combined with the next character if possible
" imap <Esc>i ˆ
" imap <Esc>ia â
" imap <Esc>ie ê
" imap <Esc>ii î
" imap <Esc>io ô
" imap <Esc>iu û
" imap <Esc>iy ÿ

" Shell scripts.
" Print all positional parameters.
autocmd FileType sh,bash :ab foreach for ((i = 0; i <= $#; i++)); do echo "$i: \"${!i}\""; done;

" Use ack for searching.
set grepprg=ack

" Show line numbers and make them 5 characters wide
map <F6> :set number!<CR>
set numberwidth=5

" Show information concerning the current position in the document.
set ruler

"syn on
"set history=1000
"set wildmenu
"set ignorecase
"set smartcase
"set title
"set backspace=indent,eol,start
"set hlsearch
"set incsearch
"set colorcolumn=100
"colorscheme desert

if has("gui_running")
	set guioptions=egmrt
endif
