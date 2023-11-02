local dap, dapui = require('dap'), require('dapui')

--local toolDir = vim.fn.expand('~/tool')

-- dap adapter
--dap.adapters.php = {
--  type = 'executable',
--  command = 'node',
--  args = { vim.fn.expand('~/tool/vscode-php-debug/out/phpDebug.js') }
--}
--
--dap.configurations.php = {
--  {
--    type = 'php',
--    request = 'launch',
--    name = 'Listen for Xdebug',
--    port = 9003,
--    pathMappings = {
--      ['/var/www/app'] = '${workspaceFolder}'
--    }
--  }
--}

-- dap sign
vim.fn.sign_define('DapBreakpoint', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='', linehl='', numhl='' })

-- dapui
dapui.setup({
  controls = {
    element = 'repl',
    enabled = true,
    icons = {
      disconnect = '',
      pause = '',
      play = '',
      run_last = '',
      step_back = '',
      step_into = '',
      step_out = '',
      step_over = '',
      terminate = ''
    }
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = 'single',
    mappings = {
      close = { 'q', '<Esc>' }
    }
  },
  force_buffers = true,
  icons = {
    collapsed = '',
    current_frame = '',
    expanded = ''
  },
  layouts = { {
      elements = { {
          id = 'scopes',
          size = 0.35
        }, {
          id = 'breakpoints',
          size = 0.17
        }, {
          id = 'stacks',
          size = 0.31
        }, {
          id = 'watches',
          size = 0.17
        } },
      position = 'left',
      size = 60
    }, {
      elements = { {
          id = 'repl',
          size = 0.5
        }, {
          id = 'console',
          size = 0.5
        } },
      position = 'bottom',
      size = 10
    } },
  mappings = {
    edit = 'e',
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    repl = 'r',
    toggle = 't'
  },
  render = {
    indent = 1,
    max_value_lines = 100
  }
})


-- keymap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dc', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>do', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').run_last() end)

--vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--  require('dap.ui.widgets').hover()
--end)
--vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--  require('dap.ui.widgets').preview()
--end)
--vim.keymap.set('n', '<Leader>df', function()
--  local widgets = require('dap.ui.widgets')
--  widgets.centered_float(widgets.frames)
--end)
--vim.keymap.set('n', '<Leader>ds', function()
--  local widgets = require('dap.ui.widgets')
--  widgets.centered_float(widgets.scopes)
--end)

-- dap-ui key map
vim.keymap.set('n', '<leader>dd', function() require('dapui').toggle() end)
vim.keymap.set('n', '<leader>df', function() require('dapui').eval() end)
