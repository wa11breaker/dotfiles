local local_plugin = {
    {
        "flutter-bloc.nvim",
        lazy = true,
        ft = "dart",
        dir = "~/Development/opensource/flutter-bloc.nvim",
        config = function()
            local flutter_bloc = require("flutter-bloc")
        end
    }

}

return local_plugin
