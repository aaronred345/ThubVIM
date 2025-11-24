return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      auto_integrations = true,
      transparent_background = true,
      integrations = {
        neotree = true,
        treesitter_context = true,
        nvim_surround = true,
        barbar = true,
      }
    })
  end
}
