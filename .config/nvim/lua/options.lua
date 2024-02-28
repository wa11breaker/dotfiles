-- Define global options
local options = {
    incsearch = true,                        -- Make search act like search in modern browsers
    backup = false,                          -- Disable backup file creation
    clipboard = "unnamedplus",               -- Allow Neovim to access the system clipboard
    cmdheight = 1,                           -- More space in the Neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- Completion options, mostly for cmp
    conceallevel = 0,                        -- Make `` visible in markdown files
    fileencoding = "utf-8",                  -- Set the encoding written to a file
    hlsearch = true,                         -- Highlight all matches on the previous search pattern
    ignorecase = true,                       -- Ignore case in search patterns
    mouse = "a",                             -- Allow the mouse to be used in Neovim
    pumheight = 15,                          -- Set the pop-up menu height
    showmode = false,                        -- Do not show things like -- INSERT -- anymore
    showtabline = 0,                         -- Always show tabs
    smartcase = true,                        -- Use smart case
    smartindent = true,                      -- Make indenting smarter again
    splitbelow = true,                       -- Force all horizontal splits to go below the current window
    splitright = true,                       -- Force all vertical splits to go to the right of the current window
    swapfile = false,                        -- Disable swap file creation
    termguicolors = true,                    -- Set terminal GUI colors (most terminals support this)
    timeoutlen = 1000,                       -- Time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- Enable persistent undo
    updatetime = 100,                        -- Faster completion (default is 4000ms)
    writebackup = false,                     -- Prevent editing files being edited by another program
    expandtab = true,                        -- Convert tabs to spaces
    shiftwidth = 2,                          -- Number of spaces inserted for each indentation
    tabstop = 2,                             -- Insert 2 spaces for a tab
    cursorline = true,                       -- Highlight the current line
    number = true,                           -- Show line numbers
    breakindent = true,                      -- Wrap lines with indent
    relativenumber = true,                   -- Show relative line numbers
    numberwidth = 4,                         -- Set the number column width
    signcolumn = "yes",                      -- Always show the sign column
    wrap = false,                            -- Display lines as one long line
    scrolloff = 8,                           -- Ensure there are always eight lines of context
    sidescrolloff = 8,                       -- Ensure there are always eight lines of context
    laststatus = 0,                          -- Always display the status line
    showcmd = false,                         -- Don't show the command in the last line
    ruler = false,                           -- Don't show the ruler
    guifont = "monospace:h17",               -- Set the font used in graphical Neovim applications
    title = true,                            -- Set the title of the window to the value of the titlestring
    confirm = true,                          -- Confirm to save changes before exiting a modified buffer
    fillchars = { eob = " " },               -- Change the character at the end of the buffer
    spelllang = 'en_us',
    spell = true,
    syntax = "off",
    showtabline=1
}
vim.highlight.priorities.semantic_tokens = 95
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Apply options
for k, v in pairs(options) do
    vim.opt[k] = v
end
