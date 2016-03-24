"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To have vim-latex plugin automatic loaded in .tex files
let g:tex_flavor='latex'

" associate *.gpl with GNUplot filetype
au BufRead,BufNewFile *.gpl setfiletype gnuplot

" Sets how many lines of history VIM has to remember
set history=50

" Apre automaticamente Tlist
let Tlist_Auto_open=1
"let Tlist_Auto_Update=0

" Apre automaticamente TagBar per ogni tab
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" no-compatible
set nocp

" Enable filetype plugins
filetype plugin on
filetype indent on
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Move taglist window to the right
let Tlist_Use_Right_Window = 1

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Add plugin paths
set runtimepath+=$HOME/.vim/cvim
set runtimepath+=$HOME/.vim/taglist
set runtimepath+=$HOME/.vim/vim-latex

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
"set colorcolumn=90

" Turn on WiLd Menu
set wildmenu
set wildmode=full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" Always shows current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,[,]

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" For regular expressions turn magic on
set magic

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
"set t_vb=
"set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
"colorscheme evening
"colorscheme pablo
"colorscheme torte
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set guioptions+=i "use a Vim icon
	set t_Co=256
	set guitablabel=%M\ %t
	colorscheme colorsbox-stnight
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup before rewriting file
"set backup
set nobackup
set backupcopy=auto "yes,no

"set writebackup
set nowritebackup

"set swapfile
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak
"set wrap

"set textwidth=0
"set wrapmargin=0

"set linebreak
"set showbreak=">\
" let &showbreak='+++ ' Default characters to break line at
"set breakat=" ^I!@*-+;:,./?"
" 'list' option disables 'linebreak'
"set nolist

" Automatic formatting of paragraphs. Every time text is inserted or deleted
" the paragraph will be reformatted
"set formatoptions+=a
" Don't break a line after a one-letter word. It's broken before it instead 
" (if possible).
"set formatoptions+=1
" Long lines are not (with l) broken in insert mode
"set formatoptions+=l
" Remove a comment leader when joining lines
"set formatoptions-=j
" Trailing white space indicates a paragraph continues in the next line.  
" A line that ends in a non-white character ends a paragraph.
"set formatoptions+=w

set autoindent
set smartindent 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=%{HasPaste()}%F%M%r%h
"set statusline+=%w\ \ CWD:\ %{getcwd()}
"set statusline+=%=        " Switch to the right side
"set statusline+=Line:
"set statusline+=\ %l        " Current line
"set statusline+=/         " Separator
"set statusline+=%L        " Total lines
"set statusline+=\ (%P)

set statusline=%-6{FileSize()} "file size
set statusline+=\ %4*  "switch to User4 highlight
set statusline+=%m       "modified flag
set statusline+=%*\   "switch to normal highlight
set statusline+=%F\        "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
"set statusline+=%w\ \ CWD:\ %{getcwd()}
set statusline+=%h      "help file flag
set statusline+=%4*  "switch to User4 highlight
set statusline+=%r      "read only flag
set statusline+=%*  "switch to normal highlight
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%6*\ %c\       "cursor column
set statusline+=%3*  "switch to User3 highlight
set statusline+=%l
set statusline+=%5*/%L   "cursor line/total lines
set statusline+=%3*  "switch to User4 highlight
set statusline+=\ %P    "percent through file

"define 3 custom highlight groups
hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
hi User3 ctermfg=green  guifg=green
hi User4 ctermfg=red guifg=red
hi User5 ctermfg=black guifg=gray
hi User6 ctermfg=blue guifg=blue

" evaluate file size of file
function! FileSize()
	let bytes = getfsize(expand("%:p"))
	if bytes <= 0
		return ""
	endif

	" if it's less than 1 KB
	if bytes <= 1024
		" return size in B
		return bytes . "B"
	endif
	
	" if it's less than 1 MB
	if bytes <= 1024 * 1024
		" return size in KB
		return ( bytes / 1024 ) . "KB"
	endif

	" if it's less than 1 GB
	if bytes <= 1024 * 1024 * 1024
		" return size in MB
		return ( bytes / ( 1024 * 1024 ) ) . "MB"
	endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
