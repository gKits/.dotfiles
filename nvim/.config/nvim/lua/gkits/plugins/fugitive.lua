return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git, mode = "n", desc = "open git status ui" },
            { "<leader>mt", "<cmd>Gvdiffsplit!<cr>", mode = "n", desc = "Open [m]erge[t]ool" },
            { "<leader>mh", "<cmd>diffget //2<cr>", mode = "n", desc = "Select to merge from left" },
            { "<leader>ml", "<cmd>diffget //3<cr>", mode = "n", desc = "Select to merge from right" },
        },
    },
    "tpope/vim-rhubarb",
}
