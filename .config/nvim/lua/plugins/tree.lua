-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = false,
	},
	disable_netrw = false,
	hijack_netrw = false,
	renderer = {
		root_folder_label = function(path)
			local project = vim.fn.fnamemodify(path, ":t")
			return string.upper(project)
		end,
	}
})
