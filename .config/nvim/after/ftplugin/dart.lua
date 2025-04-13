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

function DeleteDartComments()
    if vim.bo.filetype ~= "dart" then
        print("Not a Dart file")
        return
    end

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local new_lines = {}

    local multi_line_comment = false
    for _, line in ipairs(lines) do
        -- Remove single-line comments (// and ///)
        local clean_line = line:gsub("%s*//.*", "")

        -- Handle multi-line comments (/* */)
        if multi_line_comment then
            if clean_line:find("%*/") then
                clean_line = clean_line:gsub(".*%*/", "")
                multi_line_comment = false
            else
                clean_line = ""
            end
        else
            if clean_line:find("/%*") then
                clean_line = clean_line:gsub("/%*.*", "")
                multi_line_comment = true
            end
        end

        -- Add non-empty lines
        if clean_line:match("%S") then
            table.insert(new_lines, clean_line)
        end
    end

    -- Set the modified lines back to the buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

vim.api.nvim_create_user_command("DeleteDartComments", DeleteDartComments, {})

vim.api.nvim_create_user_command("DeleteDartComments", DeleteDartComments, {})
