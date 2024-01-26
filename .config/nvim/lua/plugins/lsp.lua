require('neodev').setup()
require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "gopls", "tsserver" },
}

local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
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

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Go
lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Python
lspconfig.pyright.setup {
    on_attach = on_attach,
}

-- JavaScript/Typescript
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("flutter-tools").setup {
    lsp = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
}
