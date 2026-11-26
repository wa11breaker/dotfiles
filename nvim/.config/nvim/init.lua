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
vim.opt.exrc = true -- load trusted project-local .nvim.lua files

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

-- Clipboard helpers (yank already goes to + via clipboard=unnamedplus)
map("x", "<leader>p", [["_dP]])
-- Delete without yanking. Normal mode only gets <leader>dd (line) because
-- <leader>d is the debug prefix; visual <leader>d doesn't clash with it.
map("n", "<leader>dd", [["_dd]], { desc = "Delete line (no yank)" })
map("x", "<leader>d", [["_d]], { desc = "Delete selection (no yank)" })

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

-- Images (kitty graphics protocol). Only the image module of snacks is enabled.
-- Renders image files opened as buffers, plus fzf-lua / oil / nvim-tree previews.
-- Needs ImageMagick (`magick`) for non-PNG formats.
vim.pack.add({ { src = "https://github.com/folke/snacks.nvim" } })
require("snacks").setup({
    image = { enabled = true },
})

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
fzf.register_ui_select()

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
    -- VS Code-style keys
    keymap = {
        preset = "none",
        -- Menu closed: open it. Menu open: toggle the docs panel.
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
        -- Tab accepts when the menu is open, otherwise jumps to the next snippet placeholder
        ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
        -- First item selected; moving through the list doesn't change the text
        list = { selection = { preselect = true, auto_insert = false } },
        -- Insert () after accepting a function/method
        accept = { auto_brackets = { enabled = true } },
        menu = {
            border = border,
            draw = {
                treesitter = { "lsp" },
                columns = {
                    { "kind_icon" },
                    { "label", "label_description", gap = 1 },
                    { "kind" },
                },
            },
        },
        -- Docs panel stays closed until <C-space> (press again to hide)
        documentation = { auto_show = false, window = { border = border } },
        ghost_text = { enabled = false },
    },
    -- Parameter hints while typing a call, like VS Code
    signature = { enabled = true, window = { border = border } },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
})

-- Diagnostics UI
vim.pack.add({ { src = "https://github.com/folke/trouble.nvim" } })
require("trouble").setup({})
-- Under <leader>x (<leader>d is the debug prefix)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (workspace)" })
map("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnostics (buffer)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols" })

-- Dart SDK binary (used by conform + dartls); fall back to FVM's default SDK if dart isn't on PATH
local dart_bin = vim.fn.exepath("dart")
if dart_bin == "" then dart_bin = vim.fn.expand("~/fvm/default/bin/dart") end

-- Formatter
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        dart = { "dart_format" },
    },
    formatters = {
        dart_format = { command = dart_bin },
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
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

-- dart LSP setup (server ships with the Dart SDK)
vim.lsp.config("dartls", {
    cmd = { dart_bin, "language-server", "--protocol=lsp" },
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

-- Treesitter (dart parser is also used by flutter-bloc code actions)
-- lua, vim, vimdoc, markdown, query and c parsers ship with Neovim itself.
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })
require("nvim-treesitter").install({
    "dart", "python", "javascript", "typescript", "go", "ruby", "json", "yaml", "bash",
})
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
    callback = function(args)
        -- Silently skip filetypes without an installed parser
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- flutter-bloc (local checkout for testing); guarded so a missing checkout
-- doesn't abort the rest of the config
local flutter_bloc_path = vim.fn.expand("~/development/projects/neovim/flutter-bloc.nvim")
if vim.uv.fs_stat(flutter_bloc_path) then
    vim.opt.rtp:prepend(flutter_bloc_path)
    local ok, flutter_bloc = pcall(require, "flutter-bloc")
    if ok then
        flutter_bloc.setup()
    else
        vim.notify("flutter-bloc failed to load: " .. flutter_bloc, vim.log.levels.WARN)
    end
end

-- dart-data-class-generator (local checkout for testing)
local dart_data_class_path = vim.fn.expand("~/development/projects/neovim/dart-data-class-generator.nvim")
if vim.uv.fs_stat(dart_data_class_path) then
    vim.opt.rtp:prepend(dart_data_class_path)
    local ok, dart_data_class = pcall(require, "dart-data-class-generator")
    if ok then
        dart_data_class.setup()
    else
        vim.notify("dart-data-class-generator failed to load: " .. dart_data_class, vim.log.levels.WARN)
    end
end

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
    float = { border = border },
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
    extensions = { "man", "nvim-tree" },
})
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Tree
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

-- Image preview float shown beside the (floating) nvim-tree while the cursor is
-- on an image file. nvim-tree has no preview of its own.
local tree_preview = { win = nil, buf = nil, path = nil }

local function tree_preview_close()
    if tree_preview.win and vim.api.nvim_win_is_valid(tree_preview.win) then
        vim.api.nvim_win_close(tree_preview.win, true)
    end
    if tree_preview.buf and vim.api.nvim_buf_is_valid(tree_preview.buf) then
        vim.api.nvim_buf_delete(tree_preview.buf, { force = true })
    end
    tree_preview.win, tree_preview.buf, tree_preview.path = nil, nil, nil
end

local function tree_preview_update()
    local ok, node = pcall(function() return require("nvim-tree.api").tree.get_node_under_cursor() end)
    local path = ok and node and node.type == "file" and node.absolute_path or nil
    if not path or not Snacks.image.supports(path) then
        return tree_preview_close()
    end
    if path == tree_preview.path then return end
    tree_preview_close()

    -- Place it in the space to the right of the tree; overlap the tree's right
    -- half if the screen is too narrow.
    local tree_win = vim.api.nvim_get_current_win()
    local cfg = vim.api.nvim_win_get_config(tree_win)
    local col = (cfg.col or 0) + cfg.width + 2
    local width = vim.o.columns - col - 2
    if width < 30 then
        width = math.floor(cfg.width / 2)
        col = (cfg.col or 0) + cfg.width - width
    end

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, false, {
        relative = "editor",
        row = cfg.row or 0,
        col = col,
        width = width,
        height = cfg.height,
        border = border,
        style = "minimal",
        focusable = false,
        title = " " .. vim.fn.fnamemodify(path, ":t") .. " ",
        title_pos = "center",
    })
    tree_preview.win, tree_preview.buf, tree_preview.path = win, buf, path
    Snacks.image.buf.attach(buf, { src = path })
end
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })
require("nvim-tree").setup({
    -- Leave directory buffers (`nvim .`, :e dir/) to oil
    hijack_netrw = false,
    hijack_directories = { enable = false },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<Esc>", api.tree.close,
            { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "nvim-tree: Close" })

        -- Image preview beside the tree
        local group = vim.api.nvim_create_augroup("NvimTreeImagePreview", { clear = false })
        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group, buffer = bufnr, callback = tree_preview_update,
        })
        vim.api.nvim_create_autocmd({ "BufLeave", "BufWipeout" }, {
            group = group, buffer = bufnr, callback = tree_preview_close,
        })
    end,
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
                    border = border,
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

