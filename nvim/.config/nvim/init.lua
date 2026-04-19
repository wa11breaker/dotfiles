-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core UI / editing
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI tweaks
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars:append({ eob = " " })
vim.o.winborder = "single"

-- Timing / splits
vim.opt.updatetime = 500
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false

-- Keymaps
local map = vim.keymap.set
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

map("n", "<Leader>w", "<C-w>")

-- Better movement
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Quick escape
map("i", "jk", "<ESC>")
map("t", "jk", "<C-\\><C-n>")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Resize splits
map("n", "<C-Up>", "<cmd>resize -2<CR>")
map("n", "<C-Down>", "<cmd>resize +2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Keep cursor on join
map("n", "J", "mzJ`z")

-- Indent persist
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Misc
map("n", "<C-a>", "ggVG")
map("n", "<leader>h", "<cmd>noh<cr><esc>")

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Search navigation centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clipboard helpers
map({ "n", "v" }, "<leader>y", [["+y]])
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- Window navigation
for i = 1, 6 do
    map("n", "<Leader>" .. i, i .. "<C-W>w")
end

-- Diagnostics
map('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

map('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
end)

map('n', '<leader>i', vim.diagnostic.open_float)

-- Shared border style
local border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#2c2e34", bg = "#2c2e34" })


vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", function()
    require("undotree").open({
        command = math.floor(vim.api.nvim_win_get_width(0) / 3) .. "vnew",
    })
end)

-- Colorscheme
vim.pack.add({ { src = "https://github.com/sainnhe/sonokai" } })
vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_transparent_background = 1
vim.cmd.colorscheme("sonokai")

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuBorder", { bg = "NONE" })

-- File explorer
vim.pack.add({ { src = "https://github.com/stevearc/oil.nvim" } })
require("oil").setup({
    default_file_explorer = true,
    view_options = { show_hidden = true },
    win_options = { signcolumn = "yes:2" },
})
map("n", "-", "<cmd>Oil<cr>")

-- Fuzzy finder
vim.pack.add({ { src = "https://github.com/ibhagwan/fzf-lua" } })
local fzf = require("fzf-lua")
fzf.setup({ "telescope", winopts = { border = border } })

map('n', '<leader>sf', fzf.files)
map('n', '<leader>sF', fzf.git_files)
map('n', '<leader>/', fzf.live_grep)
map('n', '<leader>sb', fzf.buffers)

-- Git signs
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require("gitsigns").setup({
    signs = {
        add = { text = '▕' },
        change = { text = '▕' },
        delete = { text = '▕' },
        topdelete = { text = '‾' },
        changedelete = { text = '▕' },
        untracked = { text = '▕' },
    },
})

-- Completion
vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp" } })
require("blink.cmp").setup({
    fuzzy = { prebuilt_binaries = { download = true, force_version = "v1.*" } },
    keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },
    completion = {
        documentation = { auto_show = true },
        menu = { border = border },
    },
})

-- Diagnostics UI
vim.pack.add({ { src = "https://github.com/folke/trouble.nvim" } })
require("trouble").setup({})
map("n", "<leader>dla", "<cmd>Trouble diagnostics toggle<cr>")
map("n", "<leader>dl", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map("n", "<leader>ds", "<cmd>Trouble symbols toggle<cr>")

-- Formatter
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
})

-- LSP setup
vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

require("mason").setup({ ui = { border = "single" } })

local servers = { lua_ls = {}, jsonls = {} }

require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
})

local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("blink.cmp").get_lsp_capabilities()
)

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable(vim.tbl_keys(servers))

-- dart LSP setup
vim.lsp.config("dartls", {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    root_markers = { "pubspec.yaml" },
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = true,
        closingLabels = true,
        outline = true,
        flutterOutline = true,
    },
})
vim.lsp.enable("dartls")

-- Diagnostics config
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
    update_in_insert = false,
    severity_sort = true,
    float = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },
})

-- Session
vim.pack.add({ { src = "https://github.com/rmagatti/auto-session" } })
require("auto-session").setup()

-- Indentation guides
vim.pack.add({ { src = "https://github.com/lukas-reineke/indent-blankline.nvim" } })
require("ibl").setup({ indent = { char = "▏" } })

-- Git UI
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/NeogitOrg/neogit" },
})
require("neogit").setup()

local function window() return vim.api.nvim_win_get_number(0) end

