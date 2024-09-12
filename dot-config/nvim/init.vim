"TIPS :
"To use System clipboard you need xclip installed (maybe wl-copy will work
"too)
"Install Markdown Preview :call mkdp#util#install()
"
"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=
set nohlsearch
set noshowmode
set wrap linebreak
"set title"
:set title titlestring=%t titlelen=70
"exit Terminal mode with esc"
":tnoremap <Esc> <C-\><C-n>"
:tnoremap <c-w> <C-\><C-n> <c-w>
au TermOpen * set norelativenumber
au TermOpen * set nonumber
au TermEnter * :QuickScopeToggle
au TermLeave * :QuickScopeToggle


"don't show matching parenthesies while in insert mode
au InsertEnter * NoMatchParen 
au InsertLeave * DoMatchParen 

"vim-plug"
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'unblevable/quick-scope'
Plug 'iamcco/markdown-preview.nvim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'luochen1990/rainbow'
Plug 'nuchs/vim-hypr-nav'
Plug 'edluffy/hologram.nvim'
Plug 'jbyuki/instant.nvim'
call plug#end()


" Always show lightline
set laststatus=2
let g:lightline = {
			\ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly','absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'gitbranch'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#8caaee', '#ef9f76', '#a6d189', '#e78284'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		}
\	}
\}

"set Colorscheme"
syntax enable
if &term == "tmux-256color"
    colorscheme OceanicNext
	highlight Visual guibg=#FFFFFF
else
	colorscheme	catppuccin-mocha
endif

if &term == "linux"
	set notermguicolors
    colorscheme OceanicNext
	":source ~/.config/nvim/layout.vim"
	highlight Visual guibg=#0000FF
	highlight Visual guifg=#000000
endif

if &term == "xterm-kitty"
	lua require('hologram').setup{ auto_display = true }
endif

"same background as terminal, allows for transparency"
highlight Normal guibg=none
highlight NonText guibg=none
highlight LineNr guifg=#949cbb 
"autosave when cursor hasn't moved for 4 seconds"
":autocmd CursorHold,CursorHoldI * silent! wall"

"set working directory when opening via gui file explorer"
:lcd %:p:h

command Python !python3 %
command Terminal silent !gnome-terminal

command Build call RunBuildScript()
function! RunBuildScript()
	if !empty(glob(getcwd() . "/build.sh"))
		:!./build.sh
	else
		echo "no build.sh found!"
	endif
endfunction

let g:instant_username = "crow"

"source CoC Keybinds
:so ~/.config/nvim/cocKeybinds.vim
