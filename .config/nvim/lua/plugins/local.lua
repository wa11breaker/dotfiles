-- Plugin configuration (in your lazy plugins file)
local local_plugin = {
    {
        "flutter-bloc.nvim",
        lazy = true,
        ft = "dart",
        dir = "~/Development/opensource/flutter-bloc.nvim",
        opts = {
            blocType = "default" -- or "equatable" or "freezed"
        }
    }
}

return local_plugin
