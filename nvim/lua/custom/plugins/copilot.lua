local M = {}

function M.setup()
-- Copilot
cmd [[
    imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
]]
end

return M

