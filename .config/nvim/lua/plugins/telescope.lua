require("telescope").setup({
	-- defaults = require("telescope.themes").get_dropdown({
	-- 	file_sorter = require("telescope.sorters").get_fzy_sorter,
	-- 	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	-- 	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	-- 	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	-- 	mappings = {
	-- 		i = {
	-- 			["<C-x>"] = false,
	-- 		},
	-- 	},
	-- 	file_ignore_patterns = {
	-- 		"src/parser.c",
	-- 		"node_modules/",
	-- 		"build/",
	-- 	},
	-- 	dynamic_preview_title = true,
	-- 	pickers = {
	-- 		find_files = {
	-- 			theme = "dropdown",
	-- 			previewer = false,
	-- 		},
	-- 	},
	-- }),
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
