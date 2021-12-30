local M = {}

local lsp_providers = {
  rust_analyzer = false,
  tsserver = true,
  pyright = true,
  gopls = true,
  sumneko_lua = true,
  jsonls = true,
}

local function setup_servers()
  local lsp_installer = require("nvim-lsp-installer")

  require("setup.lsp.null-ls").setup()

  lsp_installer.on_server_ready(function(server)
    Settings = {
        Lua = {
            diagnostics = {
                enable = true,
                globals = {
                    vim = true,
                },
            }
        }
    }

    if lsp_providers[server.name] then
      local server_opts = require("setup.lsp." .. server.name).setup(server)
      if server_opts then
        server:setup({server_opts, Settings})
      end
    else
      local lsputils = require("setup.lsp.utils")
      local opts = {
        on_attach = lsputils.lsp_attach,
        capabilities = lsputils.get_capabilities(),
        on_init = lsputils.lsp_init,
        on_exit = lsputils.lsp_exit,
      }
      server:setup({opts, Settings})
    end
  end)
end

function M.setup()
  setup_servers()
end

return M
