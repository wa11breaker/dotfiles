local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"

local plugins = {
    -- Standard Library
    {
        "nvim-lua/plenary.nvim",
        version = "*",
    },

    -- Theming
    {
        "catppuccin/nvim"
    },
    {
        "joshdick/onedark.vim",
        enabled = true,
        priority = 1000,
        config = function() require "plugins/color" end,
    },

    -- Essentials
    {
        "echasnovski/mini.trailspace",
        version = "*",
        event = "BufEnter",
        opts = {},
    },
    {
        "windwp/nvim-autopairs",
        version = "*",
        opts = {}
    },
    {
        "kyazdani42/nvim-web-devicons",
        version = "*",
    },
    {
        "folke/zen-mode.nvim",
        version = "*",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "*",
        opts = {},
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                version = "*",
                event = "BufEnter",
            },
            {
                "nkrkv/nvim-treesitter-rescript",
                version = "*",
            },
        },
        event = "BufEnter",
        build = ":TSUpdate",
        config = function() require "plugins/treesitter" end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            { "j-hui/fidget.nvim", tag = "legacy", opts = {}, },
            'folke/neodev.nvim'
        },
        config = function() require "plugins/lsp" end,
    },

    -- Autocompletions
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        },
        config = function() require "plugins/cmp" end,
    },
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function()
            vim.g.codeium_disable_bindings = 1
        end,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "leoluz/nvim-dap-go",
        },
        config = function() require "plugins/dap" end,
    },

    -- Flutter
    {
        "akinsho/flutter-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        version = "*",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- File Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require "plugins/tree" end,
    },

    -- Fuzzy Finders
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
        },
        config = function() require "plugins/telescope" end,
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        event = "BufEnter",
        config = function() require "plugins/gitsigns" end,
    },

    -- Bars
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require "plugins/lualine" end,
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function() require "plugins/toggleterm" end,
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        version = "*",
        event = "BufEnter",
        opts = {},
    },

    -- Misc
    {
        "jiaoshijie/undotree",
        config = function() require "plugins/undotree" end,
    },
    {
        "ThePrimeagen/harpoon",
    },
}

local options = {
    defaults = {
        lazy = false,
        version = "*",
    },
    -- lockfile = "~/.config/nvim/lazy-lock.json",
}

lazy.setup(plugins, options)
