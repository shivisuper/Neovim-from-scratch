local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local servers = {
  "clangd",
  "sumneko_lua",
  --"jdtls",
  "clojure_lsp",
  "jsonls",
  "yamlls",
  "rust_analyzer",
  "taplo",
}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local _, lspconfig = pcall(require, "lspconfig")

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if server == "rust_analyzer" then

    opts = {
      capabilities = require("user.lsp.handlers").capabilities,
      on_attach = require("user.lsp.handlers").on_attach,
      settings = require("user.lsp.settings.rust_analyzer").settings,
      cmd = {
        "rustup", "run", "stable", "rust-analyzer",
      }
    }

    --require("rust-tools").setup {
    --  tools = {
    --    on_initialized = function()
    --      vim.cmd [[ autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh() ]]
    --    end,
    --  },
    --  server = {
    --    on_attach = require("user.lsp.handlers").on_attach,
    --    capabilities = require("user.lsp.handlers").capabilities,
    --    settings = require("user.lsp.settings.rust_analyzer").settings,
    --  },
    --}

    --goto continue
  end

  lspconfig[server].setup(opts)
  --::continue::
end
