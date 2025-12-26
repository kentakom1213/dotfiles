--[[

lazy.nvim bootstrap
===================
- Neovimを起動すると、まずlazy.nvim自体が自動でインストールされます。
- その後、以下のプラグインリストに従って、各プラグインがインストール・設定されます。
- プラグインは ~/.local/share/nvim/lazy/ にインストールされます。

]]

-- lazy.nvimのパスを設定
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- lazy.nvimがなければgit cloneしてインストール
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- lazy.nvimの最新安定版
    lazypath,
  })
end
-- 'lazy.nvim'をruntimepathに追加
vim.opt.rtp:prepend(lazypath)

-- 基本設定（変更なし）
vim.opt.number = true         -- 行番号を表示
vim.opt.tabstop = 4           -- タブ幅を4に設定
vim.opt.shiftwidth = 4        -- 自動インデント幅
vim.opt.expandtab = true      -- タブをスペースに変換
vim.opt.clipboard = "unnamedplus" -- クリップボード連携

-- キーマッピング（変更なし）
vim.keymap.set('n', '<Space>', ':', { noremap = true, silent = true })


-- lazy.nvimのセットアップ
require("lazy").setup({
    -- カラースキーム: Gruvbox
    {
        "gruvbox-community/gruvbox",
        lazy = false, -- 起動時に必ず読み込む
        priority = 1000, -- 他のプラグインより先に読み込む
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "gruvbox"
        end,
    },

    -- シンタックスハイライト: nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- インストール・更新時にパーサーを自動更新
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "python" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- LSP設定: nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- 補完ソースに依存
        config = function()
            local lspconfig = require('lspconfig')
            local cmp_nvim_lsp = require('cmp_nvim_lsp')

            -- LSPの共通on_attach関数
            local on_attach = function(client, bufnr)
                local bufopts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            end

            -- Python LSP (pyright) の設定
            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = cmp_nvim_lsp.default_capabilities(),
            })
        end,
    },

    -- Rust用ツール: rust-tools.nvim
    {
        "simrat39/rust-tools.nvim",
        ft = "rust", -- Rustファイルを開いた時に読み込む
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("rust-tools").setup({
                server = {
                    on_attach = function(client, bufnr)
                        -- キーマッピングの設定（例）
                        local bufopts = { noremap=true, silent=true, buffer=bufnr }
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                command = "clippy",
                            },
                        },
                    },
                },
            })
        end,
    },

    -- 自動補完: nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Insertモードに入った時に読み込む
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSPソース
            "hrsh7th/cmp-vsnip",    -- スニペットソース
            "hrsh7th/vim-vsnip",    -- スニペットエンジン
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-.>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                },
            })
        end,
    },

    -- カッコの自動補完: nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true,
                disable_filetype = { "TelescopePrompt" },
            })
        end,
    },

    -- ファイルツリー: nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン表示に必要
        cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" }, -- コマンド実行時に読み込む
        config = function()
            require("nvim-tree").setup({})
            -- ファイルツリーを開くキーマッピング
            vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        end,
    },
})
