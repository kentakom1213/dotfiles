-- 基本設定
vim.opt.number = true        -- 行番号を表示
-- vim.opt.relativenumber = true -- 相対行番号を表示
vim.opt.tabstop = 4          -- タブ幅を4に設定
vim.opt.shiftwidth = 4       -- 自動インデント幅
vim.opt.expandtab = true     -- タブをスペースに変換

-- キーマッピング
vim.keymap.set('n', '<Space>', ':', { noremap = true, silent = true })

-- プラグイン設定（例: packer.nvim使用時）
require('packer').startup(function()
    use 'wbthomason/packer.nvim'   -- パッケージマネージャ
    use 'nvim-treesitter/nvim-treesitter' -- 高機能シンタックス
    use 'neovim/nvim-lspconfig'               -- LSPサポート
    use 'hrsh7th/nvim-cmp'                    -- 自動補完プラグイン
    use 'hrsh7th/cmp-nvim-lsp'                -- LSP用補完ソース
    use 'simrat39/rust-tools.nvim'            -- Rust専用ツール
end)

-- Rustの設定
-- LSPサーバーを設定
local nvim_lsp = require('lspconfig')
local rust_tools = require('rust-tools')

-- rust-tools.nvimを使ったrust-analyzerの設定
rust_tools.setup({
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

-- 補完の設定
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- スニペット設定（例: vsnip使用時）
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    },
})

