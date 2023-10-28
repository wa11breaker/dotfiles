if vim.g.vscode then
    vim.cmd [[source $HOME/.config/nvim/vscode-neovim.vim]]
else
    require "plugins"
    require "mappings"
    require "autocmds"
    require "options"
end
