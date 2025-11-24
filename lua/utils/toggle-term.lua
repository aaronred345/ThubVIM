local floating_terminals = {}
local terminals = {}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  name = "lazygit"
})
local bun = nil

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _BUN_TOGGLE()
  if not bun then
    if vim.fn.isdirectory("node_modules") ~= 0 then
      bun = Terminal:new({
        cmd = "bun run dev",
        hidden = true,
        direction = "float",
        name = "bun-dev-terminal",
        close_on_exit = true,
      })
      bun:toggle()
    else
      require("notify")(
        "No node_modules directory\nPlease check one of these items:\n\t- You are in a bun project directory\n\t- You have ran the project once already",
        "error")
    end
  else
    bun:toggle()
  end
end

--- @param name string
function _TOGGLE_FLOATING_TERM(name)
  if not floating_terminals[name] then
    floating_terminals[name] = Terminal:new({
      direction = "float",
      name = name,
      close_on_exit = true,
    })
    floating_terminals[name]:toggle()
  else
    floating_terminals[name]:toggle()
  end
end

--- @param name string
function _TOGGLE_VERTICAL_TERM(name)
  if not terminals[name] then
    terminals[name] = Terminal:new({
      direction = "vertical",
      name = name,
      close_on_exit = true,
    })
    terminals[name]:toggle()
  else
    terminals[name]["direction"] = "vertical"
    terminals[name]:toggle()
  end
end

--- @param name string
function _TOGGLE_HORIZONTAL_TERM(name)
  if not terminals[name] then
    terminals[name] = Terminal:new({
      direction = "horizontal",
      name = name,
      close_on_exit = true,
    })
    terminals[name]:toggle()
  else
    terminals[name]["direction"] = "horizontal"
    terminals[name]:toggle()
  end
end
