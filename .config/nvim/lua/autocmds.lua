local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 150 }
    end,
})

-- Enable spellchecking in markdown, text and gitcommit files
autocmd("FileType", {
    pattern = { "gitcommit", "markdown", "text", "tex" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- show cursor line only in active window
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

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- resize neovim split when terminal is resized
vim.api.nvim_command('autocmd VimResized * wincmd =')

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "kanagawa",
    callback = function()
        if vim.o.background == "light" then
            vim.fn.system("kitty +kitten themes Kanagawa_light")
        elseif vim.o.background == "dark" then
            vim.fn.system("kitty +kitten themes Kanagawa_dragon")
        else
            vim.fn.system("kitty +kitten themes Kanagawa")
        end
    end,
})
