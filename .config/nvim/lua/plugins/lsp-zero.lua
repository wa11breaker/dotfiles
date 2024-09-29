return {
    "VonHeikemen/lsp-zero.nvim",
    version = "4.x",
    priority = 900,
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        {
            "j-hui/fidget.nvim",
            opts = {}
        }
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

        -- Override border globally
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        lsp_zero.extend_lspconfig({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            sign_text = {
                error = "•",
                warn = "•",
                hint = "•",
                info = "•",
            },
        })
    end,
}
