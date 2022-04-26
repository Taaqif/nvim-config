local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/packer/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  package_root = install_path,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rcarriga/nvim-notify"
  -- use {
  --    "lewis6991/impatient.nvim",
  --    config = function()
  --        require('impatient')
  --    end
  --}
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require("nvim-web-devicons").setup()
    end
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("user.config.nvimtree")
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('user.config.lualine')
    end
  }
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require("user.config.bufferline")
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("user.config.whichkey")
    end
  }
  -- cmp

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "tamago324/nlsp-settings.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  -- telescope
  use "nvim-telescope/telescope.nvim"
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  --themes
  use "luisiacc/gruvbox-baby"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
