-- configure tokyonight
local settings = {
  style = "moon",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    functions = { bold = true },
    variables = {},
    keywords = { italic = true }
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  on_colors = function (colors)
    colors.hint = colors.blue2
    colors.error = "#ff0000"
  end,
}


local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end


tokyonight.setup(settings)

-- enable tokyonight
vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
