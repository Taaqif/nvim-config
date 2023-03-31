vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"qf",
		"help",
		"man",
		"lir",
		"lspinfo",
		"spectre_panel",
		"DressingSelect",
		"tsplayground",
		"Markdown",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "" },
	callback = function()
		local buf_ft = vim.bo.filetype
		if buf_ft == "" or buf_ft == nil then
			vim.cmd([[
      set nobuflisted 
    ]])
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 50 })
	end,
})

-- highlight non ascii characters
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	command = [[syntax match NonAscii "[^\u0000-\u007F]"]],
})

-- Emit OSC 7 on dir change event
vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	command = [[call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd))]],
})
