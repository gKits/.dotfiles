return {
    "mfussenegger/nvim-dap",
    config = function()
        require("dap").setup()
        require("dap").listeners.after.event_initialized["dapui_config"] = require("dapui").open
        require("dap").listeners.before.event_terminated["dapui_config"] = require("dapui").close
        require("dap").listeners.before.event_exited["dapui_config"] = require("dapui").close
    end,
    keys = {
        {
            "<F5>",
            function()
                require("dap").continue()
            end,
            mode = "n",
            desc = "Debug continue",
        },
        {
            "<F1>",
            function()
                require("dap").step_into()
            end,
            mode = "n",
            desc = "Debug step into",
        },
        {
            "<F2>",
            function()
                require("dap").step_over()
            end,
            mode = "n",
            desc = "Debug step over",
        },
        {
            "<F3>",
            function()
                require("dap").step_out()
            end,
            mode = "n",
            desc = "Debug step out",
        },
        {
            "<leader>b",
            function()
                require("dap").toggle_breakpoint()
            end,
            mode = "n",
            desc = "Debug toggle breakpoint",
        },
        {
            "<leader>B",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            mode = "n",
            desc = "Debug toggle breakpoint with condition",
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        opts = {
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
        }
    },
    {
        "williamboman/mason.nvim",
        opts = {
            automatic_setup = true,

            ensure_installed = {
                "delve",
             },
        }
    },
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",

    -- Add your own debuggers here
    "leoluz/nvim-dap-go",
}
