return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {
        check_ts = true,
    },
    dependencies = {
        {
            "hrsh7th/nvim-cmp",
            config = function()
                require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
            end,
        },
    },
}
