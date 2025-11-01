return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        signs_staged = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        current_line_blame = true,
        word_diff = false,
    },
    keys = {
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next")
                end
            end,
            mode = "n",
            desc = "goto next hunk",
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev")
                end
            end,
            mode = "n",
            desc = "goto previous hunk",
        },
        {
            "<leader>hs",
            function()
                require("gitsigns").stage_hunk()
            end,
            mode = "n",
            desc = "stage huk under cursor",
        },
        {
            "<leader>hs",
            function()
                require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            mode = "v",
            desc = "stage highlighted hunk",
        },
        {
            "<leader>hr",
            function()
                require("gitsigns").reset_hunk()
            end,
            mode = "n",
            desc = "stage hunk under cursor",
        },
        {
            "<leader>hr",
            function()
                require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            mode = "v",
            desc = "reset highlighted hunk",
        },
        {
            "<leader>hp",
            function()
                require("gitsigns").stage_hunk()
            end,
            mode = "n",
            desc = "preview hunk under cursor",
        },
        {
            "<leader>hd",
            function()
                require("gitsigns").diffthis()
            end,
            mode = "n",
            desc = "open diff for current buffer",
        },
        {
            "<leader>hw",
            function()
                require("gitsigns").toggle_word_diff()
            end,
            mode = "n",
            desc = "toggle word diff",
        },
        {
            "<leader>htd",
            function()
                require("gitsigns").preview_hunk_inline()
            end,
            mode = "n",
            desc = "toggle deleted hunks",
        },
        {
            "ih",
            function()
                require("gitsigns").select_hunk()
            end,
            mode = { "o", "x" },
            desc = "toggle deleted hunks",
         },
    }
}
