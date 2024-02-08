local Keys = require('which-key.keys')
local Util = require('which-key.util')
local Logger = require('which-key.logger')

---@class WhichKey
local M = {}

local loaded = false -- once we loaded everything
local scheduled = false
local load_start = nil

local function schedule_load()
  if scheduled then
    return
  end
  scheduled = true
  if vim.v.vim_did_enter == 0 then
    vim.cmd([[au VimEnter * ++once lua require("which-key").load()]])
  else
    M.load()
  end
end

---@param options? Options
function M.setup(options)
  load_start = vim.fn.reltime()
  require('which-key.config').setup(options)
  vim.api.nvim_create_augroup('WhichKey', { clear = true })
  schedule_load()
end

function M.start(keys, opts)
  opts = opts or {}
  if type(opts) == 'string' then
    opts = { mode = opts }
  end

  keys = keys or ''
  -- format last key
  opts.mode = opts.mode or Util.get_mode()
  opts._start_type = opts._start_type and opts._start_type or 'key:' .. keys .. ':' .. opts.mode
  opts._start_time = vim.fn.reltime()

  local buf = vim.api.nvim_get_current_buf()
  -- make sure the trees exist for update
  Keys.get_tree(opts.mode)
  Keys.get_tree(opts.mode, buf)
  -- update only trees related to buf
  -- Keys.update(buf)
  Keys.update()
  -- trigger which key
  -- show, view.open, view.on_keys
  -- (already open) char, on_keys
  require('which-key.view').start(keys, opts)
end

function M.start_command(keys, mode)
  keys = keys or ''
  keys = (keys == '""' or keys == "''") and '' or keys
  mode = (mode == '""' or mode == "''") and '' or mode
  mode = mode or 'n'
  keys = Util.t(keys)
  if not Util.check_mode(mode) then
    Logger.error(
      'Invalid mode passed to :WhichKey (Dont create any keymappings to trigger WhichKey. WhichKey does this automaytically)'
    )
  else
    M.start(keys, { mode = mode, auto = true, _start_type = 'cmd:' .. keys .. ':' .. mode })
  end
end

local queue = {}

-- Defer registering keymaps until VimEnter
function M.register(mappings, opts)
  schedule_load()
  if loaded then
    Keys.register(mappings, opts)
    Keys.update()
  else
    table.insert(queue, { mappings, opts })
  end
end

-- Load mappings and update only once
function M.load()
  if loaded then
    return
  end
  require('which-key.plugins').setup()
  require('which-key.presets').setup()
  require('which-key.colors').setup()
  Keys.setup()

  for _, reg in pairs(queue) do
    local opts = reg[2] or {}
    opts.update = false
    Keys.register(reg[1], opts)
  end

  Keys.update()
  -- TODO: why not work - "n @!     v " or "n @!     c "
  -- local buf = vim.api.nvim_get_current_buf()
  -- local mode = Util.get_mode()
  -- Keys.get_tree(mode)
  -- Keys.get_tree(mode, buf)
  -- Keys.update(buf)

  local counts = Keys.dump().counts
  Logger.log_startup(load_start, counts, {
    hooked = Keys.hooked,
    auto = Keys.hooked_auto,
    nop = Keys.hooked_nop,
    fast = Keys.hooked_fast,
  })

  queue = {}
  loaded = true
end

function M.reset()
  -- local mappings = Keys.mappings
  require('plenary.reload').reload_module('which-key')
  -- require("which-key.Keys").mappings = mappings
  require('which-key').setup()
end

return M
