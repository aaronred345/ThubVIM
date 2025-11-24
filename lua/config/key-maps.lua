require("config.whichkey-groups")


-------------------------------------------------------------------------------------------------
-- Normal Mode Mappings --

vim.keymap.set("n", "gd", function(buf) vim.lsp.buf.definition() end)

-- Close Vim, Buffers, Splits, etc
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Close NeoVim" })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Force CLose NeoVim" })
vim.keymap.set("n", "<A-q>", ":qa<CR>", { silent = true })
vim.keymap.set("n", "<A-Q>", ":qa!<CR>", { silent = true })

-- Save
vim.keymap.set("n", "<leader>s", ":w<CR>", { silent = true, desc = "Save buffer" })
vim.keymap.set("n", "<A-s>", ":w<CR>", { silent = true })

-- Lazy
vim.keymap.set("n", "<leader>L", ":Lazy<CR>", { silent = true, desc = "Open Lazy" })

-- New File
vim.keymap.set("n", "<leader>fn", function()
  vim.ui.input({ prompt = "New file name: " }, function(filename)
    if filename and filename ~= "" then
      vim.cmd("edit " .. filename)
    end
  end)
end, { noremap = true, silent = true, desc = "Create New File" })

-- Telescope
local telescope_builtins = require('telescope.builtin')
local telescope = require("telescope")
vim.keymap.set("n", "<leader>ff", telescope_builtins.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", telescope_builtins.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set("n", "<leader>fb", telescope_builtins.buffers, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<leader>fh", telescope_builtins.help_tags, { desc = "Telescope Help Tags" })
vim.keymap.set("n", "<leader>fr", telescope.extensions.recent_files.pick, { desc = "Telescope Recent Files" })

-- Telescope File Browser
vim.keymap.set("n", "<leader>b", ":Telescope file_browser<CR>", { silent = true, desc = "File Browser" })
vim.keymap.set("n", "<leader>B", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { silent = true, desc = "Open File Browser in this buffer's location" })

-- File Tree
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { silent = true, desc = "Focus File Tree" })
vim.keymap.set("n", "<leader>o", ":Neotree toggle<CR>", { silent = true, desc = "Toggle File Tree" })
vim.keymap.set("n", "<leader>O", ":Neotree buffers<CR>", { silent = true, desc = "Show Open Buffers" })

-- LSP
local cmp = require("blink.cmp")
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename token" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol earch" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover Diagnostics" })
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.signature_help, { desc = "Show Documentation" })
vim.keymap.set("n", "K", require("pretty_hover").hover, { noremap = true })

-- Session Manager
vim.keymap.set("n", "<leader>Sl", ":SessionManager load_last_session<CR>", { silent = true, desc = "Load last session" })
vim.keymap.set("n", "<leader>Sd", ":SessionManager load_current_dir_session<CR>", {
  silent = true,
  desc =
  "Load current directory session"
})
vim.keymap.set("n", "<leader>Ss", ":SessionManager load_session<CR>", { silent = true, desc = "Select session" })

-- Project Manager
vim.keymap.set("n", "<C-p>", function()
  require("session_manager").save_current_session()
  require("telescope").extensions.project.project()
end, { silent = true })

