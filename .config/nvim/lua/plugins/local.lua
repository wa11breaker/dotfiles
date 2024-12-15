local local_plugin = {
    {
        "flutter-bloc.nvim",
        lazy = true,
        ft = "dart",
        dir = "~/Development/opensource/flutter-bloc.nvim",
        opts = {
            bloc_type = "equatable", -- "default" or "equatable" or "freezed"
            use_sealed_classes = true,
        }
    }
}

return local_plugin
