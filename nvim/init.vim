let mapleader=","

filetype plugin indent on
syntax enable
call plug#begin('~/.config/nvim' . '/plugged')
""" minpac
"function! PackInit() abort
"  packadd minpac


"  call minpac#init()
"  Plug 'k-takata/minpac', {'type': 'opt'})

  " Aesthetics
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'morhetz/gruvbox'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ayu-theme/ayu-vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'phanviet/vim-monokai-pro'
  Plug 'sickill/vim-monokai'
  " Functionality
  Plug 'Yggdroot/indentLine'
  Plug 'chrisbra/Colorizer'
  " Plug 'ervandew/supertab'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'preservim/tagbar'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-grepper'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'slim-template/vim-slim'
  Plug 'sonph/onehalf' ", {'rtp': 'vim'}'
  Plug 'mattn/emmet-vim'
  Plug 'donRaphaco/neotex'
  Plug 'dart-lang/dart-vim-plugin'
  " Plug 'metakirby5/codi.vim
  "
  " Programming
  "Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' })
  Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' }'
  Plug 'janko-m/vim-test'
  "Plug 'sheerun/vim-polyglot
  Plug 'tpope/vim-rails'   ", {'type': 'opt'}'
  Plug 'w0rp/ale'
  "Plug 'zchee/deoplete-go', { 'do': 'make'})'
  Plug 'neoclide/coc-pairs'
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
  Plug 'lervag/vimtex'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'Konfekt/FastFold'
  Plug 'matze/vim-tex-fold'
  Plug 'phanviet/vim-monokai-pro'
"endfunction

"command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
"command! PackClean  call PackInit() | call minpac#clean()
"command! PackStatus call PackInit() | call minpac#status()

""" Settings

" Encoding
set encoding=utf-8

" Aesthetics
if (has("termguicolors"))
  set termguicolors
endif
let ayucolor="light"
colorscheme monokai_pro
let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }

set background=dark

" if has("gui_vimr")
"   set background=light
"   let g:gruvbox_contrast_light = 'hard'
" else
"   set background=dark
"   let g:gruvbox_contrast_dark = 'soft'
" endif

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Other Configurations
set fillchars+=vert:\ 
set nofoldenable foldmethod=syntax foldlevel=1 foldcolumn=1
set ignorecase smartcase
set inccommand=split
set list listchars=trail:»,tab:»-
set number 
set scrolloff=2
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set title
set wrap breakindent
" set colorcolumn=80,100
set lazyredraw
set undofile
let &undodir=fnamemodify($MYVIMRC, ":h") . "/undo"

""" Plugin Configurations

" NERDTree
let g:NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%H:%M")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1

" Colorizer
let g:colorizer_auto_filetype = 'scss,css,html'
let g:colorizer_skip_comments = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
set completeopt-=preview

" Supertab
" let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-x>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_setColors = 1

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-z> :Buffers<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-k> :tabp<CR>
nmap <C-s> :write<CR>
nnoremap <leader>e :CocList diagnostics<CR>
nmap <leader>n <Plug>(coc-diagnostics-next-error)
nmap <leader>p <Plug>(coc-diagnostics-previous-error)

let g:fzf_action = {
     \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'Type'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Character'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" ALE
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <plug>(ale_previous)
nmap <silent> ]w <plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
tnoremap <>c-space> coc#refresh()> <Esc> (&filetype == "fzf") ? "Esc><" : "c-\><<c-n"
">"
" vim-grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']

nmap <leader>g :Grepper<CR>
nmap <Leader>G :Grepper -cword -noprompt<CR>

" vim-test
let test#strategy = "dispatch"

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

""" Terminal settings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

""" Custom Functions

"" Trim Whitespaces
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

function! ToggleBackground()
  if (&background == 'light')
    set background=dark
    echo "background -> dark"
  else
    set background=light
    echo "background -> light"
  endif
endfunction

""" Custom Mappings

" Leader mappings
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>U :UndotreeToggle<CR>
nmap <leader>f :Files<CR>
nmap <leader>v :vsplit $MYVIMRC<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader><Tab> :bnext<CR>
nmap <leader><S-Tab> :bprevious<CR>
nmap <leader>b :call ToggleBackground()<CR>
nmap <silent> <leader>bd :bufdo bd<CR>
nmap <leader>bf :let @+ = expand("%")<CR>
nmap <leader>bs :ls<CR>:b<space>

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap H ^

" ECL
nmap <leader>fr :CocCommand flutter.run -d chrome<CR>
nmap <leader>fw :CocCommand flutter.run -d web --web-hostname 192.168.0.45 --web-port 3020<CR>
nmap <leader>fl :CocCommand flutter.dev.openDevLog<CR>
inoremap jk <Esc>
cabbrev Wq wq

""" Solargraph
let g:coc_global_extensions = ['coc-solargraph']

""" Latex
" This is new style
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})
""" VimTex
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
set clipboard^=unnamed,unnamedplus
"let g:clipboard+=unnamedplus

""" fix chars

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap jj <Esc>
nnoremap <M-s> :w<CR>
inoremap <M-s> <Esc>:w<CR>

" Flutter formatting
setlocal cinoptions+=(0,W2,J1,j1,m1,c0,C0,/0)

set guifont=-misc-fixed-medium-r-normal-*-18-120-100-100-c-90-iso8859-1
set guifontwide=-misc-fixed-medium-r-normal-*-18-120-100-100-c-180-iso8859-1

if has('win32')
  source ~/AppData/Local/nvim/coc.ini
else
  source ~/.config/nvim/coc.ini
end

nnoremap <M-Right> <C-w><Right>
nnoremap <M-Left> <C-w><Left>
nnoremap <M-Up> <C-w><Up>
nnoremap <M-Down> <C-w><Down>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
" dart
" set flutter.openDevLogSplitCommand = 'botright 10split'
let g:lsc_auto_map = v:true
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<leader>gd',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}

"" :au BufAdd,BufNewFile * ne"sted tab sball
set mouse=a
