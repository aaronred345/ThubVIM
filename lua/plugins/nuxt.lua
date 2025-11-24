return {
  "aaronred345/nuxt-dx-tools.nvim",
  -- branch = "claude/simplify-lsp-definition-01JRzURGBbBvfCdYiDtmskip",
  dependecies = { "neovim/nvim-lspconfig" },
  ft = { "vue", "javascript", "typescript" },
  build = "cd lsp-server && bun install",
  config = function()
    require("nuxt-dx-tools").setup({
      autostart = true,

      api_functions = { "$fetch", "useFetch", "$fetch.raw" },
      hover_enabled = true,
    })
  end
}
