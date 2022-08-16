local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
on_attach = function(client)
  -- [[ other on_attach code ]]
  require 'illuminate'.on_attach(client)
end,
}

lspconfig.intelephense.setup {
    autostart = true,
}
--lspconfig.sumneko_lua.setup {}
--lspconfig.tsserver.setup {}