-- Status line
vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim" } })
require("lualine").setup({
    options = {
        component_separators = { " ", " " },
        section_separators = { left = " ", right = " " },
        disabled_filetypes = { "nvim-tree" },
    },
    sections = {
        lualine_a = { { "mode", fmt = function(s) return s:sub(1, 1) end } },
        lualine_b = { "branch", { "diagnostics", update_in_insert = true, symbols = { error = "E ", warn = "W ", hint = "H ", info = "I " } } },
        lualine_c = { { "filename", path = 1, symbols = { modified = "*", readonly = " ", unnamed = "" } } },
        lualine_y = {},
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = { window },
        lualine_b = { function() return "%=" end, { "filename", path = 1, shorting_target = 40, symbols = { modified = "*", unnamed = "[No Name]", newfile = "[New]" } } },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "man", "nvim-dap-ui", "toggleterm", "nvim-tree" },
})
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Tree
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })
require("nvim-tree").setup({
    filters = { dotfiles = true, custom = { ".git", ".DS_Store" } },
    update_focused_file = { enable = true, update_root = true },
    renderer = {
        root_folder_label = function(path) return vim.fn.fnamemodify(path, ":t"):upper() end,
        indent_markers = { enable = true },
        icons = {
            git_placement = "after",
            glyphs = {
                git = { unstaged = "U", staged = "S", unmerged = "UM", renamed = "R", deleted = "D", untracked = "UT", ignored = "I" },
            },
            show = { file = false, folder = false, folder_arrow = true },
        },
    },
    view = {
        signcolumn = "yes",
        float = {
            enable = true,
            open_win_config = function()
                local sw, sh = vim.opt.columns:get(), vim.opt.lines:get() - vim.opt.cmdheight:get()
                local w, h = math.floor(sw * WIDTH_RATIO), math.floor(sh * HEIGHT_RATIO)
                return {
                    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                    style = "minimal",
                    relative = "editor",
                    col = math.floor((sw - w) / 2),
                    row = math.floor((vim.opt.lines:get() - h) / 2) - vim.opt.cmdheight:get(),
                    width = w,
                    height = h,
                }
            end,
        },
    },
})

vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/igorlfs/nvim-dap-view" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
})

local dap     = require("dap")
local dapview = require("dap-view")

-- ---------- UI ----------
dapview.setup()
require("nvim-dap-virtual-text").setup()

local dap_group = vim.api.nvim_create_augroup("UserDap", { clear = true })
vim.api.nvim_create_autocmd("User", {
    pattern  = "DapSessionCreated",
    group    = dap_group,
    callback = function() dapview.open() end,
})
vim.api.nvim_create_autocmd("User", {
    pattern  = "DapSessionTerminated",
    group    = dap_group,
    callback = function() dapview.close() end,
})

-- ---------- Keymaps ----------
local map = vim.keymap.set
map("n", "<space>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<space>gb", dap.run_to_cursor, { desc = "Run to cursor" })
map("n", "<space>dv", dapview.toggle, { desc = "Toggle DAP view" })
map("n", "<F1>", dap.continue, { desc = "DAP continue" })
map("n", "<F2>", dap.step_into, { desc = "DAP step into" })
map("n", "<F3>", dap.step_over, { desc = "DAP step over" })
map("n", "<F4>", dap.step_out, { desc = "DAP step out" })
map("n", "<F5>", dap.step_back, { desc = "DAP step back" })
map("n", "<F13>", dap.restart, { desc = "DAP restart" })

-- ---------- Flutter / Dart adapter ----------
dap.adapters.dart = {
    type    = "executable",
    command = "flutter",
    args    = { "debug_adapter" },
}

dap.configurations.dart = {
    {
        type     = "dart",
        request  = "launch",
        name     = "Launch (pick device)",
        program  = "${workspaceFolder}/lib/main.dart",
        cwd      = "${workspaceFolder}",
        toolArgs = function()
            local device = vim.fn.input("Device ID: ", "macos")
            return { "-d", device }
        end,
    },
}

-- Autocmds
local augroup = vim.api.nvim_create_augroup

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end,
})

-- Disable auto comment
vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup("NoComment", { clear = true }),
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- Equalize splits on resize
vim.api.nvim_create_autocmd("VimResized", {
    group = augroup("ResizeSplits", { clear = true }),
    callback = function()
        vim.cmd("wincmd =")
    end,
})

-- Toggle spellcheck
vim.api.nvim_create_user_command("ToggleSpellcheck", function()
    vim.opt.spell = not vim.opt.spell:get()
end, {})

-- LSP keymaps per buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup("UserLspAttach", { clear = true }),
    callback = function(event)
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf })
        end

        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<C-k>", vim.lsp.buf.signature_help)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
        map("v", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)

        -- Prefer fzf-lua pickers when available, fall back to built-ins
        local ok, fzf = pcall(require, "fzf-lua")
        if ok then
            map("n", "gd", fzf.lsp_definitions)
            map("n", "gr", fzf.lsp_references)
            map("n", "gi", fzf.lsp_implementations)
            map("n", "gt", fzf.lsp_typedefs)
            map("n", "<leader>ca", fzf.lsp_code_actions)
        else
            map("n", "gd", vim.lsp.buf.definition)
            map("n", "gr", vim.lsp.buf.references)
            map("n", "gi", vim.lsp.buf.implementation)
            map("n", "gt", vim.lsp.buf.type_definition)
            map("n", "<leader>ca", vim.lsp.buf.code_action)
        end
    end,
})
