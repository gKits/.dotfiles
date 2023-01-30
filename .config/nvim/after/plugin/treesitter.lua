require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "help",
        "go",
        "python",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "lua",
        "gitcommit",
        "gitignore",
        "markdown",
        "yaml",
        "json",
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
