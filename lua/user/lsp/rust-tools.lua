local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
  return
end

local opts = {
  tools = {
    inlay_hints = {
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
    },
  },
}

rust_tools.setup(opts)
