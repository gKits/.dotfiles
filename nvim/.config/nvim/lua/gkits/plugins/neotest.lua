return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Adapters
        "nvim-neotest/neotest-go",
    },
    config = function()
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_tets = {
                format = function(diagnostic)
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-go")({
                    experimental = {
                        test_table = true,
                    },
                    args = { "-count=1", "-timeout=60s" },
                }),
            },
        })

        local function keymap(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { desc = desc })
        end
        keymap("n", "<leader>tt", neotest.run.run, "Run nearest test")
        keymap("n", "<leader>tw", neotest.watch.toggle, "Toggle test watching")
        keymap(
            "n",
            "<leader>ta",
            "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
            "Run all tests in current file"
        )
        keymap("n", "<leader>td", "<CMD>lua require('neotest').run.run({ strategy = 'dap' })<CR>", "Debug nearest test")
        keymap("n", "<leader>to", "<CMD>Neotest output<CR>", "show test output")
        keymap("n", "<leader>tO", "<CMD>Neotest output-panel<CR>", "show test output panel")
        keymap("n", "]t", neotest.jump.next, "Jump to next test case")
        keymap("n", "[t", neotest.jump.prev, "Jump to previous test case")
    end,
}
