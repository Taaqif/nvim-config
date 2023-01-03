return {
  "akinsho/bufferline.nvim",
  event = "BufWinEnter",
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = { "|", "|" },
        indicator = {
          style = "none",
        },
        offsets = { 
          { filetype = "NvimTree", text = "File Explorer" },
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          }
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          if level:match("error") then
            local icon = " "
            return " " .. icon .. count
          else
            return ""
          end
        end,
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        show_close_icon = false,
        always_show_bufferline = false,
        themable = true,
      },
    })

  end
}