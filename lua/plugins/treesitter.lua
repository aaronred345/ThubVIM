---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true
      },
      auto_install = true,
      ensure_installed = { "c", "lua", "html", "vue", "javascript", "python", "typescript" },
    })
  end
}
