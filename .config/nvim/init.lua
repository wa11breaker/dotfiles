if vim.g.vscode then
    vim.cmd [[source $HOME/.config/nvim/vscode-neovim.vim]]
else
    require "config.options"
    require "config.lazy"
    require "config.mappings"
    require "config.autocmds"
end
