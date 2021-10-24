local vim = vim
local fn = vim.fn
local press_fre = 0
local times = {}

local initState = function()
  local now_time = tonumber(fn["reltimestr"](fn["reltime"]()))
  times = {
    k = now_time,
    j = now_time,
    gk = now_time,
    gj = now_time
  }
end

initState()
-- @param to string
local move = function(to)
  if vim.v.count > 1 then
    vim.cmd("normal! " .. vim.v.count .. to)
    return
  end
  local cur_time = times[to]
  if
    tonumber(fn["reltimestr"](fn["reltime"]())) - cur_time > 0.1 or
      tonumber(fn["reltimestr"](fn["reltime"]())) - cur_time < 0.01
   then
    press_fre = 0
  end
  local step = math.floor((press_fre / 5) + 1)
  if step >= 10 then
    step = 10
  end
  times[to] = tonumber(fn["reltimestr"](fn["reltime"]()))
  press_fre = press_fre + 1
  local cmd = ""
  if step ~= 1 then
    cmd = "normal! " .. step .. to
  else
    cmd = "normal! " .. to
  end
  vim.cmd(cmd)
end
return {
  move = move
}
