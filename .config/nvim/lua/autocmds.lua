local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', opts)
    end
})

-- Highlight yanked text
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
  augroup END
]], false)

-- Enable spellchecking in markdown, text, and gitcommit files
autocmd("FileType", {
    pattern = { "gitcommit", "markdown", "text", "tex" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

local function toggle_spellcheck()
    if vim.o.spell then
        vim.opt.spell = false
        print("Spell checking disabled.")
    else
        vim.opt.spell = true
        print("Spell checking enabled.")
    end
end
vim.cmd('command! ToggleSpellcheck lua toggle_spellcheck()')

-- Show cursor line only in the active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    pattern = "*",
    command = "set cursorline",
    group = cursorGrp,
})
vim.api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Don't auto comment new lines
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Resize Neovim split when the terminal is resized
vim.api.nvim_command('autocmd VimResized * wincmd =')
