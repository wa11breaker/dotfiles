require("telescope").setup({
	defaults = {
		-- layout_strategy = "vertical",
		layout_config = {
			width = 0.80,
			prompt_position = "bottom",
			preview_cutoff = 120,
			preview_width = 0.4,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		["ui-select"] = {
			specific_opts = {
				codeactions = false,
			}
		},
	},
})

-- require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
