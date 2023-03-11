local onedark= require "onedark"

onedark.setup {
    style = 'dark',
    transparent = false,
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    lualine = {
        transparent = true,
    },
}
onedark.load()

