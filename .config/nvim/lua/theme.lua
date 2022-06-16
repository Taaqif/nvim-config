vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- gruvbox baby
-- Enable telescope theme
-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_transparent_mode = true

-- gruvbox material 
-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 1
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
-- vim.cmd [[colorscheme gruvbox-material]]

--nightfox
local nightfox_ok, nightfox = pcall(require, "nightfox")

if nightfox_ok then
  nightfox.setup({
    options = {
      styles = {
        comments = "italic",
        constants = "italic",
        keywords = "italic",
      }
      
    }
  })
end



vim.cmd [[colorscheme kanagawa]]