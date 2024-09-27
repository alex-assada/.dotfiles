-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- emmet
lspconfig.emmet_language_server.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- solargraph
lspconfig.solargraph.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 100,
  },
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      folding = true,
      symbols = true,
      -- inlayHints = {
      --   enabled = true, -- Enable inlay hints
      --   parameterNames = true,
      --   variableTypes = true,
      --   returnTypes = true,
      -- },
    },
  },
}

-- cssls
lspconfig.cssls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- jdtls
lspconfig.jdtls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    java = {
      inlayHints = { enabled = "all" },
    },
  },

-- markdown
lspconfig.markdown_oxide.setup{},

}

