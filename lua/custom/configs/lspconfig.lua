local base = require("plugins.configs.lspconfig")
--local on_attach = require("plugins.configs.lspconfig").on_attach
--local capabilities = require("plugins.configs.lspconfig").capabilities

local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.clangd.setup{
  on_attach = function (client, bufnr)
    clinet.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)




  end,
  capabilities = capabilities,
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
--lspconfig.rust_analyzer.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--  filetypes = {"rust"},
--  root_dir = util.root_pattern("Cargo.toml"),
--  settings = {
--    ['rust_analyzer'] = {
--      cargo = {
--        allFeatures = true,
--      },
--    },
--  },
--})
