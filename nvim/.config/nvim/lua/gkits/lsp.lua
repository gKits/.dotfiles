vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local function keymap(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = ev.buf, silent = true, desc = desc })
        end

        keymap("n", "<leader>ca", vim.lsp.buf.code_action, "Run [c]ode [a]ction")
        keymap("n", "gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
        keymap("n", "gD", vim.lsp.buf.declaration, "go to declaration")
        keymap("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", "[l]ist [d]efinitions")
        keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", "[l]ist [r]eferences")
        keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", "Show [d]ocument [s]ymbols")
        keymap("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", "[l]ist [i]mplementations")
        keymap("n", "<leader>rn", vim.lsp.buf.rename, "Smart [r]e[n]ame")
        keymap("n", "<leader>e", vim.diagnostic.open_float, "Open floating diagnostics message")
        keymap("n", "<leader>q", vim.diagnostic.setloclist, "Show line diagnostics")
        keymap("n", "K", vim.lsp.buf.hover, "Show documentation")
        keymap("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "go to previous diagnostic message")
        keymap("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "go to next diagnostic message")
        keymap("n", "<leader>q", vim.diagnostic.setloclist, "open diagnostics list")
        keymap("n", "<leader>rsls", "<cmd>LspRestart<CR>", "[r]e[s]tart [ls]p")
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
