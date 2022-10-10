local M = {}

-- Zen
M.zen = function()
  require("zen-mode").setup {
    window = {
      backdrop = 0.95,
      width = 100,
      height = 0.8,
      options = { signcolumn = "no", number = false, cursorline = true },
    },
    plugins = {
      options = { enabled = true, ruler = false, showcmd = false },
      twilight = { enabled = true },
      gitsigns = { enabled = true },
      tmux = { enabled = true },
    },
    on_open = function(_)
      vim.cmd ":TwilightEnable"
    end,
  }
end

-- Twilight
M.twilight = function()
  require("twilight").setup {
    {
      dimming = { alpha = 0.25, color = { "Normal", "#ffffff" }, inactive = false },
      context = 20,
      treesitter = true,
      expand = { "function", "method", "table", "if_statement" },
    },
  }
end

return M
