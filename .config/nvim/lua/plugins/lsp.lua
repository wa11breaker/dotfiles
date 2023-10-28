require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls" },
}
require('neodev').setup()

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

-- Check if gopls executable exists
if vim.fn.executable('gopls') == 1 then
    lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Check if pyright executable exists
if vim.fn.executable('pyright') == 1 then
    lspconfig.pyright.setup {}
end

-- JavaScript/Typescript
if vim.fn.executable('tsserver') == 1 then
    lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

require("flutter-tools").setup {
    lsp = {
        on_attach = on_attach,
    },
    debugger = {
        enabled = true,
        run_via_dap = true,
        register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
        end,
    }
}

-- Ruby on rails
if vim.fn.executable('solargraph') == 1 then
    lspconfig.solargraph.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        flags = { debounce_text_changes = 300 },
        single_file_support = true, -- Allow LSP to work in standalone Ruby scripts
        settings = { solargraph = { diagnostics = false } },
    })
end


-- Standard Ruby LSP is not yet part of nvim-lspconfig, so we need to start it
-- ourselves.
local lsp = vim.lsp

vim.api.nvim_create_autocmd('FileType', {
    pattern = "ruby",
    callback = function()
        lsp.start({
            name = "standardrb",
            cmd = { "standardrb", "--lsp" },
        })
        vim.keymap.set("n", "'f", lsp.buf.format, { buffer = true })
    end,
})
