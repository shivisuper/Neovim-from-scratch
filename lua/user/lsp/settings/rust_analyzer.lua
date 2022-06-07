return {
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsFromCheck = true },
      procMacro = { enable = true },
      hoverActions = { references = true },
    },
  },
}
