return {
    "mfussenegger/nvim-dap",
    keys = {
        -- stylua: ignore start
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "[d]ebug toggle [b]reakpoint" },
        { "<leader>dc", function() require("dap").continue() end,          desc = "[d]ebug [c]ontinue" },
        { "<Down>",     function() require("dap").step_into() end,         desc = "debug step into" },
        { "<Up>",       function() require("dap").step_out() end,          desc = "debug step out" },
        { "<Right>",    function() require("dap").step_over() end,         desc = "debug step Over" },
        { "<leader>dt", function() require("dap").terminate() end,         desc = "[d]ebug [t]erminate" },
        -- stylua: ignore end
    },
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "theHamsta/nvim-dap-virtual-text" },
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
            },
        },
        "nvim-neotest/nvim-nio",
        {
            "jay-babu/mason-nvim-dap.nvim",
            dependencies = { "mason.nvim" },
            opts = {
                automatic_setup = true,
                ensure_installed = {
                    "delve",
                },
            },
        },

        -- Add your own debuggers here
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.after.event_initialized.dapui_config = dapui.open
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        dap.listeners.before.event_exited.dapui_config = dapui.close
    end,
}
