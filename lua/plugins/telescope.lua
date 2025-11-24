return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
  },
  config = function()
    local telescope = require("telescope")
    -- require("telescope").load_extension("project")
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
        project = {
          base_dirs = {
            { "~/Projects", max_depth=4 }
          },
          on_project_selected = function(prompt)
            local project_actions = require("telescope._extensions.project.actions")
            local session_manager = require("session_manager")
            project_actions.change_working_directory(prompt, false)
            session_manager.load_current_dir_session(true)
          end,
        },
        recent_files = {
          show_current_files = true
        }
      }
    })

    telescope.load_extension("recent_files")
  end
}
