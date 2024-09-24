local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local customGroup = augroup("customGroup", {})

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    end
})

-- Highlight yanked text
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150,
        })
    end,
})

-- Enable spellchecking in markdown, text, and gitcommit files
autocmd("FileType", {
    group = customGroup,
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- Show cursor line only in the active window
autocmd({ "InsertLeave", "WinEnter" }, {
    group = customGroup,
    pattern = "*",
    command = "set cursorline",
})
autocmd({ "InsertEnter", "WinLeave" }, {
    group = customGroup,
    pattern = "*",
    command = "set nocursorline",
})

-- Don't auto comment new lines
autocmd("BufEnter", {
    group = customGroup,
    command = [[set formatoptions-=cro]]
})

-- Resize Neovim split when the terminal is resized
autocmd("VimResized", {
    group = customGroup,
    command = "wincmd ="
})

ToggleSpellcheck = function()
    if vim.o.spell then
        vim.opt.spell = false
        print("Spell checking disabled.")
    else
        vim.opt.spell = true
        print("Spell checking enabled.")
    end
end
vim.cmd('command! ToggleSpellcheck lua ToggleSpellcheck()')
