return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
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
                    accept = "<Tab>",
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
