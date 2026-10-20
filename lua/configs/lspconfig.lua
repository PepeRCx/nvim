require("nvchad.configs.lspconfig").defaults()

local on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end

local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "vtsls", "gopls", "pyright", "ruff" }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
})

vim.lsp.config("ruff", {
  on_attach = function(client, bufnr)
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
    on_attach(client, bufnr)
  end,
})

vim.lsp.enable(servers)
