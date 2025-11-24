return {
  "mason-org/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "vtsls", "vue_ls"
      },
      automatic_enable = true,
      automatic_installation = true,
    })
  end,
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {}
    },
    "neovim/nvim-lspconfig",
  }
}
