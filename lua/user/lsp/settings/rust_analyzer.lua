return {
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsFromCheck = true },
      procMacro = { enable = true },
      hoverActions = { references = true },
      lens = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
