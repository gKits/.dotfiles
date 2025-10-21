return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- Add your own debuggers here
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            automatic_setup = true,

            ensure_installed = {
                "delve",
            },
        })

        local function keymap(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { silent = true, desc = desc })
        end

        keymap("n", "<F5>", dap.continue, "Debug continue")
        keymap("n", "<F1>", dap.step_into, "Debug step into")
        keymap("n", "<F2>", dap.step_over, "Debug step over")
        keymap("n", "<F3>", dap.step_out, "Debug step out")
        keymap("n", "<leader>b", dap.toggle_breakpoint, "Debug toggle breakpoint")
        keymap("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, "Debug toggle breakpoint with condition")

        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
            controls = {
                icons = {
                    pause = "⏸",
                    play = "▶",
                    step_into = "⏎",
                    step_over = "⏭",
                    step_out = "⏮",
                    step_back = "b",
                    run_last = "▶▶",
                    terminate = "⏹",
                },
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        require("dap-go").setup()
    end,
}
