return {
    "laytan/cloak.nvim",
    event = { "BufEnter" },
    opts = {
        enabled = true,
        cloak_character = "¤",
        highlight_group = "Comment",
        cloak_length = 8,
        try_all_patterns = true,
        cloak_telescope = true,
        patterns = {
            {
                file_pattern = ".env*",
                cloak_pattern = "=.+",
                replace = nil,
            },
        },
    },
    keys = {
        {
            "<leader>eC",
            function()
                require("cloak").toggle()
            end,
            mode = "n",
            desc = "[e]nable [C]loak",
        },
    },
}
