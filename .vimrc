"
" Vim configuration file
"
" Revision History:
"
"   12/08/17        (by Tim) show line numbers
"
"   12/08/10        (by Tim) added an autocomplete function
"
"   12/07/17        (by Tim) remap the <Esc> key
"
"   12/07/17        (by Tim) set the alias of tabe
"
"   12/06/27        (by Tim) set the maximum number of allowed tabs
"
"   10/10/27        use default comment recognition rules
"
"   10/10/17        created and set a custom color scheme: han-desert
"
"   09/06/20        use background syntax highlighting
"

" Tim's change: show line numbers.
set nu

" Tim's change: Remap the esc key.
"imap vv <Esc>
"vmap vv <Esc>

" Tim's change: Set the maximum number of allowed tabs to be 5000.
set tabpagemax=5000

" Use vim settings, rather than vi settings.
set nocompatible

" Enable nice identation.
set autoindent
autocmd BufRead,BufNewFile *.* set smartindent
autocmd BufRead,BufNewFile *.txt,*.TXT,*.tex set nosmartindent
autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.java,*.cu set nosmartindent cindent

" What is considered comment? DO NOT surround it with quotes.
" set comments=sr:/*,mb:*,ex:*/,fb:-

" Format options:
" tcq: basic options
" r: add comment-lead when pressing Enter
" o: add comment-lead when pressing 'o'
" n: recognize numbered lists
set fo=tcqn
autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.java,*.cu set fo=croqn

set shiftwidth=4

" Set the tab width to be 4.
set tabstop=4

" A tab is converted to spaces. To type a real tab, use ^V<tab>
set expandtab

" Let the COL/ROW number show at the bottom right corner.
set ruler

" Incremental search (search when typing)
set incsearch

" Enable search highlighting. Use :noh to erase all highlights.
set hlsearch

" Enable syntax coloring.
if &t_Co > 1        " t_Co stores the number of available colors
	syntax enable
    " Set the color scheme.
     colorscheme han-desert
    " Tim's change: commented out David's colorscheme for the default scheme.
    " colorscheme default
else
	let loaded_matchparen = 1
endif

" In text files, always limit the text width to 78 characters
" We can use v4jgq or gqap to rejustify paragraphs.
" autocmd BufRead,BufNewFile *.txt,*.TXT,*.tex set tw=78
" Tim's change: commented out the max tab width.
"set tw=78

" Enable folding on source code files (:help folding).
" zf[ap], zo/zc, zr/zm, zR/zM, zi
"autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.java,*.cu set foldmethod=indent

" Treat CUDA files (.cu) as C++ files
"autocmd BufRead,BufNewFile *.cu set filetype=cpp

" A shortcut to enter a couple of lines of comments
"command Dc r ${HOME}/.vim/comment-delim.txt

" Enable tag jumping
"set tags=${HOME}/ece454/hw5/tags
"set tags=${HOME}/Desktop/lab5/tags
"set tags=${HOME}/ece552/lab4/simplesim-3.0d-assig4/tags
"set tags=${HOME}/ece454/hw2/tags
set tagrelative

" Include other vim macros
" :source $HOME/.vimplugins/justify.vim

" Tim's change: shows the number of lines highlighted in visual.
set showcmd

" Tim's change: added a smart autocomplete for tab.
" Code from: http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion
"function! Smart_TabComplete()
 "let line = getline('.')                         " current line
"
 "let substr = strpart(line, -1, col('.'))      " from the start of the current
                                                 "" line to one character right
                                                 "" of the cursor
 "let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
 "if (strlen(substr)==0)                          " nothing to match on empty string
   "return "\<tab>"
 "endif
 "let has_period = match(substr, '\.') != -1      " position of period, if any
 "let has_slash = match(substr, '\/') != -1       " position of slash, if any
 "if (!has_period && !has_slash)
   "return "\<C-N>"
""   return "\<C-X>\<C-P>"                         " existing text matching
"" elseif ( has_slash )
""   return "\<C-X>\<C-F>"                         " file matching
"" else
""   return "\<C-X>\<C-O>"                         " plugin matching
"" endif
"endfunction

" Map the autocomplete to tab
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

syntax on

" some tab mappings
nnoremap e :tabprevious<CR>
nnoremap r   :tabnext<CR>
"inoremap r <Esc>:tabprevious<CR>i
"inoremap t   <Esc>:tabnext<CR>iQ
nnoremap > <C-]>
nnoremap < <C-T>
nnoremap s <C-W>w
nnoremap S <C-W>W
"nnoremap - <PageDown>
"nnoremap = <PageUp>
"nnoremap . /
nnoremap m <C-e>
nnoremap , <C-y>
"ca . CtrlP .
set cursorline

" Configure vim pathogen
"execute pathogen#infect()
"let g:NERDTreeDirArrows=0


colorscheme torte

"set mouse=a
"set ttymouse=xterm2


"#filetype plugin on
"set omnifunc=syntaxcomplete#Complete

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

inoremap <C-v> <ESC>"+pa
nnoremap <C-v> <ESC>"+pa<ESC>
vnoremap <C-c> "+y
vnoremap <C-d> "+d

"This unsets the "last search pattern" register by hitting return
nnoremap <ESC> :noh<CR>
"if has('gui_running')
"  nnoremap <silent> <esc> :nohlsearch<return><esc>
"else
"  " code from above
"  augroup no_highlight
"    autocmd TermResponse * nnoremap <esc> :noh<return><esc>
"  augroup END
"
"end
