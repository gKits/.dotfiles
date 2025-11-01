return {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>ll",
            function()
                require("lint").try_lint()
            end,
            mode = "n",
            desc = "Lint current file",
        },
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            -- go = { "golangcilint" },
            json = { "jsonlint" },
            ["yaml.ansible"] = { "ansible_lint" },
            python = { "ruff" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
