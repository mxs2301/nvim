return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "dapui".setup()
    end
  },

  {
    "mfussenegger/nvim-dap",

    config = function()
      -- Set icons

      local sign = vim.fn.sign_define
      local to_define = { 'DapBreakpoint', 'DapBreakPointCondition', 'DapLogPoint', 'DapStopped', 'DapBreakpointRejected' }
      local icons = { ' ', '󰦻 ', ' ', ' ', ' ' }
      vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
      vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
      vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
      vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
      vim.api.nvim_set_hl(0, "red", { fg = "#9b111e" })

      local colors = { "red", "orange", "blue", "green" }

      sign(to_define[1], { text = icons[1], texthl = 'blue', linehl = 'red', numhl = 'red' })

      for key, value in pairs(to_define) do
        local num
        if key >= 4 then
          num = 4
        else
          num = key
        end
        sign(value, { text = icons[key], texthl = colors[num], linehl = "", numhl = "" })
      end

      -- Set adapters

      local dap = require "dap"

      dap.adapters.lldb = {
        type = 'executable',
        command = '/nix/store/8f1ljwxw084nsxf1bh4262cbs80cazls-profile/bin/lldb-dap',
        name = 'lldb'
      }
      dap.adapters.gdb = {
        type = 'executable',
        command = '/nix/store/41bv0zwjfa15rfcq6h1dqhjsawmzcr6b-profile/bin/gdb',
        args = { "-i", "dap" }
      }


      dap.configurations.cpp = {
        {
          name = 'Launch via LLDB',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},

          -- 💀
          -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
          --
          --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          --
          -- Otherwise you might get the following error:
          --
          --    Error on launch: Failed to attach to the target process
          --
          -- But you should be aware of the implications:
          -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
          -- runInTerminal = false,
        },
        {
          name = "Launch via GDB",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end
  }
}
