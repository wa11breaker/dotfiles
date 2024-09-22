return {
		"lewis6991/gitsigns.nvim",
		opts = {
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				current_line_blame = true,
				signs = {
						add = { text = '▕' },
						change = { text = '▕' },
						delete = { text = '▕' },
						topdelete = { text = '‾' },
						changedelete = { text = '▕' },
						untracked = { text = '▕' },
				},
		},
}
