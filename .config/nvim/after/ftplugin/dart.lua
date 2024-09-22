local function flutter_commands()
    require('telescope').extensions.flutter.commands()
end

local function flutter_fcm()
    require('telescope').extensions.flutter.fvm()
end

_G.flutter = flutter_commands
_G.fvm = flutter_fcm

vim.cmd [[command! Flutter lua flutter()]]
vim.cmd [[command! Fvm lua fvm()]]

-- Create bloc and cubit
vim.keymap.set("n", "<Leader>cfb", "<cmd>lua require('flutter-bloc').create_bloc()<cr>",
    { desc = '[C]reate [F]lutter [B]loc' })
vim.keymap.set("n", "<Leader>cfc", "<cmd>lua require('flutter-bloc').create_cubit()<cr>",
    { desc = '[C]reate [F]lutter [C]ubit' })
