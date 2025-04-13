return {
    "VonHeikemen/lsp-zero.nvim",
    version = "4.x",
    priority = 900,
    dependencies = {
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
        {
            "j-hui/fidget.nvim",
            opts = {}
        },
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            update_in_insert = true,
            virtual_text = {
                spacing = 4,
                min = "Warning",
            },
        })

        local border = {
            { "┌", "FloatBorder" },
            { "─", "FloatBorder" },
            { "┐", "FloatBorder" },
            { "│", "FloatBorder" },
            { "┘", "FloatBorder" },
            { "─", "FloatBorder" },
            { "└", "FloatBorder" },
            { "│", "FloatBorder" },
        }

        -- Override the function with custom border
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            opts.max_width = opts.max_width or 80
            opts.max_height = opts.max_height or 40
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        lsp_zero.extend_lspconfig({
            capabilities = require('blink.cmp').get_lsp_capabilities(),
            sign_text = {
                error = "•",
                warn = "•",
                hint = "•",
                info = "•",
            },
        })
    end,
}
