return {
  "stevearc/conform.nvim",
  event = "InsertEnter",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        pcss = { "prettier" },
        html = { "prettier" },
      },
      format_after_save = {
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      }
    })
  end
}
