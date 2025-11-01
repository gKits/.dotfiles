return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters = {
            golines = {
                command = "golines",
                args = { "-m", os.getenv("GOLINES_LENGTH") or "120", "--shorten-comments" },
            },
        },
        formatters_by_ft = {
            go = { "gofumpt", "goimports", "golines" },
            templ = { "goimports", "templ" },
            json = { "prettierd" },
            python = { "ruff" },
            html = { "prettierd" },
            markdown = { "prettierd" },
            yaml = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end,
            mode = { "n", "v" },
            desc = "[f]ormat [f]ile or marked range (visual)",
        },
    },
}
