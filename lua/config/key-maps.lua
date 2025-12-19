require("config.whichkey-groups")

local mapKeys = vim.keymap.set

-------------------------------------------------------------------------------------------------
-- Normal Mode Mappings --

mapKeys("n", "gd", function(buf) vim.lsp.buf.definition() end)

-- Close Vim, Buffers, Splits, etc
mapKeys("n", "<leader>q", ":qa<CR>", { desc = "Close NeoVim" })
mapKeys("n", "<leader>Q", ":qa!<CR>", { desc = "Force CLose NeoVim" })
mapKeys("n", "<A-q>", ":qa<CR>", { silent = true })
mapKeys("n", "<A-Q>", ":qa!<CR>", { silent = true })

-- Save
mapKeys("n", "<leader>s", ":w<CR>", { silent = true, desc = "Save buffer" })
mapKeys("n", "<A-s>", ":w<CR>", { silent = true })

-- Lazy
mapKeys("n", "<leader>L", ":Lazy<CR>", { silent = true, desc = "Open Lazy" })

-- New File
mapKeys("n", "<leader>fn", function()
  vim.ui.input({ prompt = "New file name: " }, function(filename)
    if filename and filename ~= "" then
      vim.cmd("edit " .. filename)
    end
  end)
end, { noremap = true, silent = true, desc = "Create New File" })

-- Telescope
local telescope_builtins = require('telescope.builtin')
local telescope = require("telescope")
mapKeys("n", "<leader>ff", telescope_builtins.find_files, { desc = "Telescope Find Files" })
mapKeys("n", "<leader>fg", telescope_builtins.live_grep, { desc = "Telescope Live Grep" })
mapKeys("n", "<leader>fb", telescope_builtins.buffers, { desc = "Telescope Buffers" })
mapKeys("n", "<leader>fh", telescope_builtins.help_tags, { desc = "Telescope Help Tags" })
mapKeys("n", "<leader>fr", telescope.extensions.recent_files.pick, { desc = "Telescope Recent Files" })

-- Telescope File Browser
mapKeys("n", "<leader>b", ":Telescope file_browser<CR>", { silent = true, desc = "File Browser" })
mapKeys("n", "<leader>B", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { silent = true, desc = "Open File Browser in this buffer's location" })

-- File Tree
mapKeys("n", "<leader>e", ":Neotree focus<CR>", { silent = true, desc = "Focus File Tree" })
mapKeys("n", "<leader>o", ":Neotree toggle<CR>", { silent = true, desc = "Toggle File Tree" })
mapKeys("n", "<leader>O", ":Neotree buffers<CR>", { silent = true, desc = "Show Open Buffers" })

