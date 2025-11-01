return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    opts = {

        settings = {
            save_on_toggle = true,
        },
    },
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon"):list():add()
            end,
            mode = "n",
            desc = "Add current buffer to harpoon list",
        },
        {
            "<leader>hh",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            mode = "n",
            desc = "Open harpoon UI",
        },
    },
}
