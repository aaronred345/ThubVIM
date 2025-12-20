return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "%.env",
          "package-lock.json",
          "yarn.lock",
          "target/**"
        }
      },
      extensions = {
        recent_files = {
          show_current_files = true
        }
      }
    })

    telescope.load_extension("recent_files")
  end
}
