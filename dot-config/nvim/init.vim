" Shubharanjan's .vimrc: Modified Folkes VIMrc + eruizc

source $HOME/.config/nvim/plug_init.vim

" -----------------------------------------------------------
" General setup
" -----------------------------------------------------------

syntax on
" enable backspace to delete anyting (includes \n) in insert mode
set backspace=indent,eol,start
set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

Plugin 'Rykka/colorv.vim'
" needed for fetching schemes online.
Plugin 'mattn/webapi-vim'

" install nerdtree
Plugin 'scrooloose/nerdtree'

" YouCompleteMe plugin
"Plugin 'tabnine/YouCompleteMe'
Plugin 'tomlion/vim-solidity'

"aurline plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" autoindenting (local to buffer)
set ai
set si
" number of spaces the tab stands for
" number of spaces used for (auto)indenting
set tabstop=3 shiftwidth=3 noexpandtab
set smarttab
set softtabstop=3
set cindent
set cinoptions=>3,e,n,:3,(0,l3,=3,b1
set tw=0

" -----------------------------------------------------------
" Searching, Substituting
" -----------------------------------------------------------

" Statusline, Menu
" -----------------------------------------------------------

" use tab for auto-expansion in menus
set wc=<TAB>
" -----------------------------------------------------------
" Tag search (c-code) and tag highlighting
" -----------------------------------------------------------

" height of preview-window
set previewheight=5

" -----------------------------------------------------------
" window handling
" -----------------------------------------------------------

" -----------------------------------------------------------
" file, backup, path
" -----------------------------------------------------------

" -----------------------------------------------------------
" UNIX Specials
" -----------------------------------------------------------

" -----------------------------------------------------------
" Special Features
" -----------------------------------------------------------
set nocompatible
set autoindent
set ruler
set cindent
set incsearch
set showcmd 
set history=50 
set expandtab 
"colors elflord
" scroll bar at the left rather than the right:
"
setlocal textwidth=80
" " have a small-ish yet readable font:
"
" " have error messages red on white (rather than t'tother way round, which
" isn't
" " readable in the above font):
highlight link String       Constant
highlight link Character    Constant
highlight link Number       Constant
highlight link Boolean  Constant
highlight link Float        Number
highlight link Function Identifier
highlight link Conditional  Statement
highlight link Repeat       Statement
highlight link Label        Statement
highlight link Operator Statement
highlight link Keyword  Statement
highlight link Include  PreProc
highlight link Define       PreProc
highlight link Macro        PreProc
highlight link PreCondit    PreProc
highlight link StorageClass Type
highlight link Structure    Type
highlight link Typedef  Type
highlight link Tag      Special

if has("cscope")

    set csprg=/usr/bin/cscope
    " change this to 1 to search ctags DBs first
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb


    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>h :cs find f <C-R>=expand("<cfile>")<CR>.h<CR>    
    nmap <C-\>a :cs find f <C-R>=expand("<cfile>")<CR>.cpp<CR>  

    nmap :togh  :vsp<CR>
         \:cs find f <C-R>=expand("%:t:r")<CR>.h<CR>

    nmap :togc  :vsp<CR>
         \:cs find f <C-R>=expand("%:t:r")<CR>.cpp<CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>  

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
syntax on
map <C-j>> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ .

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
command Make :make |cwindow 3

let mapleader=","
"let g:node_client_debug = 1

map <Leader>j :Make<CR> 
             \:!~/scripts/notify.sh "make done" &<CR> <CR> 

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

"inoremap <F5> <C-R>=strftime("%d-%m-%Y")<CR>
"inoremap \fn <C-R>=expand("%:t")<CR>

map :mav :0r ~/.vim/mav.txt<CR>
"imap ( ()<left>))

syntax enable

""""""" colorscheme-config 
let g:solarized_termcolors= 256
set background=dark

colorscheme duskfox
"colorscheme dracula
"color solarized
""""" colorscheme-config 

""""""" arline-config
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" "let g:airline_symbols.linenr = '␊'
" "let g:airline_symbols.linenr = '␤'
" "let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = ''

"""" arline-config


" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>


""""""" split-config
" Ctrl- P mapping and two custom split keymappings
" (https://github.com/kien/ctrlp.vim)
let g:ctrlp_map = '<c-p>'
" nmap <c-n>s :split<CR><c-w>j<c-p>
" nmap <c-n>v :vsplit<CR><c-w>l<c-p>
nmap ss :split<CR><c-w>j<c-p>
nmap vs :vsplit<CR><c-w>l<c-p>
"""" split-config


"""""""" VimFiler-config
" nmap sf :VimFilerBufferDir -winwidth=30 <Return>
" nmap sF :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<Return>
" "nmap sF :VimFilerExplorer -split -winwidth=30 -toggle -no-quit<Return>
" nmap sb :Unite buffer<Return>
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_enable_auto_cd = 0
" let g:vimfiler_tree_leaf_icon = ''
" let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_marked_file_icon = '✓'
"""" VimFiler-config


""""""""" defx Configuration - start
" nnoremap sf :Defx
" 
" autocmd FileType defx call s:defx_my_settings()
" function! s:defx_my_settings() abort
"   " Define mappings
"   nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
"   nnoremap <silent><buffer><expr> c defx#do_action('copy')
"   nnoremap <silent><buffer><expr> m defx#do_action('move')
"   nnoremap <silent><buffer><expr> p defx#do_action('paste')
"   nnoremap <silent><buffer><expr> l defx#do_action('open')
"   nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
"   nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
"   nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
"   nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
"   nnoremap <silent><buffer><expr> N defx#do_action('new_file')
"   nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
"   nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
"   nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
"   nnoremap <silent><buffer><expr> d defx#do_action('remove')
"   nnoremap <silent><buffer><expr> r defx#do_action('rename')
"   nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
"   nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
"   nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
"   nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
"   nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
"   nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
"   nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
"   nnoremap <silent><buffer><expr> q defx#do_action('quit')
"   nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
"   nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
"   nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
"   nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
"   nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
"   nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
"   nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
" endfunction
" 
" call defx#custom#column('icon', {
"        'directory_icon': '▸',
"        'opened_icon': '▾',
"        })
" 
" " Set appearance
" call defx#custom#option('_', {
"        'winwidth': 30,
"        'split': 'vertical',
"        'direction': 'topleft',
"        'show_ignored_files': 0,
"        'buffer_name': 'defxplorer',
"        'toggle': 1,
"        'columns': 'icon:indent:icons:filename',
"        'resume': 1,
"        })
" 
" 
""""""""" defx Configuration - end 



" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


"call pathogen#infect()
"call pathogen#helptags() ” generate helptags for everything in ‘runtimepath’ "
syntax on
filetype plugin indent on

" Give a shortcut key to NERD Tree
"nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <C-h> :TlistToggle<CR>

let g:NERDTreeWinPos = "left"
set nu
set colorcolumn=80
set textwidth=80
set formatoptions-=t
set autowrite
set cmdheight=4 

" disable all linters as that is taken care of by coc.nvim
" let g:go_diagnostics_enabled = 0

let g:go_diagnostics_enabled = 1
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" Run goimports along gofmt on each save     
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" setup some plugins here
lua << EOF
   require("eruizc")

   require('go').setup()
   
   require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
   }

   require("nvim-lsp-installer").setup {}
   
   require("dapui").setup()

   require('which-key').register({
     ["<C-f>"] = {
       "<cmd>lua require('telescope-files').project_files()<CR>",
       "Find files",
     },
     ["<C-b>"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
     ["<C-g>"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
     ["<C-t>"] = {
       name = "+Telescope",
       ["<C-t>"] = { "<cmd>Telescope builtin<CR>", "Builtins" },
       h = { "<cmd>Telescope help_tags<CR>", "Help tags" },
     },
   })

   require("trouble").setup()
   
   require'lspconfig'.pyright.setup{}
   
   require('lspconfig').gopls.setup{
     cmd = {'gopls'},
     settings = {
       gopls = {
         analyses = {
           nilness = true,
           unusedparams = true,
           unusedwrite = true,
           useany = true,
         },
         experimentalPostfixCompletions = true,
         gofumpt = true,
         staticcheck = true,
         usePlaceholders = true,
       },
     },
     on_attach = on_attach,
   }
EOF

set termguicolors

set completeopt=menu,menuone,noselect
"set splitbelow splitright
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

nnoremap <leader>T :Twilight <CR> 

let g:CoolTotalMatches = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

nmap <leader><leader>b :b 
nmap <leader><leader>e :e  
nmap <leader><leader>tt :tab term<CR> 

"floaterm keybindings
let g:floaterm_keymap_new    = '<leader>fc'
let g:floaterm_keymap_prev   = '<leader>fp'
let g:floaterm_keymap_next   = '<leader>fn'
let g:floaterm_keymap_toggle = '<leader>ft'
let g:floaterm_keymap_first  = '<leader>ff'
let g:floaterm_keymap_last   = '<leader>fl'
let g:floaterm_keymap_hide   = '<leader>fh'
let g:floaterm_keymap_show   = '<leader>fs'
let g:floaterm_keymap_kill   = '<leader>fk'
let g:floaterm_borderchars   = '-'
let g:floaterm_width = 0.85
hi Floaterm guibg=grey
hi FloatermBorder guibg=orange guifg=cyan

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
au filetype go inoremap <buffer> . .<C-x><C-o>
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>tf <Plug>(go-test-func)
au FileType go nmap <leader>ct <Plug>(go-coverage-toggle)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>ip <Plug>(go-implments)
au FileType go nmap <leader>d <Plug>(go-describe)
au FileType go nmap <leader>cl <Plug>(go-callers)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

nmap <C-a> <C-o>


"nmap <C-d> <Plug>(coc-definition)
"nmap <leader>r <Plug>(coc-rename)



"swagger config
" set to node path
" default "node" command in $PATH
let g:pswag_node_path = '~/.anyenv/envs/nodenv/shims/node'
" set to lunch port
" default 9126
let g:pswag_lunch_port='6060'
" set to lunch address
" default 127.0.0.1
let g:pswag_lunch_ip='xxx.x.x.xx'



let g:lens#disabled_filetypes = ['nerdtree', 'fzf', 'tagbar']
"let g:lens#width_resize_max = 180

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end


let g:NERDTreeWinSize=25
"let g:Tlist_WinWidth=40
let g:tagbar_width = 35

" Netrw Style Listing
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nnoremap <leader>L :call ToggleNERDTreeAndTagbar()<CR> <c-w>31<c-p>

" Vista configuration
"let g:vista_default_executive = 'coc'
"let g:vista_close_on_jump = 1
"let g:vista_blink  = [0, 0]
"let g:vista_sidebar_width = 30
"let g:vista_finder_alternative_executives = ['coc']
"let g:vista#renderer#enable_icon = 0
"map <leader>K :Vista!! <CR>

"nnoremap <leader>L :NERDTreeToggle <CR>
nnoremap <leader>J :NERDTreeToggle <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd p <Bar> endif<CR> <c-w>25<c-p>
"nnoremap <leader>K :TagbarToggle <Bar> if &filetype ==# 'tagbar' <Bar> wincmd p <Bar> endif<CR> <c-w>35<c-p>
"nnoremap <leader>K :TagbarToggle <Bar> if &filetype ==# 'vista' <Bar> wincmd p <Bar> endif<CR>

"augroup ReduceNoise
"     autocmd!
"     " Automatically resize active split to 85 width
"     autocmd WinEnter * :call ResizeSplits()
"augroup END

"TODO: implement toggle 
function! ResizeSplits()
    if &ft == 'nerdtree'
            set winwidth=20
            return
    elseif &ft == 'qf'
            " Always set quickfix list to a height of 10
            resize 10
            return
    elseif &ft == 'fzf'
            return
    elseif &ft == 'tagbar'
            set winwidth=20
            return
    else
            set winwidth=120
            wincmd =
    endif
endfunction
nnoremap <leader>rs :call ResizeSplits()<CR> <c-w>20<c-p>

set noequalalways

autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal signcolumn=auto

autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal signcolumn=no

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:cursorhold_updatetime = 100

"text-case.nvim config custom keymapping
nnoremap gau :lua require('textcase').current_word('to_upper_case')<CR>
nnoremap gal :lua require('textcase').current_word('to_lower_case')<CR>
nnoremap gas :lua require('textcase').current_word('to_snake_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dash_case')<CR>
nnoremap gan :lua require('textcase').current_word('to_constant_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dot_case')<CR>
nnoremap gaa :lua require('textcase').current_word('to_phrase_case')<CR>
nnoremap gac :lua require('textcase').current_word('to_camel_case')<CR>
nnoremap gap :lua require('textcase').current_word('to_pascal_case')<CR>
nnoremap gat :lua require('textcase').current_word('to_title_case')<CR>
nnoremap gaf :lua require('textcase').current_word('to_path_case')<CR>

nnoremap gaU :lua require('textcase').lsp_rename('to_upper_case')<CR>
nnoremap gaL :lua require('textcase').lsp_rename('to_lower_case')<CR>
nnoremap gaS :lua require('textcase').lsp_rename('to_snake_case')<CR>
nnoremap gaD :lua require('textcase').lsp_rename('to_dash_case')<CR>
nnoremap gaN :lua require('textcase').lsp_rename('to_constant_case')<CR>
nnoremap gaD :lua require('textcase').lsp_rename('to_dot_case')<CR>
nnoremap gaA :lua require('textcase').lsp_rename('to_phrase_case')<CR>
nnoremap gaC :lua require('textcase').lsp_rename('to_camel_case')<CR>
nnoremap gaP :lua require('textcase').lsp_rename('to_pascal_case')<CR>
nnoremap gaT :lua require('textcase').lsp_rename('to_title_case')<CR>
nnoremap gaF :lua require('textcase').lsp_rename('to_path_case')<CR>

nnoremap geu :lua require('textcase').operator('to_upper_case')<CR>
nnoremap gel :lua require('textcase').operator('to_lower_case')<CR>
nnoremap ges :lua require('textcase').operator('to_snake_case')<CR>
nnoremap ged :lua require('textcase').operator('to_dash_case')<CR>
nnoremap gen :lua require('textcase').operator('to_constant_case')<CR>
nnoremap ged :lua require('textcase').operator('to_dot_case')<CR>
nnoremap gea :lua require('textcase').operator('to_phrase_case')<CR>
nnoremap gec :lua require('textcase').operator('to_camel_case')<CR>
nnoremap gep :lua require('textcase').operator('to_pascal_case')<CR>
nnoremap get :lua require('textcase').operator('to_title_case')<CR>
nnoremap gef :lua require('textcase').operator('to_path_case')<CR>


"undotree keymapping
"nnoremap <leader>U :UndotreeToggle<CR>
"if has("persistent_undo")
"   let target_path = expand('~/.undodir')
"
"    " create the directory and any parent directories
"    " if the location does not exist.
"    if !isdirectory(target_path)
"        call mkdir(target_path, "p", 0700)
"    endif
"
"    let &undodir=target_path
"    set undofile
" endif


""""" jdtls-config
"augroup jdtls-lsp
"    autocmd!
"    "autocmd FileType java lua require'jdtls_config'.setup()
"    autocmd FileType java lua require'jdtls_setup'.setup()
"augroup end
"" jdtls-config



let $my_vimrc = '/Users/apple/.config/nvim/init.vim'
nnoremap <Leader>sv :source $my_vimrc<CR>
