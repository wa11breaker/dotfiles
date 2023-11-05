vim.o.termguicolors = true
require('base16-colorscheme').with_config {
    telescope = false,
}

vim.cmd('colorscheme base16-gruvbox-dark-hard')

-- local function setup_gruvbox()
--     vim.g.gruvbox_contrast_dark = 'hard'
--     vim.g.gruvbox_contrast_light = 'hard'
--     vim.g.gruvbox_sign_column = 'bg0'
--     vim.g.gruvbox_vert_split = 'bg0'
--     vim.g.gruvbox_vert_split = 'bg0'
--
--     vim.cmd [[colorscheme gruvbox]]
--     vim.cmd [[hi LspCxxHlGroupMemberVariable guifg=#83a598]]
-- end
--
-- setup_gruvbox()

-- vim.cmd [[colorscheme onedark]]
-- local ok, catppuccin = pcall(require, "catppuccin")
-- if not ok then return end
-- catppuccin.setup {
--      flavour = "frappe", -- latte, frappe, macchiato, mocha
-- }
-- vim.cmd [[colorscheme catppuccin]]
