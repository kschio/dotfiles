local configuration = require('lspconfig')
local common = require('ksch.lsp.servers.common')

configuration.eslint.setup {
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"};
  capabilities = common.capabilities;
  root_dir = configuration.util.root_pattern('.git');
}

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd('EslintFixAll')
  end,
  pattern = {"*.js", "*.jsx", "*.ts", "*.tsx"}
})
