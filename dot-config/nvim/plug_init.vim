" Stolen from BEGINBOT (https://github.com/davidbegin/beginfiles/blob/master/nvim/plug_init.vim)


"call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
"Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate \| :TSInstall markdown' }
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'johmsalas/text-case.nvim', {'branch': 'issue-6_provide-key-mapping-desc'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" QOL
Plug 'mbbill/undotree'
Plug 'troydm/zoomwintab.vim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'eruizc-dev/vim-flex'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-sleuth'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Filetypes
Plug 'hashivim/vim-terraform'

" Improve editing
Plug 'akinsho/git-conflict.nvim'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'dkarter/bullets.vim'
Plug 'gcmt/wildfire.vim'
Plug 'jqno/jqno-autoclose.vim'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'machakann/vim-sandwich'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Improve navigation
Plug 'farmergreg/vim-lastplace'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jvgrootveld/telescope-zoxide'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'fcying/telescope-ctags-outline.nvim'
Plug 'ANGkeith/telescope-terraform-doc.nvim'
Plug 'aloussase/telescope-gradle.nvim'

" Database
Plug 'tpope/vim-dadbod'         			" God bless tpope
Plug 'kristijanhusak/vim-dadbod-ui'     	" God bless kristijanhusak

" Improve looks
Plug 'EdenEast/nightfox.nvim'
Plug 'jqno/tranquility.nvim'
Plug 'dikiaap/minimalist'
Plug 'eruizc-dev/galaxyline.nvim', { 'branch': 'merge-all' }
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/playground', { 'on': 'TSHighlightCapturesUnderCursor' }

" Improve UX
Plug 'folke/which-key.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'lewis6991/gitsigns.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-eunuch'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'voldikss/vim-floaterm'
Plug 'wincent/terminus'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'rcarriga/nvim-notify'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kevinhwang91/nvim-bqf'
Plug 'karb94/neoscroll.nvim'
Plug 'phaazon/hop.nvim'

" Configure LSP and completion
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-cmdline'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'eruizc-dev/nvim-efm-setup'
Plug 'github/copilot.vim'
Plug 'hrsh7th/cmp-omni'

Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

Plug 'mfussenegger/nvim-jdtls'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'shuntaka9576/preview-swagger.nvim'

Plug 'glepnir/lspsaga.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'scalameta/nvim-metals'
" For vsnip users.
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'
" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" For snippy users.
"Plug 'dcampos/nvim-snippy'
"Plug 'dcampos/cmp-snippy'


Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'folke/lsp-colors.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'eruizc-dev/metropolis-vim'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'

"Golang plugins
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' 

" Configure wiki
Plug 'lervag/wiki.vim'

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" others
Plug 'jqno/jqno-extractvariable.vim'
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'beeender/Comrade'

"uml
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'tyru/open-browser.vim' "dependency
Plug 'previm/previm' "interesting plugin
Plug 'weirongxu/plantuml-previewer.vim'
" dependencies
" $ brew install graphviz
" $ brew install java

call plug#end()
