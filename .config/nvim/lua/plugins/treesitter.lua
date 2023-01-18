return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "mfussenegger/nvim-treehopper",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "mrjones2014/nvim-ts-rainbow",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-context",

    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  },

  config = function()
    local treesitter_context_ok, treesitter_context = pcall(require, "treesitter-context")

    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autopairs = { enable = true },
      autotag = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      rainbow = {
        enable = true,
      },

    })

    require 'nvim-treesitter.install'.compilers = { vim.fn.getenv('CC'), "cc", "zig", "gcc", "clang", "cl" }

  end
}
