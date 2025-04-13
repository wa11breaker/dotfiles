local local_plugin = {
    {
        "flutter-bloc.nvim",
        lazy = true,
        ft = "dart",
        dir = "~/Development/opensource/flutter-bloc.nvim",
        dependencies = {
            "nvimtools/none-ls.nvim",
        },
        opts = {
            bloc_type = "equatable", -- "default" or "equatable" or "freezed"
            use_sealed_classes = true,
            enable_code_actions = true,
        }
    },
    {
        "dart-data-class-generator",
        ft = "dart",
        dir = "~/Development/opensource/dart-data-class-generator.nvim",
        dependencies = {
            "nvimtools/none-ls.nvim",
        },
        opts = {
            enable_code_actions = true,
        }
    }
}

return local_plugin
