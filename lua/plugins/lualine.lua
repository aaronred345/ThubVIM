return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "catppuccin",
      ignore_focus = {
        "neo-tree"
      }
    },
    sections = {
      lualine_c = { { "filename", path = 1 } },
      lualine_x = {
        {
          require("noice").api.status.command.get_hl,
          cond = require("noice").api.status.command.has,
          color = { fg = "#a6e3a1" }
        },
        {
          require("noice").api.status.mode.get_hl,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#a6e3a1" },
        },
        "os.date('%I:%M %p')", "filetype" }
    }
  }
}
