syntax on
set exrc
set hidden
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
set scrolloff=8
set splitbelow
set splitright
set clipboard=unnamedplus
set rnu
let mapleader = " "
" display sign column all the time
set signcolumn=yes
set colorcolumn=80
set cursorline

call plug#begin()
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'gyim/vim-boxdraw'
Plug 'ap/vim-css-color'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'justinmk/vim-dirvish'
Plug 'APZelos/blamer.nvim'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'Yilin-Yang/vim-markbar'
Plug 'justinmk/vim-sneak'
" Git related
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim' " :GitBranches
Plug 'tpope/vim-rhubarb'

" React / JavaScript
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" EO React


Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sukima/vim-tiddlywiki'
Plug 'tpope/vim-obsession' "working with tmux session restore plug
Plug 'jiangmiao/auto-pairs'
Plug 'idanarye/vim-merginal'
Plug 'tomtom/tcomment_vim' 
Plug 'alvan/vim-closetag'
"
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Yilin-Yang/vim-markbar'

" git worktree
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/popup.nvim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
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


" Clear highlight on pressing ESC
nnoremap <silent> <esc> :noh<return><esc>


" vim/airline
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':f:t'
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



" React / Javascript
"
let g:coc_node_path = '/home/liang/.nvm/versions/node/v14.2.0/bin/node'
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
nmap <leader>do <Plug>(coc-codeaction)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Fix :CocCommand eslint.executeAutofix

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" " coc shortcuts
" let g:coc_node_path = '/home/liang/.nvm/versions/node/v14.2.0/bin/node'
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


" Save file when forget to use sudo at first palce
" https://docs.j7k6.org/my-minimal-vimrc/
cnoreabbrev w!! w !sudo tee > /dev/null %|       "write file with sudo

" blamer.nvim
let g:blamer_enabled = 1
let g:blamer_delay = 500

augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END

" shortcut to edit .vimrc and source it after saving
nnoremap <leader>v :vsp $MYVIMRC<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
"
"" vimwiki
" vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '$HOME/vimwiki/_site',
  \ 'path': '$HOME/vimwiki/',
  \ 'template_path': '$HOME/vimwiki/templates/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
\}]


autocmd FileType vimwiki set autochdir
command! -nargs=* Zet call local#zettel#edit(<f-args>)

" Set indent
set list
set listchars=tab:\|-,extends:»,precedes:«,space:.

" Zoom in and Zoom out window
noremap Zi <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" fzf.vim search
" search buffers
nnoremap  <c-b> :Buffers<cr>
" search files
nnoremap <expr> <c-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').(len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" search inside files
" Preview window is shown on the right by default, CTRL-/ disables it 
" and I can have more space to check the file names of the result
" More: https://github.com/junegunn/fzf.vim/issues/1051#issuecomment-647017856
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)
nnoremap <C-g> :Rg<Cr>


" search inside vimwiki
command! -bang -nargs=* WikiRg 
      \ call fzf#vim#grep(
      \ 'rg '
      \ .'--column --line-number --no-heading --color=always --smart-case '
      \ .shellescape(<q-args>).' "/home/liang/vimwiki"',
      \ 0, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <buffer> <leader>fw :WikiRg<cr>

" search dvajs model effects or reducers
" found a dva model when cursor is in "login/login" text
nnoremap <leader>fm :DvaModelSearch<cr>
command! -bang -nargs=* DvaModelSearch
  \ call fzf#vim#grep(
  \   'rg --multiline --multiline-dotall --column --line-number --no-heading --color=always --smart-case -- '
  \     .'"namespace: '''
  \     .split(expand('<cWORD>'), '/')[0][1:]
  \     .'''.*'
  \     .split(expand('<cWORD>'), '/')[1][:-3]
  \     .'\("'
  \   ." | tail -1"
  \   , 0,
  \   fzf#vim#with_preview({ 'options': ['--tac'] }), <bang>0)


" How to remap ctrl-s to do vertical split
" https://github.com/junegunn/fzf.vim/issues/1022
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'vsplit',
  \ }


" vim-table-mode
" disable vimwiki table 
" inoremap <c-cr> <esc>mao<esc>`aa

" Delete current file and buffer
" command! -bang -nargs=* Delete call confirm  | bdelete!
function! ConfirmDeleteFileAndBuffer()
  let answer = confirm('Delete?', "&Yes\n&No", 1)
  if answer == 1
    call delete(expand('%'))
    bdelete!
    redraw
    echo "Deleted!"
  endif
endfunction
command! -bang -nargs=* Delete call ConfirmDeleteFileAndBuffer()

" Vim: Close All Buffers But This One: https://stackoverflow.com/a/42071865
function! BO()
  %bd|e#|bd#
endfunction
command! -bang -nargs=* BO call BO()

" spell checking
set spell
set spelllang=en_us
hi clear SpellBad
hi SpellBad ctermbg=red ctermfg=white

" vim-sneak
let g:sneak#label = 1

" blamer.vim
let g:blamer_show_in_visual_modes = 0

" publish the blog post
function! PB()
  echom system('. ~/projects/runningdemo.com/src/publish.sh')
endfunction
command! -bang -nargs=* PB call PB()

" lua experiment
" fun! YourFirstPlugin()
"   lua for k in pairs(package.loaded) do if k:match("^tools") then package.loaded[k] = nil end end
"   lua require'planing'.insertTodayTitle()
" endfun

autocmd BufEnter Planing-2021-02-28-1055.md lua require'planing'.insertTodayTitle()

fun! SF()
  lua for k in pairs(package.loaded) do if k:match("^searchreact") then package.loaded[k] = nil end end
  lua require'searchreact'.search()
endfunction
nnoremap <leader>ff :call SF()<cr>

" git-worktree
lua require("telescope").load_extension("git_worktree")
nnoremap <leader>gc :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
