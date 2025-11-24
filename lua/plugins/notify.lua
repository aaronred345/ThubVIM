return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 2500,
      merge_duplicates = true
    })
  end
}
