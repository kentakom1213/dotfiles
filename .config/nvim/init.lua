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
    use 'wbthomason/packer.nvim'              -- パッケージマネージャ
    use 'nvim-treesitter/nvim-treesitter'     -- 高機能シンタックス
    use 'neovim/nvim-lspconfig'               -- LSPサポート
    use 'hrsh7th/nvim-cmp'                    -- 自動補完プラグイン
    use 'hrsh7th/cmp-nvim-lsp'                -- LSP用補完ソース
    use 'simrat39/rust-tools.nvim'            -- Rust専用ツール
    use 'gruvbox-community/gruvbox'           -- Gruvboxカラースキーム
    use 'hrsh7th/vim-vsnip'                   -- vsnip本体
    use 'hrsh7th/cmp-vsnip'                   -- cmp用vsnipソース
    use 'windwp/nvim-autopairs'               -- カッコ自動補完プラグイン
end)

-- Gruvboxのカラースキームを適用
vim.o.background = "dark"   -- 背景をダークテーマに設定（lightも可能）
vim.cmd[[colorscheme gruvbox]]

----- Rust LSP
-- LSPサーバーを設定
local nvim_lsp = require('lspconfig')

-- rust-tools.nvimを使ったrust-analyzerの設定
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

----- Python LSP
nvim_lsp.pyright.setup({
    on_attach = function(_, bufnr)
        -- LSPの基本的なキーマッピングを設定
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

----- AutoPairsの設定
require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },
})

----- 補完の設定
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- スニペット設定（例: vsnip使用時）
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),  -- ドキュメントの上スクロール
        ['<C-f>'] = cmp.mapping.scroll_docs(4),   -- ドキュメントの下スクロール
        ['<C-.>'] = cmp.mapping.complete(),       -- 補完をCtrl+.で呼び出し
        ['<Tab>'] = cmp.mapping.select_next_item(), -- 次の候補
        ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- 前の候補
        ['<CR>'] = cmp.mapping.confirm({
            select = true,                          -- 候補を選択した状態でEnterを押す
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    },
})

