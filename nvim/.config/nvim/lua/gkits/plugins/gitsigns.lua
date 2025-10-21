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
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            _ = bufnr

            local function keymap(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            keymap("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gs.nav_hunk("next")
                end
            end, "goto next hunk")
            keymap("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gs.nav_hunk("prev")
                end
            end, "goto previous hunk")

            keymap("n", "<leader>hs", gs.stage_hunk, "stage hunk under cursor")
            keymap("v", "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "stage highlighted hunk")

            keymap("n", "<leader>hr", gs.reset_hunk, "stage hunk under cursor")
            keymap("v", "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "reset highlighted hunk")

            keymap("n", "<leader>hu", gs.undo_stage_hunk, "unstage hunk under cursor")

            keymap("n", "<leader>hp", gs.stage_hunk, "preview hunk under cursor")

            keymap("n", "<leader>hd", gs.diffthis, "open diff for current buffer")
            keymap("n", "<leader>hw", gs.toggle_word_diff, "toggle word diff")
            keymap("n", "<leader>htd", gs.toggle_deleted, "toggle deleted hunks")

            keymap({ "o", "x" }, "ih", gs.select_hunk, "toggle deleted hunks")
        end,
    },
}
