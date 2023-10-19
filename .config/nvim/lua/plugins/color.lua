vim.o.termguicolors = true

local function setup_gruvbox()
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_contrast_light = 'hard'
    vim.g.gruvbox_sign_column = 'bg0'
    vim.g.gruvbox_vert_split = 'bg0'
    vim.g.gruvbox_vert_split = 'bg0'

    vim.cmd [[colorscheme gruvbox]]
    vim.cmd [[hi LspCxxHlGroupMemberVariable guifg=#83a598]]
end

-- setup_gruvbox()

vim.cmd [[colorscheme onedark]]
