local function keymap(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { desc = desc })
end

return {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    keymap("n", "<leader>gs", vim.cmd.Git, "open git status ui"),
    keymap("n", "<leader>mt", "<cmd>Gvdiffsplit!<cr>", "Open [m]erge[t]ool"),
    keymap("n", "<leader>mh", "<cmd>diffget //2<cr>", "Select to merge from left"),
    keymap("n", "<leader>ml", "<cmd>diffget //3<cr>", "Select to merge from right"),
}
