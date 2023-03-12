local onedark = require "onedark"

onedark.setup {
	style = 'dark',
	transparent = false,
	code_style = {
		comments = 'italic',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},
	lualine = {
		transparent = true,
	},
}

require("no-clown-fiesta").setup({
	transparent = false, -- Enable this to disable the bg color
	styles = {
		-- You can set any of the style values specified for `:h nvim_set_hl`
		comments = {},
		keywords = {},
		functions = {},
		variables = {},
		type = { bold = true },
		lsp = { underline = true }
	},
})

-- onedark.load()
-- vim.cmd [[colorscheme no-clown-fiesta]]
-- vim.cmd [[let ayucolor="dark"]]
-- set termguicolors     " enable true colors support
-- let ayucolor="light"  " for light version of theme
-- let ayucolor="mirage" " for mirage version of theme
-- let ayucolor="dark"   " for dark version of theme
--vim.cmd [[colorscheme ayu]]


local default_colors = require("kanagawa.colors").setup({ theme = "wave" })
local overrides = {
	IndentBlanklineChar = { fg = default_colors.sumiInk2 },
	PmenuSel = { blend = 0 },
}
require("kanagawa").setup({
	compile = true,
	dimInactive = true,
	overrides = function(_)
		return overrides
	end,
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

require("kanagawa").load("wave")
