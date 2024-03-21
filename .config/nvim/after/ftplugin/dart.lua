local function flutter_commands()
    require('telescope').extensions.flutter.commands()
end

local function flutter_fcm()
    require('telescope').extensions.flutter.fvm()
end

-- C to clear log in __FLUTTER_DEV_LOG__ buffer
-- _G.original_mapping = nil
-- function CreateFlutterLogMapping()
--     if _G.original_mapping == nil then
--         local bufnr = vim.api.nvim_get_current_buf()
--         local mappings = vim.api.nvim_buf_get_keymap(bufnr, 'n')
--
--         for _, mapping in ipairs(mappings) do
--             print(mapping)
--             -- if mapping.lhs == '<C-l>' then
--             --     print(mapping.rhs)
--             -- end
--         end

-- if vim.fn.expand("%:t") == "__FLUTTER_DEV_LOG__" then
--     print('__FLUTTER_DEV_LOG__ buffer detected')
--     vim.api.nvim_set_keymap('n', '<C-l>', ':FlutterLogClear<CR>', { noremap = true, silent = true })
-- else
--     vim.api.nvim_set_keymap('n', '<C-l>', _G.original_mapping['rhs'],
--         { noremap = _G.original_mapping['noremap'], silent = _G.original_mapping['silent'] })
--     _G.original_mapping = nil
-- end
-- end

-- Function to remove the mapping when leaving the buffer
-- function RemoveFlutterLogMapping()
-- if _G.original_mapping then
--     vim.api.nvim_set_keymap('n', '<C-l>', _G.original_mapping['rhs'],
--         { noremap = _G.original_mapping['noremap'], silent = _G.original_mapping['silent'] })
--     _G.original_mapping = nil
-- end

-- vim.cmd('autocmd BufEnter __FLUTTER_DEV_LOG__ lua CreateFlutterLogMapping()')
-- vim.cmd('autocmd BufLeave __FLUTTER_DEV_LOG__ lua RemoveFlutterLogMapping()')

_G.flutter = flutter_commands
_G.fvm = flutter_fcm

vim.cmd [[command! Flutter lua flutter()]]
vim.cmd [[command! Fvm lua fvm()]]

vim.keymap.set("n", "<Leader>cl", ":FlutterLogClear<cr>", { desc = '[C]lear [F]lutter [L]og' })


-- Create bloc and cubit
vim.keymap.set("n", "<Leader>cfb", "<cmd>lua require('flutter-bloc').create_bloc()<cr>",
    { desc = '[C]reate [F]lutter [B]loc' })
vim.keymap.set("n", "<Leader>cfc", "<cmd>lua require('flutter-bloc').create_cubit()<cr>",
    { desc = '[C]reate [F]lutter [C]ubit' })
