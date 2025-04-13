return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = {
                function(cmp)
                    return cmp.select_next()
                end,
                "snippet_forward",
                "fallback",
            },
            ["<S-Tab>"] = {
                function(cmp)
                    return cmp.select_prev()
                end,
                "snippet_backward",
                "fallback",
            },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-up>"] = { "scroll_documentation_up", "fallback" },
            ["<C-down>"] = { "scroll_documentation_down", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        completion = {
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = { border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }, }
            },
            menu = {
                min_width = 20,
                border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
                draw = {
                    columns = {
                        -- { "kind_icon", "label", gap = 1 },
                        { "label", gap = 1 },
                        { "kind" },
                    },
                },
            },
        }
    },
    opts_extend = { "sources.default" }
}
