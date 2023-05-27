local map = vim.keymap.set
local opts = { silent = true }

-- Set space as leader
vim.g.mapleader = " "

-- Map
map("n", "<Leader>w", "<C-w>")

-- Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("t", "jk", "<C-\\><C-n>")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Resizing panes
map("n", "<C-Up>", "<cmd>resize -2<CR>")
map("n", "<C-Down>", "<cmd>resize +2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Join lines without moving the curser to the end
map("n", "J", "mzJ`z")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Half page jumping and curser stays in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center after search and jumps
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste and without overwriting register
map("x", "<leader>p", [["_dP]])

-- Delete and without overwriting register
map({ "n", "v" }, "<leader>d", [["_d]])

-- Easier window switching with leader + Number
for i = 1, 6 do
	local lhs = "<Leader>" .. i
	local rhs = i .. "<C-W>w"
	map("n", lhs, rhs, { desc = "Move to Window " .. i })
end

-- Terminal
map({ "n", "t" }, "<leader>t", "<Cmd>ToggleTerm<CR>")
map({ "n", "t" }, "<C-t>", "<Cmd>ToggleTerm<CR>")

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

-- Telescope
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Harpoon
vim.keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true })

-- Undotree
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })


-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>i', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
