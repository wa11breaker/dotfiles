local ts = require 'telescope'

-- Setup.
ts.setup({
	defaults = {
		sort_mru = true,
		sorting_strategy = 'ascending',
		layout_config = {
			prompt_position = 'top'
		},
		border = true,
		-- borderchars = {
		-- 	prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
		-- 	results = { " " },
		-- 	preview = { " " },
		-- },
		multi_icon = '',
		entry_prefix = '   ',
		prompt_prefix = '   ',
		selection_caret = '  ',
		hl_result_eol = true,
		results_title = "",
		winblend = 0,
		wrap_results = true
	}
})
