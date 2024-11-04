return {
    "ThePrimeagen/harpoon",
    setup = function()
        require("harpoon").setup({})

        vim.keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
        vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
        vim.keymap.set("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true })
        vim.keymap.set("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true })
        vim.keymap.set("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true })
        vim.keymap.set("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true })
    end
}
