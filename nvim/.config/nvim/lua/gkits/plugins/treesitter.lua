return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ensure_installed = {
                "go",
                "lua",
                "markdown",
                "markdown_inline",
                "dockerfile",
                "gitignore",
                "vim",
                "bash",
                "yaml",
                "json",
            }

            if ensure_installed and #ensure_installed > 0 then
                require("nvim-treesitter").install(ensure_installed)
                for _, parser in ipairs(ensure_installed) do
                    local filetypes = parser
                    vim.treesitter.language.register(parser, filetypes)

                    vim.api.nvim_create_autocmd({ "FileType" }, {
                        pattern = filetypes,
                        callback = function(event)
                            vim.treesitter.start(event.buf, parser)
                        end,
                    })
                end
            end

            vim.api.nvim_create_autocmd({ "BufRead" }, {
                callback = function(event)
                    local bufnr = event.buf
                    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

                    if filetype == "" then
                        return
                    end

                    for _, filetypes in pairs(ensure_installed) do
                        local ft_table = type(filetypes) == "table" and filetypes or { filetypes }
                        if vim.tbl_contains(ft_table, filetype) then
                            return -- Already handled above
                        end
                    end

                    local parser_name = vim.treesitter.language.get_lang(filetype)
                    if not parser_name then
                        return
                    end
                    local parser_configs = require("nvim-treesitter.parsers")
                    if not parser_configs[parser_name] then
                        return
                    end

                    local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if not parser_installed then
                        require("nvim-treesitter").install({ parser_name }):wait(30000)
                    end

                    parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if parser_installed then
                        vim.treesitter.start(bufnr, parser_name)
                    end
                end,
            })
        end,
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     event = "BufRead",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         event = "BufRead",
    --     },
    --     opts = {
    --         multiwindow = true,
    --     },
    -- },
    {
        {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                branch = "main",
                config = function()
                    require("nvim-treesitter-textobjects").setup({
                        select = {
                            enable = true,
                            lookahead = true,

                            keymaps = {
                                ["aa"] = "@parameter.outer",
                                ["ia"] = "@parameter.inner",
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner",
                            },
                            move = {
                                enable = true,
                                set_jumps = true, -- whether to set jumps in the jumplist
                                goto_next_start = {
                                    ["]m"] = "@function.outer",
                                    ["]]"] = "@class.outer",
                                },
                                goto_next_end = {
                                    ["]M"] = "@function.outer",
                                    ["]["] = "@class.outer",
                                },
                                goto_previous_start = {
                                    ["[m"] = "@function.outer",
                                    ["[["] = "@class.outer",
                                },
                                goto_previous_end = {
                                    ["[M"] = "@function.outer",
                                    ["[]"] = "@class.outer",
                                },
                            },
                            swap = {
                                enable = true,
                                swap_next = {
                                    ["<leader>a"] = "@parameter.inner",
                                },
                                swap_previous = {
                                    ["<leader>A"] = "@parameter.inner",
                                },
                            },
                        },
                    })
                end,
            },
            { "windwp/nvim-ts-autotag" },
        },
    },
}
