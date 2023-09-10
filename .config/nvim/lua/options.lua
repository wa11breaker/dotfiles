local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.background = "dark" -- color schemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift
opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true     -- split vertical window to the right
opt.splitbelow = true     -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
opt.updatetime = 500      -- Trigger Cursor Hold event faster.
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

opt.fillchars = "eob: "   -- remove all ~ symbols

opt.pumheight = 8         -- cmp window height

opt.scrolloff = 8         -- annoying scroll fix

-- persistent undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.laststatus = 0 -- removing status line

-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.o.completeopt = 'menuone,noselect' -- Set complete opt to have a better completion experience
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
