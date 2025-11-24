return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    vim.g.smart_splits_multiplexer_integration = 'tmux'
    require("smart-splits").setup({})
  end
}
