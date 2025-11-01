return {
    -- Rosepine theme
    "catppuccin/nvim",
    priority = 1000,
    opts = {
        transparent_background = true,
        dim_inactive = {
            enabled = true,
        },
        styles = {
            strings = { "italic" },
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
