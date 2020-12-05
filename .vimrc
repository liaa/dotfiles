syntax on
set noerrorbells
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"set cmdheight=2
set splitbelow
set splitright
set clipboard=unnamedplus
set rnu
let mapleader = " "
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgray

call plug#begin()
Plug 'ap/vim-css-color'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-dirvish'
Plug 'APZelos/blamer.nvim'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'

"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Galooshi/vim-import-js' "need to do `npm install -g import-js` first

Plug 'tpope/vim-fugitive'
Plug 'sukima/vim-tiddlywiki'
Plug 'tpope/vim-obsession' "working with tmux session restore plug
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'tomtom/tcomment_vim'
Plug 'alvan/vim-closetag'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Yilin-Yang/vim-markbar'
call plug#end()

colorscheme gruvbox
set background=dark

" Formatters
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" NERDTree
let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=0
map  <Leader>n  :NERDTreeToggle<CR>
map  <Leader>m  :NERDTreeFind<CR>

" fzf.vim
nnoremap <C-g> :Rg<Cr>
nnoremap <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').(len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" How to remap ctrl-s to do vertical split
" https://github.com/junegunn/fzf.vim/issues/1022
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'vsplit',
  \ }

" Clear highlight on pressing ESC
nnoremap <silent> <esc> :noh<return><esc>


" vim/airline
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 0,
      \ }

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'y', 'z', 'error', 'warning' ]
      \ ]

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


set hidden
" To open a new empty buffer
nmap <leader>T :enew<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>
" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>


" tiddlywiki
" https://github.com/sukima/vim-tiddlywiki
let g:tiddlywiki_author = 'Liang Chen'
let g:tiddlywiki_dir = '~/wiki'
"let g:tiddlywiki_no_mappings=1
let g:tiddlywiki_autoupdate=0

" Tmux-Vim seemlessly navigation
" Copy from https://www.codeography.com/2013/06/19/navigating-vim-and-tmux-spli
" ts
"
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" fugiive-vim
nmap <leader>gs :G<CR>

" vim-closetag
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript.jsx,javascript'

" coc settings

" vim-jsx-typescript parse performace fix
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" coc shortcuts
"
let g:coc_node_path = '/home/liang/.nvm/versions/node/v14.2.0/bin/node'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vimwiki settings

let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.wiki',
                       \ 'path_html': '~/vimwiki_html/',
                       \ 'template_path': '~/vimwiki_templates',
                       \ 'template_default': 'index_template',
                       \ 'template_ext': '.html'}]

" Save file when forget to use sudo at first palce
" https://docs.j7k6.org/my-minimal-vimrc/
cnoreabbrev w!! w !sudo tee > /dev/null %|       "write file with sudo

" blamer.nvim
let g:blamer_enabled = 1
let g:blamer_delay = 500

" display sign column all the time
set signcolumn=yes

augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END
