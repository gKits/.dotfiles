return {
    "mbbill/undotree",
    opts = {},
    keys = {
        {
            "<leader>u",
            function()
                vim.cmd.UndotreeToggle()
            end,
            mode = "n",
        },
    },
}
