local check_file_size = function(lang, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 100000
end

local parser = require("nvim-treesitter.parsers").get_parser_configs()
parser.dart = {
    install_info = {
        url = "https://github.com/UserNobody14/tree-sitter-dart",
        files = { "src/parser.c", "src/scanner.c" },
        revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4", -- The last commit before the snail speed
    },
}
local plugin = require "nvim-treesitter.configs"

plugin.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = check_file_size,
    },
    indent = {
        enable = true,
        disable = { "python", "dart" }
    },
    playground = {
        enable = false,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
    },
    autotag = {
        enable = true,
        disable = check_file_size,
    },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    matchup = {
        enable = true,
    },
    ensure_installed = {
        "go",
        "markdown",
        "dart",
        "python",
        "rust",
        "terraform",
        'javascript',
        'jsdoc',
        'typescript',
        'json',
        'lua',
        'yaml',
        'regex',
    },
}
