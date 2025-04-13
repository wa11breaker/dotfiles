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

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
        }

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "clangd", "harper_ls" },
            handlers = {
                function(server_name)
                    local lsp_config = require("lspconfig")

                    lsp_config[server_name].setup({
                        handlers = handlers,
                    })
                    lsp_config.harper_ls.setup({
                        settings = {
                            ["harper-ls"] = {
                                linters = {
                                    SentenceCapitalization = false,
                                    SpellCheck = false
                                }
                            }
                        }
                    })

                    lsp_config.lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT'
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                workspace = {
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    }
                                }
                            }
                        }
                    })

                    lsp_config.dartls.setup({
                        cmd = {
                            "dart",
                            "language-server",
                            "--protocol=lsp",
                        },
                        filetypes = { "dart" },
                        init_options = {
                            closingLabels = true,
                            outline = false,
                            flutterOutline = false,
                            onlyAnalyzeProjectsWithOpenFiles = false,
                            suggestFromUnimportedLibraries = true,
                        },
                        settings = {
                            dart = {
                                analysisExcludedFolders = {
                                    vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
                                    vim.fn.expand("$HOME/.pub-cache"),
                                    vim.fn.expand("/opt/homebrew/"),
                                    vim.fn.expand("$HOME/tools/flutter/"),
                                },
                                updateImportsOnRename = true,
                                completeFunctionCalls = true,
                                showTodos = true,
                            },
                            updateImportsOnRename = true,
                            completeFunctionCalls = true,
                            showTodos = true,
                        },
                    })
                end,
            },
        })
    end,
}