-- LSP
local cmp = require("blink.cmp")
mapKeys("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename token" })
mapKeys("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
mapKeys("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
mapKeys("n", "<leader>lw", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol earch" })
mapKeys("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover Diagnostics" })
mapKeys("n", "<leader>lD", vim.lsp.buf.signature_help, { desc = "Show Documentation" })
mapKeys("n", "K", require("pretty_hover").hover, { noremap = true })

-- Session Manager
mapKeys("n", "<leader>Sl", ":SessionManager load_last_session<CR>", { silent = true, desc = "Load last session" })
mapKeys("n", "<leader>Sd", ":SessionManager load_current_dir_session<CR>", {
  silent = true,
  desc =
  "Load current directory session"
})
mapKeys("n", "<leader>Ss", ":SessionManager load_session<CR>", { silent = true, desc = "Select session" })

-- Project Manager
mapKeys("n", "<C-p>", function()
  require("session_manager").save_current_session()
  require("telescope").extensions.project.project()
end, { silent = true })

-- Smart Splits
mapKeys("n", "<leader>x", ":close<CR>", { silent = true, desc = "Close Split" })
mapKeys("n", "<A-x>", ":close<CR>", { silent = true })
mapKeys("n", "<leader>w", ":BufferClose<CR>", { silent = true, desc = "Close Buffer" })
mapKeys("n", "<A-w>", ":BufferClose<CR>", { silent = true })
-- resizing splits
mapKeys({ "t", "n" }, '<A-h>', require('smart-splits').resize_left)
mapKeys({ "t", "n" }, '<A-j>', require('smart-splits').resize_down)
mapKeys({ "t", "n" }, '<A-k>', require('smart-splits').resize_up)
mapKeys({ "t", "n" }, '<A-l>', require('smart-splits').resize_right)
-- moving between splits
mapKeys({ "t", "n" }, '<C-h>', require('smart-splits').move_cursor_left)
mapKeys({ "t", "n" }, '<C-j>', require('smart-splits').move_cursor_down)
mapKeys({ "t", "n" }, '<C-k>', require('smart-splits').move_cursor_up)
mapKeys({ "t", "n" }, '<C-l>', require('smart-splits').move_cursor_right)
mapKeys({ "t", "n" }, '<C-\\>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
mapKeys('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
mapKeys('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
mapKeys('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
mapKeys('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- Creating Splits
mapKeys("n", "|", ":vs<CR>", { silent = true })
mapKeys("n", "\\", ":sp<CR>", { silent = true })

-- ToggleTerm
-- Toggle floating terms with F keys
mapKeys({ "t", "n" }, "<F1>", function() _TOGGLE_FLOATING_TERM("F1") end, { silent = true, noremap = true })
mapKeys({ "t", "n" }, "<F2>", function() _TOGGLE_FLOATING_TERM("F2") end, { silent = true, noremap = true })
mapKeys({ "t", "n" }, "<F3>", function() _TOGGLE_FLOATING_TERM("F3") end, { silent = true, noremap = true })
mapKeys({ "t", "n" }, "<F4>", function() _TOGGLE_FLOATING_TERM("F4") end, { silent = true, noremap = true })
mapKeys({ "t", "n" }, "<F5>", function() _TOGGLE_FLOATING_TERM("F5") end, { silent = true, noremap = true })
mapKeys({ "t", "n" }, "<F6>", function() _TOGGLE_FLOATING_TERM("F6") end, { silent = true, noremap = true })
-- Toggle LazyGit and "bun run dev" with F key
mapKeys({ "t", "n" }, "<F7>", function() _LAZYGIT_TOGGLE() end)
mapKeys({ "t", "n" }, "<F8>", function() _BUN_TOGGLE() end)
-- Toggle Horizontal and Vertical terms (They share terminals)
mapKeys({ "t", "n" }, "<S-F1>", function() _TOGGLE_VERTICAL_TERM("F1") end)
mapKeys({ "t", "n" }, "<S-F2>", function() _TOGGLE_VERTICAL_TERM("F2") end)
mapKeys({ "t", "n" }, "<S-F3>", function() _TOGGLE_VERTICAL_TERM("F3") end)
mapKeys({ "t", "n" }, "<S-F4>", function() _TOGGLE_VERTICAL_TERM("F4") end)
mapKeys({ "t", "n" }, "<S-F5>", function() _TOGGLE_VERTICAL_TERM("F5") end)
mapKeys({ "t", "n" }, "<S-F6>", function() _TOGGLE_VERTICAL_TERM("F6") end)
--
mapKeys({ "t", "n" }, "<C-F1>", function() _TOGGLE_HORIZONTAL_TERM("F1") end)
mapKeys({ "t", "n" }, "<C-F2>", function() _TOGGLE_HORIZONTAL_TERM("F2") end)
mapKeys({ "t", "n" }, "<C-F3>", function() _TOGGLE_HORIZONTAL_TERM("F3") end)
mapKeys({ "t", "n" }, "<C-F4>", function() _TOGGLE_HORIZONTAL_TERM("F4") end)
mapKeys({ "t", "n" }, "<C-F5>", function() _TOGGLE_HORIZONTAL_TERM("F5") end)
mapKeys({ "t", "n" }, "<C-F6>", function() _TOGGLE_HORIZONTAL_TERM("F6") end)

-- BarBar Tabline
mapKeys("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
mapKeys("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
mapKeys("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
mapKeys("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
mapKeys("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
mapKeys("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
mapKeys("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
mapKeys("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
mapKeys("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })
mapKeys("n", "<A-0>", ":BufferLast<CR>", { silent = true })
mapKeys("n", "<leader>tp", ":BufferPick<CR>", { desc = "Pick Buffer", silent = true })
mapKeys("n", "<leader>td", ":BufferPickDelete<CR>", { desc = "Delete Buffer", silent = true })
mapKeys("n", "<leader>tc", ":BufferCloseAllButCurrentOrPinned<CR>",
  { desc = "Close all other buffers", silent = true })
mapKeys("n", "<leader>tC", ":BufferCloseAllButCurrent<CR>",
  { desc = "Close all other buffers (Including pinned)", silent = true })
mapKeys("n", "<leader>tp", ":BufferPin<CR>", { desc = "Pin Current Buffer", silent = true })
mapKeys("n", "<leader>t<", ":BufferPrevious<CR>", { desc = "Previous Buffer", silent = true })
mapKeys("n", "<leader>t>", ":BufferNext<CR>", { desc = "Next Buffer", silent = true })


-------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------
-- Insert Mode Mappings --

-- Save
mapKeys("i", "<A-s>", "<Esc>:w<CR>")

-- Navigation
mapKeys("i", "<A-h>", "<Esc>i")
mapKeys("i", "<A-l>", "<Esc>la")
mapKeys("i", "<A-k>", "<Esc>ka")
mapKeys("i", "<A-j>", "<Esc>ja")
mapKeys("i", "<A-g>", "<Esc>gga")
mapKeys("i", "<A-G>", "<Esc>Ga")
mapKeys("i", "<A-u>", "<Esc><C-u>a")
mapKeys("i", "<A-d>", "<Esc><C-d>a")

-- Exit nvim
mapKeys("i", "<A-q>", ":qa<CR>", { silent = true })
mapKeys("i", "<A-Q>", ":qa!<CR>", { silent = true })

-- Quick exit from insert
mapKeys("i", "jj", "<Esc>")
mapKeys("i", "kk", "<Esc>")

-- LSP
mapKeys("i", "<C-l>", cmp.show, { silent = true, noremap = true })
mapKeys("i", "<C-j>", cmp.select_next, { silent = true, noremap = true })
mapKeys("i", "<C-k>", cmp.select_prev, { silent = true, noremap = true })
mapKeys("i", "<S-Tab>", cmp.accept, { silent = true, noremap = true })
mapKeys("i", "<C-h>", vim.lsp.buf.signature_help, { silent = true, noremap = true })
