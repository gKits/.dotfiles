---@diagnostic disable: missing-fields
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        {
            "nvim-treesitter/nvim-treesitter",
            branch = "main",
            build = function()
                vim.cmd(":TSUpdate go")
            end,
        },
        -- Adapters
        -- "nvim-neotest/neotest-go",
        {
            "fredrikaverpil/neotest-golang",
            version = "*",
            lazy = false,
        },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-golang")({ runner = "gotestsum", warn_test_name_dupes = false }),
            },
        })
    end,
    keys = {
        {
            "<leader>tt",
            function()
                require("neotest").run.run()
            end,
            mode = "n",
            desc = "Run nearest test",
        },
        {
            "<leader>tw",
            function()
                require("neotest").watch.toggle()
            end,
            mode = "n",
            desc = "Toggle test watching",
        },
        {
            "<leader>ta",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            mode = "n",
            desc = "Run all tests in current file",
        },
        {
            "<leader>td",
            function()
                require("neotest").run.run({ strategy = "dap" })
            end,
            mode = "n",
            desc = "Debug nearest test",
        },
        {
            "<leader>to",
            function()
                require("neotest").output()
            end,
            mode = "n",
            desc = "show test output",
        },
        {
            "<leader>tO",
            function()
                require("neotest").output_panel()
            end,
            mode = "n",
            desc = "show test output panel",
        },
        {
            "]t",
            function()
                require("neotest").jump.next()
            end,
            mode = "n",
            desc = "Jump to next test case",
        },
        {
            "[t",
            function()
                require("neotest").jump.prev()
            end,
            mode = "n",
            desc = "Jump to previous test case",
        },
    },
}
