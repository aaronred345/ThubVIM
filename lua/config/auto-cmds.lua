vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.*",
  command = "mkview",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.*",
  command = "silent! loadview"
})

-- Session Manager and Splash Screen
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("telescope").load_extension("project")
  end
})
