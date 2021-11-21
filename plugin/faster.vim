" nnoremap <silent><Plug>(faster_move_j) :<C-u>lua require('faster').move_j()<CR>
" nnoremap <silent><Plug>(faster_move_k) :<C-u>lua require('faster').move_k()<CR>

nnoremap <silent><Plug>(faster_move_j) :<C-u>lua require('faster').move("j")<CR>
nnoremap <silent><Plug>(faster_move_k) :<C-u>lua require('faster').move("k")<CR>
nnoremap <silent><Plug>(faster_move_gj) :<C-u>lua require('faster').move("gj")<CR>
nnoremap <silent><Plug>(faster_move_gk) :<C-u>lua require('faster').move("gk")<CR>
lua _G.faster = require('faster').vmove
vnoremap <silent><expr> j v:lua.faster("j")
vnoremap <silent><expr> k v:lua.faster("k")
