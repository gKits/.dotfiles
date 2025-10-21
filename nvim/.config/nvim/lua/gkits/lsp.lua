local keymap = vim.keymap.set
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Run [c]ode [a]ction"
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "[g]o to [d]efinition"
        keymap("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "go to declaration"
        keymap("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "[l]ist [d]efinitions"
        keymap("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "[l]ist [r]eferences"
        keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show [d]ocument [s]ymbols"
        keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts)

        opts.desc = "[l]ist [i]mplementations"
        keymap("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Smart [r]e[n]ame"
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Open floating diagnostics message"
        keymap("n", "<leader>e", vim.diagnostic.open_float, opts)

        opts.desc = "Show line diagnostics"
        keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

        opts.desc = "Show documentation"
        keymap("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "go to previous diagnostic message"
        keymap("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

        opts.desc = "go to next diagnostic message"
        keymap("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

        opts.desc = "open diagnostics list"
        keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

        opts.desc = "[r]e[s]tart [ls]p"
        keymap("n", "<leader>rsls", "<cmd>LspRestart<CR>", opts)
    end
})


local severity = vim.diagnostic.severity
vim.diagnostic.config({
    signs = {
        text = {
            [severity.ERROR] = " ",
            [severity.WARN] = " ",
            [severity.HINT] = "󰠠 ",
            [severity.INFO] = " ",
        }
    }
})
