local dash = require("utils.dashboard")

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        hide = {},
        header = dash.header,
        disable_move = true,
        center = dash.options,
        vertical_center = true,
      },
    })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
