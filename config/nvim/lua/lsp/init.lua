local servers = {
    require'lspconfig'.gopls.setup,
    require'lspconfig'.rust_analyzer.setup,
    require'lspconfig'.pyls.setup,
    require'lspconfig'.tsserver.setup,
    require'lspconfig'.cssls.setup,
    require'lspconfig'.bashls.setup,
    require'lspconfig'.vimls.setup,
    require'lspconfig'.jsonls.setup,
    require'lspconfig'.dockerls.setup
}

for _, lsp in ipairs(servers) do
    lsp{ on_attach=require'completion'.on_attach }
end

local sumneko_binary='/usr/bin/lua-language-server' 
require'lspconfig'.sumneko_lua.setup {
    on_attach = complete,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
    on_attach = complete,
    capabilities = capabilities,
}
