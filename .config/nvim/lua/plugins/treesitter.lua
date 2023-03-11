local plugin = require "nvim-treesitter.configs"

plugin.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "scss",
        "yaml",
    },
    textobjects = {
        select = {
            enable = true,
        },
    },
}
