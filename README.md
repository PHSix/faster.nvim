# faster.nvim
A neovim plugin to accelerate j or k moving.

# Screenshot
![use accelerate](./image/acc.gif) 
![normal](./image/noacc.gif) 

# Usage
> 2021-10-24 upgrade: Now support map `gk` or `gj` for user who has `set wrap`.
It only testing with the packer(one of the neovim plugins manager).
```lua
use{
  "PHSix/faster.nvim",
  event = {"VimEnter *"},
  config = function()
    vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
    vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
    -- or 
    -- vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_gj)', {noremap=false, silent=true})
    -- vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_gk)', {noremap=false, silent=true})
  end
}
```

	
# Inspiration
[rhysd/accelerated-jk](https://github.com/rhysd/accelerated-jk)

