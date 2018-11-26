
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/UltiSnips'
Plugin 'junegunn/fzf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set vim colorscheme and background
colorscheme elflord
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ cwd:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"Codestyle
set cino=N-s,g0,+2s,l-s,i2s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
			return 'PASTE MODE  '
	en
	return ''

endfunction

" Plugins
	" NERDTree
		nnoremap <Bs> :<C-u>NERDTreeToggle<CR>
"   let NERDTreeShowBookmarks=1
"		let NERDTreeChDirMode=2
"		let NERDTreeQuitOnOpen=1
"		let NERDTreeShowHidden=1
"   let NERDTreeKeepTreeInNewTab=0
"		" Disable display of the 'Bookmarks' label and 'Press ? for help' text
"		let NERDTreeMinimalUI=1
		" Use arrows instead of + ~ chars when displaying directories
"		let NERDTreeDirArrows=1
"		let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'


" UltiSnips
		let g:UltiSnipsExpandTrigger="<tab>"
		let g:UltiSnipsJumpForwardTrigger="<tab>"
		let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" ,v
		" Open the .vimrc in a new tab
		nnoremap <leader>v :<C-u>tabedit $MYVIMRC<CR>
		:cabbrev e NERDTreeClose<CR>:e!

" Switch tabs with <Tab>
		nnoremap <Tab> gt
		nnoremap <S-Tab> gT
		" FZF                                                                                       
		let g:fzf_history_dir = '~/.local/share/fzf-history'                                        
		function! s:find_root()                                                                     
			for vcs in ['.git', '.svn', '.hg']                                                        
				let dir = finddir(vcs.'/..', ';')                                                       
				if !empty(dir)                                                                          
					execute 'FZF' dir                                                                     
					return                                                                                
				endif                                                                                   
			endfor                                                                                    
			FZF                                                                                       
		endfunction                                                                                 
																																														
		command! FZFR call s:find_root()                                                            
		nnoremap <C-p> :FZFR<CR> 

" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

