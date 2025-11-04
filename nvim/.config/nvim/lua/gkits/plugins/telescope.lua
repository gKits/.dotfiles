return {
    "nvim-telescope/telescope.nvim",
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sort = true,
                case_mode = "smart_case",
            },
        },
        defaults = {
            path_display = { "truncate" },
            mappings = {
                i = {
                    ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    ["<C-j>"] = require("telescope.actions").move_selection_next,
                },
            },
        },
        path_display = { "truncate" },
    },
    keys = {
        {
            "<leader>sf",
            require("telescope.builtin").find_files,
            mode = "n",
            desc = "[s]earch [f]iles",
        },
        {
            "<leader>sr",
            require("telescope.builtin").git_files,
            mode = "n",
            desc = "[s]earch git [r]epository",
        },
        {
            "<leader>sg",
            require("telescope.builtin").live_grep,
            mode = "n",
            desc = "[s]earch with live [g]rep in cwd",
        },
        {
            "<leader>sc",
            require("telescope.builtin").grep_string,
            mode = "n",
            desc = "[s]earch string under [c]ursor in cwd",
        },
        {
            "<leader>sd",
            require("telescope.builtin").diagnostics,
            mode = "n",
            desc = "[s]earch in [d]iagnostics",
        },
        {
            "<leader>sh",
            require("telescope.builtin").help_tags,
            mode = "n",
            desc = "[s]earch [h]elp",
        },
        {
            "<leader><space>",
            require("telescope.builtin").buffers,
            mode = "n",
            desc = "Search existing buffers",
        },
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
                )
            end,
            mode = "n",
            desc = "Fuzzily search in current buffer",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
}
