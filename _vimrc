"FGarcia vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set number 
set laststatus=2

set background=dark

if has('gui_running')
	set guifont=Monaco:h9:cANSI
	colorscheme omicron
	let g:airline_theme='luna'

	"Set Git Gutter Highlight rules
	highlight GitGutterAdd guifg=#E4E4E4 guibg=#328742
	highlight GitGutterChange guifg=#4843A8 guibg=#A3A843
	highlight GitGutterDelete guifg=#E4E4E4 guibg=#8C2D36
	highlight GitGutterChangeDelete guifg=#8C2D36 guibg=#A3A843

	"Gui Options
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r

	"Indent Guide
	let g:indent_guides_enable_on_vim_startup = 1
	let g:indent_guides_start_level=1
	let g:indent_guides_guide_size=1
	let g:indent_guides_auto_colors = 0
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray16 ctermbg=darkgrey
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=gray20 ctermbg=lightgrey
endif

if !has('gui_running')
	"colorscheme vividchalk
	colorscheme omicron
endif

"GitGutter Settings
let g:gitgutter_sign_column_always=1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

let g:indentLine_color_term = 239
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

inoremap jj <ESC>
nnoremap ; :
autocmd vimenter * RainbowParenthesesToggle
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal  omnifunc=xmlcomplete#CompleteTags

"Ruby Settings
let g:ruby_path= "C:\ruby200\bin"
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete

"Omnisharp settings
"let g:Omnisharp_timeout = 1
"set noshowmatch
"autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

"SuperTab Setting
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType * 
	\ if &omnifunc != '' |
	\	call SuperTabChain(&omnifunc, '<c-p>') |
	\endif

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
set backup
set backupdir=.,$TEMP
set backupskip=.,$TEMP
set directory=.,$TEMP
set writebackup

nmap <Leader>l :set list!<CR>
nmap <F8> :TagbarToggle<CR>
"set listchars=tab:»\ ,eol:¬
map <F2> <ESC>:NERDTreeToggle<ENTER>