-- ---------- Keymaps (all under <leader>d) ----------
map("n", "<leader>dc", dap.continue, { desc = "Debug: start / continue" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
map("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: conditional breakpoint" })
map("n", "<leader>dn", dap.step_over, { desc = "Debug: step over (next)" })
map("n", "<leader>di", dap.step_into, { desc = "Debug: step into" })
map("n", "<leader>do", dap.step_out, { desc = "Debug: step out" })
map("n", "<leader>dr", dap.run_to_cursor, { desc = "Debug: run to cursor" })
map({ "n", "v" }, "<leader>de", function() require("dap.ui.widgets").hover() end,
    { desc = "Debug: evaluate under cursor" })
map("n", "<leader>dv", dapview.toggle, { desc = "Debug: toggle DAP view" })
map("n", "<leader>dR", dap.restart, { desc = "Debug: restart" })
map("n", "<leader>dq", function()
    -- Disconnect without killing the app (matters when attached to `flutter run`)
    dap.disconnect({ terminateDebuggee = false })
end, { desc = "Debug: stop / disconnect" })

-- ---------- Session-only single-key stepping ----------
-- While a debug session is active: n = step over, i = into, o = out, c = continue.
-- Whatever those keys were mapped to before (e.g. n -> nzzzv) is restored when
-- the last session ends.
local session_keys = {
    n = { dap.step_over, "Debug: step over" },
    i = { dap.step_into, "Debug: step into" },
    o = { dap.step_out, "Debug: step out" },
    c = { dap.continue, "Debug: continue" },
}
local saved_maps = nil

local function enable_session_keys()
    if saved_maps then return end
    saved_maps = {}
    for lhs, spec in pairs(session_keys) do
        local prev = vim.fn.maparg(lhs, "n", false, true)
        saved_maps[lhs] = (prev and prev.lhs) and prev or false
        vim.keymap.set("n", lhs, spec[1], { desc = spec[2] })
    end
end

local function disable_session_keys()
    if not saved_maps or dap.session() then return end -- other sessions still running
    for lhs, prev in pairs(saved_maps) do
        pcall(vim.keymap.del, "n", lhs)
        if prev then vim.fn.mapset("n", false, prev) end
    end
    saved_maps = nil
end

-- Open the view and enable stepping keys when a session starts; undo when it ends
dap.listeners.after.event_initialized["user-dap"] = function()
    enable_session_keys()
    dapview.open()
end
local function on_session_end()
    vim.schedule(function()
        if dap.session() then return end
        disable_session_keys()
        dapview.close()
    end)
end
dap.listeners.after.event_terminated["user-dap"] = on_session_end
dap.listeners.after.event_exited["user-dap"] = on_session_end
dap.listeners.after.disconnect["user-dap"] = on_session_end

-- ---------- Flutter / Dart adapter ----------
-- Resolve flutter at session start: project-pinned FVM SDK (.fvm/flutter_sdk),
-- then PATH, then FVM's global default. Neovim's PATH may not include FVM.
local function flutter_bin(root)
    local candidates = {
        root .. "/.fvm/flutter_sdk/bin/flutter",
        vim.fn.exepath("flutter"),
        vim.fn.expand("~/fvm/default/bin/flutter"),
    }
    for _, path in ipairs(candidates) do
        if path ~= "" and vim.fn.executable(path) == 1 then return path end
    end
    return "flutter"
end

dap.adapters.dart = function(callback, config)
    local root = config.cwd or vim.fn.getcwd()
    root = root:gsub("%${workspaceFolder}", vim.fn.getcwd())
    callback({
        type    = "executable",
        command = flutter_bin(root),
        args    = { "debug_adapter" },
    })
end

dap.configurations.dart = {
    {
        type     = "dart",
        request  = "launch",
        name     = "Launch (pick device)",
        program  = "${workspaceFolder}/lib/main.dart",
        cwd      = "${workspaceFolder}",
        toolArgs = function()
            local device = vim.fn.input("Device ID: ", "emulator-5554")
            return { "-d", device }
        end,
    },
    {
        -- Attach to an app started with `flutter run` in a terminal.
        -- Prompts are handled by the on_config hook below.
        -- Web (Chrome) apps can't be attached to; use the Launch config instead.
        type          = "dart",
        request       = "attach",
        name          = "Attach to running app",
        cwd           = "${workspaceFolder}",
        flutterAttach = true,
    },
}

local function adb_bin()
    local candidates = {
        vim.fn.exepath("adb"),
        (vim.env.ANDROID_HOME or "") .. "/platform-tools/adb",
        "/opt/homebrew/share/android-commandlinetools/platform-tools/adb",
    }
    for _, p in ipairs(candidates) do
        if p ~= "" and vim.fn.executable(p) == 1 then return p end
    end
end

-- Newest device-side VM service URL for the app on an Android device.
-- `flutter attach` without a URL scans logcat and can latch onto a stale entry
-- from an earlier run (attaching to a dead VM: no threads, breakpoints never
-- resolve). And on Android, --debug-url must be the DEVICE-side URL (it gets
-- adb-forwarded), not the host URL `flutter run` prints. So read logcat ourselves.
local function android_vm_service_uri(adb, device)
    -- Only consider log lines from processes that are still alive
    local alive = {}
    for _, pid in ipairs(vim.fn.systemlist({ adb, "-s", device, "shell", "ps", "-A", "-o", "PID" })) do
        alive[vim.trim(pid)] = true
    end
    local lines = vim.fn.systemlist({ adb, "-s", device, "logcat", "-d", "-v", "threadtime", "-s", "flutter" })
    local uri
    for _, line in ipairs(lines) do
        -- "11-26 22:42:38.804  5823  5872 I flutter : The Dart VM service is listening on http://..."
        local pid, found = line:match("^%S+%s+%S+%s+(%d+)%s+%d+.-Dart VM [Ss]ervice is listening on (http://%S+)")
        if pid and alive[pid] then uri = found end
    end
    return uri
end

local function normalize_vm_uri(uri)
    -- Accept the DevTools link: http://host/TOKEN=/devtools/?uri=ws://host/TOKEN=/ws
    local embedded = uri:match("[?&]uri=([^&]+)")
    if embedded then uri = vim.uri_decode(embedded) end
    -- ws://host/TOKEN=/ws -> http://host/TOKEN=/
    return (uri:gsub("^ws://", "http://"):gsub("/ws$", "/"))
end

dap.listeners.on_config["flutter-attach"] = function(config)
    if not config.flutterAttach then return config end
    config = vim.deepcopy(config)
    config.flutterAttach = nil

    -- `flutter attach` refuses to pick when several devices are connected
    local device = vim.trim(vim.fn.input("Device ID: ", "emulator-5554"))
    config.toolArgs = { "-d", device }

    local adb = adb_bin()
    local is_android = adb and vim.fn.system({ adb, "-s", device, "get-state" }):match("device") ~= nil
    if is_android then
        local uri = android_vm_service_uri(adb, device)
        if uri then
            config.vmServiceUri = uri
            vim.notify("Attaching to " .. uri, vim.log.levels.INFO)
        else
            vim.notify("No VM service found in logcat; is `flutter run` running?", vim.log.levels.WARN)
        end
    else
        -- Desktop/iOS: paste the "Dart VM Service ... available at:" URL (or leave empty)
        local uri = vim.trim(vim.fn.input("VM Service URI (empty = auto-discover): "))
        if uri ~= "" then config.vmServiceUri = normalize_vm_uri(uri) end
    end
    return config
end

-- Autocmds
local augroup = vim.api.nvim_create_augroup

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.hl.on_yank({ timeout = 150 })
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
        -- Same formatter as format-on-save (conform), LSP only as fallback
        map({ "n", "v" }, "<leader>f", function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end)

        -- Uses Neovim's built-in gr* prefix (grr/gri/grt/gra) so plain `gr`
        -- doesn't wait on timeoutlen, and `gi`/`gt` keep their Vim meaning.
        -- Prefer fzf-lua pickers when available, fall back to built-ins
        local ok, fzf = pcall(require, "fzf-lua")
        if ok then
            map("n", "gd", fzf.lsp_definitions)
            map("n", "grr", fzf.lsp_references)
            map("n", "gri", fzf.lsp_implementations)
            map("n", "grt", fzf.lsp_typedefs)
            map({ "n", "v" }, "gra", fzf.lsp_code_actions)
            map({ "n", "v" }, "<leader>ca", fzf.lsp_code_actions)
        else
            map("n", "gd", vim.lsp.buf.definition)
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
        end
    end,
})
