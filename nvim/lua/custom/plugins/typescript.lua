local M = {}

M.typescript = function()
   local ts = require "typescript"

      ts.setup {
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
  }
end

return M
