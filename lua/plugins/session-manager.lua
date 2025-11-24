return {
  "Shatur/neovim-session-manager",
  event = "VimEnter",
  config = function()
    local config = require("session_manager.config")
    require("session_manager").setup({
      autoload_mode = config.AutoloadMode.Disabled
    })
  end
}
