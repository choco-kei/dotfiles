local packer = require('packer')
packer.util = require('packer.util')

packer.init({
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      --update = 'pull --ff-only --progress --rebase=false --force',
      update = 'pull --progress --rebase --force',
    },
  },
})
