return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "dockerls",
            "golangci_lint_ls",
            "gopls",
            "html",
            "lua_ls",
            "tailwindcss",
            "templ",
            "ts_ls",
        },
    },

    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },

        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            opts = {
                ensure_installed = {
                    "goimports",
                    "golines",
                    "delve",
                    "golangci-lint",
                    "jsonlint",
                    "prettierd",
                },
            },
        },

        { "j-hui/fidget.nvim", opts = {}, tag = "legacy" },

        "neovim/nvim-lspconfig",
    },
}
