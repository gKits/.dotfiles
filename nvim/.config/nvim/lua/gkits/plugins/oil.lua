return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "size",
        },
        experimental_watch_for_changes = true,
    },
    keys = {
        { "-", "<CMD>Oil<CR>", "n", "Open parent directory" },
    },
}
