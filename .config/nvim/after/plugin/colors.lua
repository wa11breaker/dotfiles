function LoadNoClownFiesta()
    vim.cmd [[colorscheme no-clown-fiesta]]
    require("no-clown-fiesta").setup({
        transparent = false, -- Enable this to disable the bg color
        styles = {
            -- You can set any of the style values specified for `:h nvim_set_hl`
            comments = {},
            keywords = {},
            functions = {},
            variables = {},
            type = { bold = true },
        },
    })
end

function LoadOneDark()
    require('onedark').setup {
        style = 'dark',
        transparent = false, -- Show/hide background
        code_style = {
            comments = 'italic',
            keywords = 'none',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },
        lualine = {
            transparent = true, -- lualine center bar transparency
        },

    }

    require('onedark').load()
end

function LoadKanagawa()
    -- Default options:
    require('kanagawa').setup({
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        globalStatus = false, -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {},
        overrides = {},
        theme = "default" -- Load "default" theme or the experimental "light" theme
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")

end

LoadOneDark()
