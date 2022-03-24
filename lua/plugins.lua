local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require("packer")
packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use 'EdenEast/nightfox.nvim'
        use 'shaunsingh/nord.nvim'

        use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
        use "numToStr/Comment.nvim" -- Easily comment stuff

        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        use ({'akinsho/bufferline.nvim' , requires = 'kyazdani42/nvum-web-devicons','moll/vim-bbye'})
        use { 'nvim-lualine/lualine.nvim'}
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

        -- treesitter plugin
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use {'nvim-treesitter/nvim-treesitter-textobjects'}
        use {'nvim-treesitter/nvim-treesitter-refactor'}
        -- Git plugin
        use 'lewis6991/gitsigns.nvim'


        use('ahmedkhalf/project.nvim')

        -- Hop which like easymotion
        use {
            'phaazon/hop.nvim' ,
            branch = 'v1'
        }

        use 'glepnir/dashboard-nvim'

        use 'folke/which-key.nvim'

        -- indent-blankline
        use "lukas-reineke/indent-blankline.nvim"

        -- LSP
        use 'neovim/nvim-lspconfig' -- enable LSP
        use 'williamboman/nvim-lsp-installer' -- lsp-installer
        use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
        use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


        -- cmp plugins
        use "hrsh7th/nvim-cmp" -- The completion plugin
        use "hrsh7th/cmp-buffer" -- buffer completions
        use "hrsh7th/cmp-path" -- path completions
        use "hrsh7th/cmp-cmdline" -- cmdline completions
        use "hrsh7th/cmp-nvim-lsp"
        -- snippets
        use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
        use 'hrsh7th/vim-vsnip'
        use "saadparwaiz1/cmp_luasnip" -- snippet completions
        use "L3MON4D3/LuaSnip" --snippet engine
        use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

        use 'norcalli/nvim-colorizer.lua' -- colorizer

    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({border = "single"})
            end,
        },
    },
})

pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
    ]]
)
