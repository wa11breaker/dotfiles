return {
    {
        "supermaven-inc/supermaven-nvim",
        lzy = true,
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-g>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>",
                },
                ignore_filetypes = { cpp = true }, -- or { "cpp", }
                color = {
                    suggestion_color = "#ffffff",
                    cterm = 244,
                },
                log_level = "info",                -- set to "off" to disable logging completely
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false,           -- disables built in keymaps for more manual control
                condition = function()
                    return false
                end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
            })
        end,
    },

    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        enabled = false,
        config = function()
            require("codeium").setup({
                virtual_text = {
                    enabled = true,
                    manual = false,
                    default_filetype_enabled = true,
                    idle_delay = 75,
                    virtual_text_priority = 65535,
                    map_keys = true,
                    -- The key to press when hitting the accept keybinding but no completion is showing.
                    -- Defaults to \t normally or <c-n> when a popup is showing.
                    accept_fallback = nil,
                    -- Key bindings for managing completions in virtual text mode.
                    key_bindings = {
                        -- Accept the current completion.
                        accept = "<C-g>",
                        -- Accept the next word.
                        accept_word = false,
                        -- Accept the next line.
                        accept_line = false,
                        -- Clear the virtual text.
                        clear = false,
                        -- Cycle to the next completion.
                        next = "<M-]>",
                        -- Cycle to the previous completion.
                        prev = "<M-[>",
                    },
                }
            })
        end
    }
}
