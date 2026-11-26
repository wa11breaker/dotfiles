-- Create bloc and cubit
vim.keymap.set("n", "<Leader>cfb", function() require("flutter-bloc").create_bloc() end,
    { buffer = true, desc = "[C]reate [F]lutter [B]loc" })
vim.keymap.set("n", "<Leader>cfc", function() require("flutter-bloc").create_cubit() end,
    { buffer = true, desc = "[C]reate [F]lutter [C]ubit" })

-- Remove all comments from the current Dart buffer.
-- Uses the treesitter parse tree, so `//` inside strings (e.g. URLs) is left alone.
-- Lines that only held a comment are removed; existing blank lines are kept.
local function delete_dart_comments(bufnr)
    local ok, parser = pcall(vim.treesitter.get_parser, bufnr, "dart")
    if not ok or not parser then
        vim.notify("Dart treesitter parser not available", vim.log.levels.ERROR)
        return
    end

    local root = parser:parse()[1]:root()
    local query = vim.treesitter.query.parse("dart", "[(comment) (documentation_comment)] @comment")

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    -- Collect byte spans to cut, per line (0-based start col, exclusive end col)
    local cuts = {}
    local function add_cut(row, scol, ecol)
        cuts[row] = cuts[row] or {}
        table.insert(cuts[row], { scol, ecol })
    end
    for _, node in query:iter_captures(root, bufnr) do
        local srow, scol, erow, ecol = node:range()
        for row = srow, erow do
            local len = #lines[row + 1]
            add_cut(row, row == srow and scol or 0, row == erow and ecol or len)
        end
    end
    if vim.tbl_isempty(cuts) then return end

    local out = {}
    for i, line in ipairs(lines) do
        local row_cuts = cuts[i - 1]
        if not row_cuts then
            table.insert(out, line)
        else
            -- Apply cuts right-to-left so earlier columns stay valid
            table.sort(row_cuts, function(a, b) return a[1] > b[1] end)
            local new = line
            for _, c in ipairs(row_cuts) do
                new = new:sub(1, c[1]) .. new:sub(c[2] + 1)
            end
            new = new:gsub("%s+$", "")
            -- Drop lines that only held a comment
            if new:match("%S") then
                table.insert(out, new)
            end
        end
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, out)
end

vim.api.nvim_buf_create_user_command(0, "DeleteDartComments", function()
    delete_dart_comments(vim.api.nvim_get_current_buf())
end, { desc = "Delete all comments in this Dart buffer" })
