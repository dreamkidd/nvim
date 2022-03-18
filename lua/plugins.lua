local packer = require("packer")
packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use 'shaunsingh/nord.nvim'
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

        
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({border = "single"})
            end,
        },
    },
})





-- 自动更新
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

