" Notes
" <silent> tells vim to show no message when this key sequence is used

" Leader key
let mapleader = " "

syntax on
:set nocompatible
:set nowrap
:set incsearch
:set nohlsearch	
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set scrolloff=10
:set mouse=a

"Specify a directory for nvim plugins
call plug#begin('~/.vim/plugged/')

Plug 'https://github.com/ryanoasis/vim-devicons' "Vim Dev Icons
Plug 'https://github.com/vim-airline/vim-airline'  "Status Bar
Plug 'https://github.com/neoclide/coc.nvim' "Language Auto Completion
Plug 'https://github.com/tpope/vim-commentary' "Comment stuff out
Plug 'https://github.com/Raimondi/delimitMate' "Auto completion for quoutes, brackets, parens... Plug 'frazrepo/vim-rainbow' "Rainbow Brackets
Plug 'nvim-telescope/telescope.nvim' "Telescope as Fuzzy Finder
Plug 'sbdchd/neoformat' "Formatting Code
Plug 'morhetz/gruvbox' "Colorscheme
Plug 'sheerun/vim-polyglot' " Language Syntax Highlighting
Plug 'preservim/nerdtree' "File System Explorer
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-lua/plenary.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'christoomey/vim-tmux-navigator' " Tmux navigator
Plug 'https://github.com/machakann/vim-highlightedyank'

call plug#end()

" Enable rainbow brackets
let g:rainbow_active = 1 
let g:go_bin_path = "/usr/local/go/bin"
let g:highlightedyank_highlight_duration = 1000

" Golang hig consumes a ton of RAM wtf :(
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_operators = 1

" Set gruvbox colorscheme
colorscheme gruvbox

" Basic remapps baby
nnoremap <leader>pl <cmd>PlugInstall<CR>
nnoremap <leader>pc <cmd>PlugClean<CR>

" Telescope mappings
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" NERDTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tmux Split mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-p> :TmuxNavigatePrevious<cr>
" Split tmux pane to vertically
nnoremap <silent> <Leader>- :split<CR>  
" Split tmux pane to horizontally
nnoremap <silent> <Leader>\ :vsplit<CR> 
" Close tmux pane
nnoremap <silent> <Leader>q :close<CR> 
" Open terminal
nnoremap <leader>t :term<CR>
" Save current file
nnoremap <C-s> :w<CR>

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"Execut current Go gile
" nnoremap <C-r>r :!go run %<CR>
nnoremap <leader>r :!go run %<CR>

" Format files on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
