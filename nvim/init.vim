" Plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'hzchirs/vim-material'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'dylanaraps/pywal'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
call plug#end()

" Coc settings 
let g:coc_node_path = $NODE_PATH
call coc#config('tsserver.npm', $NPM_PATH)

" Coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-flutter-tools',
      \'coc-docker', 'coc-styled-components', 'coc-react-refactor', 'coc-html',
      \'coc-yaml', 'coc-xml', 'coc-eslint', 'coc-tslint', 'coc-explorer',
      \'coc-actions', 'coc-markdownlint', 'coc-git', 'coc-sql', 'coc-pyright',
      \'coc-pairs', 'coc-prettier', 'coc-omnisharp',]

" Don't try to be vi compatible
set nocompatible
set autoread

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" pick a map leader
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Relative line numbers
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set timeoutlen=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" signcolumn
set signcolumn=yes

" Whitespace
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" show hidden file in NERDTree
let NERDTreeShowHidden=1

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Splitting
set splitright
set splitbelow

" Formatting
map <leader>q gqip

" airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='onedark'

" colorscheme
set t_Co=256
set bg=dark
set termguicolors

let g:material_style='oceanic'
colorscheme gruvbox

" ALE settings
let g:ale_sign_column_always = 1

" format echo message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" show errors or warnings in stastus line
let g:airline#extensions#ale#enabled = 1

" run linter on save only
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" do not run linter on opening a file
let g:ale_lint_on_enter = 0

" disable ALE's LSP features to use Coc's LSP features
let g:ale_disable_lsp = 1

" enable syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" enable syntax for flow
let g:javascript_plugin_flow = 1

" highlight closed tag seperately
let g:vim_jsx_pretty_highlight_close_tag = 1

" closetags
let g:closetag_filenames = '*.js, *.jsx, *.ts, *.tsx'

" mapping
" clear search highlight
nmap <esc> :noh<CR>

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  :Format<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap qa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Split open terminal verticaly
nmap <space><space> :vsplit<bar>term<CR>
" Open fuzzy finder
nmap <space>f :FZF<CR>
" Project Explorer
" nmap <expr><space>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>" 
nmap <space>n :CocCommand explorer<CR>
" Open Docker
nmap <space>d :Docker

" copy and paste from clipboard
vmap <leader>c "+y
vmap <leader>v "+p
nmap <leader>v "+p

" Mappin/g selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Terminal
tmap jj <C-\><C-n>
tmap mm jj<leader>z

" Open flutter commands
nmap <space>cf :CocList --input=flutter. commands<ESC>
xmap <leader>.  <Plug>(coc-codeaction-selected)w
nmap <leader>.  <Plug>(coc-codeaction-selected)w

" Open git section
nmap <space>g :G<CR>

" reload editor
nmap <leader>z :checktime<CR>

" saving
nmap <leader>w :w<CR>
nmap <leader>a :wa<CR>
nmap zz :wq<CR>
nmap zx :wqa<CR>
nmap <leader>z :q!<CR>
nmap <leader>x :qa!<CR>

" stop insert mode
imap jj <ESC>

" buffer management
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <C-P> :buffers<CR>:buffer<Space>
nmap $ g_
nmap 0 _

" tags files
nmap <F8> :TagbarToggle<CR>

" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
