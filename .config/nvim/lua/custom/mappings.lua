---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd> :w <CR>", "save buffer" },
    ["<leader>W"] = { "<cmd> :w! <CR>", "force save buffer" },
    ["<leader>q"] = { "<cmd> :q <CR>", "quit" },
    ["<leader>Q"] = { "<cmd> :q! <CR>", "force quit" }
  },

  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
