return {
  'romgrk/barbar.nvim',
  event = "BufEnter",
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup({
      animation = false,
      sidebar_filetypes = {
        ["neo-tree"] = true
      },
      icons = {
        preset = "default",
        current = { buffer_index = true },
        inactive = { button = '×', buffer_index = true },
        separator_at_end = false,
      },
    })
  end
}
