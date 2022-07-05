" ============== SET UP ==============
set shortmess+=A
set autoindent
set list
set listchars=tab:>-,trail:.
set wildmenu
set wildmode=list:longest

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set statusline+=%F
set laststatus=2

set incsearch
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew 
map t1 :tabn1<cr>
map t2 :tabn2<cr>
map t3 :tabn3<cr>
map t4 :tabn4<cr>
map t5 :tabn5<cr>
map t6 :tabn6<cr>
map t7 :tabn7<cr>
map t8 :tabn8<cr>
map t9 :tabn9<cr>
map t0 :tabl<cr>

let mapleader = ","
nmap <Leader>n :NERDTree<cr>

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" ============== PLUGINS ==============
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'joshdick/onedark.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-sleuth'
  Plug 'mhinz/vim-startify'
  Plug 'kien/ctrlp.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" ctrl p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|coverage'

" ============== LANGUAGE SPECIFICS ==============
" Javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript set expandtab
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx


autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript set expandtab

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Json
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

" ============== COLORS ==============
syntax on
colorscheme onedark


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ============== EXTERNALS ==============
source ~/.config/nvim/coc.vim
