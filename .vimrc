"Enable Syntax
syntax enable

"Terminal Thing
set term=xterm

"Mouse Things =D
set ttymouse=xterm2
set mouse=a
set mouse=r

"Backspace
set backspace=2

"Auto indent
set autoindent
"set smartindent

"Mostrar tabs
set list
set listchars=tab:>-,trail:.
"Bajar el timeout del doble tecla
"set timeout timeoutlen=150

"bash completion
set wildmenu
set wildmode=list:longest

"Tab y shift tab para hacer tabs
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >
vnoremap <S-Tab> <LT>

"Doble home para inicio de linea no en blanco
map <HOME><HOME> ^
imap <HOME><HOME> <esc>^i


" manejo de tabs y espacios
":set expandtab
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" plugins por tipo de archivo
filetype plugin on
filetype indent on

" color
colorscheme delek

" busqueda incremental (a medida que se escribe)
set incsearch

" resulados de busquedas resaltados
set hlsearch

" resaltar lineas en blanco
" highlight BlankLines ctermbg=red guibg=Red
" match BlankLines /^\s\+$/

" numeros de linea
set nu

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" Activar navegador de archivos
"map <F3> :NERDTreeToggle<CR>
map NT :NERDTreeToggle<CR>

" Accesos directos para tabs
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew 
map t1 :tabn1<cr>
map 11 :tabn1<cr>
map t2 :tabn2<cr>
map 22 :tabn2<cr>
map t3 :tabn3<cr>
map 33 :tabn3<cr>
map t4 :tabn4<cr>
map 44 :tabn4<cr>
map t5 :tabn5<cr>
map 55 :tabn5<cr>
map t6 :tabn6<cr>
map 66 :tabn6<cr>
map t7 :tabn7<cr>
map 77 :tabn7<cr>
map t8 :tabn8<cr>
map 88 :tabn8<cr>
map t9 :tabn9<cr>
map 99 :tabn9<cr>
map t0 :tabl<cr>
map 00 :tabl<cr>

" Copiar cursor hasta fin de linea
nnoremap Y v$hy
" Cerrar sola ventana de ayuda de completado
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" acceso directo para autocompletado
imap <C-Space> <C-n>
imap <C-@> <C-Space>

" agregar una linea en modo normal
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Mostrar lista de todo's
map <F2> :TaskList<CR>
map T :TaskList<CR>

" borra los espacios extras al final de las lineas
" (guarda antes la posición y la restablece luego)
autocmd BufWritePre *.py mark z | %s/ *$//e | 'z

" Colores y mas configuraciones del autocompletado
"highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" use global scope search
"let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
"let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
"let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
"let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
"let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
"let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add 
" namespaces that are always used in your project.
"let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
"let OmniCpp_MayCompleteDot = 0
"let OmniCpp_MayCompleteArrow = 0
"let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can 
"change this behaviour with the OmniCpp_SelectFirstItem option.
"let OmniCpp_SelectFirstItem = 0

" accesos directos para debugger
" map <F5> :Dbg over<CR>
" map <F6> :Dbg into<CR>
" map <F7> :Dbg out<CR>
" map <F8> :Dbg here<CR>
" map <F9> :Dbg break<CR>
" map <F10> :Dbg watch<CR>
" map <F11> :Dbg down<CR>
" map <F12> :Dbg up<CR>


