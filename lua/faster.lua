local uv = vim.loop
local api = vim.api
local press_freq = 0
local times = {}

local get_cur_time = function()
  return uv.hrtime() / 1000000000
end
local initState = function()
  local now_time = get_cur_time()
  times = {
    k = now_time,
    j = now_time,
    gk = now_time,
    gj = now_time
  }
end
local t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

initState()
-- @param to string
local move = function(to)
  if vim.v.count > 1 then
    vim.cmd("normal! " .. vim.v.count .. to)
    return
  end
  local last_time = times[to]
  if get_cur_time() - last_time > 0.1 or get_cur_time() - last_time < 0.01 then
    press_freq = 0
  end
  local step = math.floor((press_freq / 5) + 1)
  if step >= 10 then
    step = 10
  end
  times[to] = get_cur_time()
  press_freq = press_freq + 1
  local cmd = ""
  if step ~= 1 then
    cmd = "normal! " .. step .. to
  else
    cmd = "normal! " .. to
  end
  vim.cmd(cmd)
end

local vmove = function(to)
  if vim.v.count > 1 then
    return t(to)
  end
  local last_time = times[to]
  if get_cur_time() - last_time > 0.1 or get_cur_time() - last_time < 0.01 then
    press_freq = 0
  end
  local step = math.floor((press_freq / 5) + 1)
  if step >= 10 then
    step = 10
  end
  times[to] = get_cur_time()
  press_freq = press_freq + 1
  if step ~= 1 then
    return t(step .. to)
  else
    return t(to)
  end
end
return {
  move = move,
  vmove = vmove
}