-- Smart Splits
vim.keymap.set("n", "<leader>x", ":close<CR>", { silent = true, desc = "Close Split" })
vim.keymap.set("n", "<A-x>", ":close<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":BufferClose<CR>", { silent = true, desc = "Close Buffer" })
vim.keymap.set("n", "<A-w>", ":BufferClose<CR>", { silent = true })
-- resizing splits
vim.keymap.set({ "t", "n" }, '<A-h>', require('smart-splits').resize_left)
vim.keymap.set({ "t", "n" }, '<A-j>', require('smart-splits').resize_down)
vim.keymap.set({ "t", "n" }, '<A-k>', require('smart-splits').resize_up)
vim.keymap.set({ "t", "n" }, '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set({ "t", "n" }, '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set({ "t", "n" }, '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set({ "t", "n" }, '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set({ "t", "n" }, '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set({ "t", "n" }, '<C-\\>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- Creating Splits
vim.keymap.set("n", "|", ":vs<CR>", { silent = true })
vim.keymap.set("n", "\\", ":sp<CR>", { silent = true })

-- ToggleTerm
-- Toggle floating terms with F keys
vim.keymap.set({ "t", "n" }, "<F1>", function() _TOGGLE_FLOATING_TERM("F1") end, { silent = true, noremap = true })
vim.keymap.set({ "t", "n" }, "<F2>", function() _TOGGLE_FLOATING_TERM("F2") end, { silent = true, noremap = true })
vim.keymap.set({ "t", "n" }, "<F3>", function() _TOGGLE_FLOATING_TERM("F3") end, { silent = true, noremap = true })
vim.keymap.set({ "t", "n" }, "<F4>", function() _TOGGLE_FLOATING_TERM("F4") end, { silent = true, noremap = true })
vim.keymap.set({ "t", "n" }, "<F5>", function() _TOGGLE_FLOATING_TERM("F5") end, { silent = true, noremap = true })
vim.keymap.set({ "t", "n" }, "<F6>", function() _TOGGLE_FLOATING_TERM("F6") end, { silent = true, noremap = true })
-- Toggle LazyGit and "bun run dev" with F key
vim.keymap.set({ "t", "n" }, "<F7>", function() _LAZYGIT_TOGGLE() end)
vim.keymap.set({ "t", "n" }, "<F8>", function() _BUN_TOGGLE() end)
-- Toggle Horizontal and Vertical terms (They share terminals)
vim.keymap.set({ "t", "n" }, "<S-F1>", function() _TOGGLE_VERTICAL_TERM("F1") end)
vim.keymap.set({ "t", "n" }, "<S-F2>", function() _TOGGLE_VERTICAL_TERM("F2") end)
vim.keymap.set({ "t", "n" }, "<S-F3>", function() _TOGGLE_VERTICAL_TERM("F3") end)
vim.keymap.set({ "t", "n" }, "<S-F4>", function() _TOGGLE_VERTICAL_TERM("F4") end)
vim.keymap.set({ "t", "n" }, "<S-F5>", function() _TOGGLE_VERTICAL_TERM("F5") end)
vim.keymap.set({ "t", "n" }, "<S-F6>", function() _TOGGLE_VERTICAL_TERM("F6") end)
--
vim.keymap.set({ "t", "n" }, "<C-F1>", function() _TOGGLE_HORIZONTAL_TERM("F1") end)
vim.keymap.set({ "t", "n" }, "<C-F2>", function() _TOGGLE_HORIZONTAL_TERM("F2") end)
vim.keymap.set({ "t", "n" }, "<C-F3>", function() _TOGGLE_HORIZONTAL_TERM("F3") end)
vim.keymap.set({ "t", "n" }, "<C-F4>", function() _TOGGLE_HORIZONTAL_TERM("F4") end)
vim.keymap.set({ "t", "n" }, "<C-F5>", function() _TOGGLE_HORIZONTAL_TERM("F5") end)
vim.keymap.set({ "t", "n" }, "<C-F6>", function() _TOGGLE_HORIZONTAL_TERM("F6") end)

-- BarBar Tabline
vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })
vim.keymap.set("n", "<A-0>", ":BufferLast<CR>", { silent = true })
vim.keymap.set("n", "<leader>tp", ":BufferPick<CR>", { desc = "Pick Buffer", silent = true })
vim.keymap.set("n", "<leader>td", ":BufferPickDelete<CR>", { desc = "Delete Buffer", silent = true })
vim.keymap.set("n", "<leader>tc", ":BufferCloseAllButCurrentOrPinned<CR>",
  { desc = "Close all other buffers", silent = true })
vim.keymap.set("n", "<leader>tC", ":BufferCloseAllButCurrent<CR>",
  { desc = "Close all other buffers (Including pinned)", silent = true })
vim.keymap.set("n", "<leader>tp", ":BufferPin<CR>", { desc = "Pin Current Buffer", silent = true })
vim.keymap.set("n", "<leader>t<", ":BufferPrevious<CR>", { desc = "Previous Buffer", silent = true })
vim.keymap.set("n", "<leader>t>", ":BufferNext<CR>", { desc = "Next Buffer", silent = true })


-------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------
-- Insert Mode Mappings --

-- Save
vim.keymap.set("i", "<A-s>", "<Esc>:w<CR>")

-- Exit nvim
vim.keymap.set("i", "<A-q>", ":qa<CR>", { silent = true })
vim.keymap.set("i", "<A-Q>", ":qa!<CR>", { silent = true })

-- Quick exit from insert
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")

-- LSP
vim.keymap.set("i", "<C-l>", cmp.show, { silent = true, noremap = true })
vim.keymap.set("i", "<C-j>", cmp.select_next, { silent = true, noremap = true })
vim.keymap.set("i", "<C-k>", cmp.select_prev, { silent = true, noremap = true })
vim.keymap.set("i", "<S-Tab>", cmp.accept, { silent = true, noremap = true })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { silent = true, noremap = true })
