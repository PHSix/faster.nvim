local vim = vim
local fn = vim.fn
local cktime = tonumber(fn['reltimestr'](fn['reltime']()))
local cjtime = tonumber(fn['reltimestr'](fn['reltime']()))
local press_fre = 0

local faster_move_j = function ()
  if vim.v.count > 1 then
    vim.cmd('normal! ' .. vim.v.count .. 'j')
    return
  end
  if tonumber(fn['reltimestr'](fn['reltime']())) - cjtime > 0.1 or tonumber(fn['reltimestr'](fn['reltime']())) - cjtime < 0.01 then
    press_fre = 0
  end
  local step = math.floor((press_fre / 5) + 1)
  if step >= 10 then
    step = 10
  end
  cjtime = tonumber(fn['reltimestr'](fn['reltime']()))
  press_fre = press_fre + 1
  local cmd = ""
  if step ~= 1 then
    cmd = 'normal! ' .. step .. 'j'
  else
    cmd = 'normal! ' .. 'j'
  end
  vim.cmd(cmd)
end

local faster_move_k = function ()
  if vim.v.count > 1 then
    vim.cmd('normal! ' .. vim.v.count .. 'k')
    return
  end
  if tonumber(fn['reltimestr'](fn['reltime']())) - cktime > 0.1 or tonumber(fn['reltimestr'](fn['reltime']())) - cktime < 0.01 then
    press_fre = 0
  end
  local step = math.floor((press_fre / 5) + 1)
  if step >= 10 then
    step = 10
  end
  cktime = tonumber(fn['reltimestr'](fn['reltime']()))
  press_fre = press_fre + 1
  local cmd = ""
  if step ~= 1 then
    cmd = 'normal! ' .. step .. 'k'
  else
    cmd = 'normal! ' .. 'k'
  end
  vim.cmd(cmd)
end

return {
  move_j = faster_move_j,
  move_k = faster_move_k
}

