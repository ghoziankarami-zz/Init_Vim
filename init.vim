"set shell=/home/ghoziankarami/.local/bin/kitty
set encoding=utf-8
set autoindent
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start
set smarttab
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix
let mapleader = ' '
let maplocalleader = " "
"Map Neovim yank's buffer to your clipboard buffer
set clipboard+=unnamedplus


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' "delete and insert bracket
Plug 'jiangmiao/auto-pairs' "auto bracket
Plug 'scrooloose/nerdtree' "File Explorer
Plug 'preservim/nerdcommenter' "Comment and uncomment by Ctr C
Plug 'itchyny/lightline.vim' "minimal status bar
Plug 'preservim/tagbar' "Varible information press <<F8>
Plug 'KKPMW/vim-sendtowindow' "send the code to the terminal
Plug 'ncm2/ncm2' "autocompletion
Plug 'roxma/nvim-yarp' "auotocompletion 2
Plug 'ncm2/ncm2-bufword' "buff autocompletion
Plug 'ncm2/ncm2-path' "Path autocompletion
Plug 'ncm2/ncm2-jedi' "Python autocompletion using jedi library
Plug 'gaalcaras/ncm-R' "R autocompletion
Plug 'jalvesaq/Nvim-R' "R Integration on nvim
Plug 'dense-analysis/ale' "flake8
Plug 'fisadev/vim-isort' " Python sort imports
Plug 'mhinz/vim-startify' "start menu for vim 
Plug 'goerz/jupytext.vim' "COnverting ipynb to py
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } "markdown preview
Plug 'untitled-ai/jupyter_ascending.vim' " write jupyter notebook with syn
Plug 'junegunn/goyo.vim' "Distraction free for writing
"Plug 'junegunn/seoul256.vim' "Seoul Theme
Plug 'preservim/vim-colors-pencil' "Colors Pencil Theme
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'rhysd/vim-grammarous'
Plug 'sirver/UltiSnips' "For Snippet
Plug 'ncm2/ncm2-ultisnips' "Snippet
Plug 'ryanoasis/vim-devicons' "change icon for nerdtree ALWAYS PUT DEVICONS ON LAST ONE
call plug#end()    

"theme configuration
:colorscheme pencil
:set background=dark
":set background=light
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_terminal_italics = 1

"Plugin configuration
"Ale Linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
" Jupytext
let g:jupytext_enable = 1
let g:jupytext_command = 'jupytext'
let g:jupytext_fmt = 'py'
let g:jupytext_to_ipynb_opts = '--to=ipynb --update'
let g:jupytext_filetype_map = {'md': 'py'}
" ncm 2
augroup ncm2
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
set completeopt=noinsert,menuone,noselect
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
 " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
"Use this mapping to close the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" NERDTree
let NERDTreeQuitOn0pen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>
" Makrdown Preview
"let g:mkdp_auto_start = 1
"Latex Preview
let g:livepreview_cursorhold_recompile = 0
"Languagetool



"Key Mapping
:imap ii <Esc>
map <Leader>v :vsp<CR> 
map <Leader>h :sp<CR>
map <Leader>t :term<CR>
:tnoremap <Esc> <C-\><C-n>
"Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>

"nerd commenter
noremap <Right> <Nop>" NERDCommenter
nmap <C-c> <Plug>NERDCommenterToggle
vmap <C-c> <Plug>NERDCommenterToggle<CR>gv
" Tagbar
nmap <F8> :TagbarToggle<CR>
:set completeopt-=preview " For No Previews
" send to windows plugin
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>tv <C-w>t<C-w>H
map <Leader>th <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tr :new term://bash<CR>iR<CR>
map <Leader>tp :new term://bash<CR>iipython<CR>
" to send selection to terminal: <leader> hjkl
" <space>j + $ send lines
"Jupyter ascending
nmap <space><space>x <Plug>JupyterExecute
nmap <space><space>X <Plug>JupyterExecuteAll
"Use # %% to separate cells.
"Latexpreview
map <Leader>tl :LLPStartPreview<CR>
"Goyo
map <Leader>tg :Goyo<CR>

"Gramarous
map <Leader>g :GrammarousCheck<CR>
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><Leader>n <Plug>(grammarous-move-to-next-error)
    nmap <buffer><Leader>p <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><Leader>n
    nunmap <buffer><Leader>p
endfunction
:nmap <Leader>w <Plug>(grammarous-move-to-info-window)
:nmap <Leader>ga <Plug>(grammarous-fixall)
let g:grammarous#use_location_list = 1
