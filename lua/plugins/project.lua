return {

  {
    "natecraddock/workspaces.nvim",

    config = function()
      local opts = {
        hooks = {
          open = { "Telescope find_files" },
        },
      }

      require("workspaces").setup(opts)
    end,
  },

  --{
  --  "kndndrj/nvim-projector",
  --  dependencies = {
  --    "MunifTanhim/nui.nvim",
  --    "kndndrj/projector-neotest",
  --    "kndndrj/projector-vscode",
  --  },

  --  config = function()
  --    require("projector").setup({
  --      outputs = {
  --        require("projector.outputs").TaskOutputBuilder:new(),
  --        require("projector_vscode").LaunchJsonLoader:new(),
  --        require("projector_vscode").TasksJsonLoader:new(),
  --        require("projector.outputs").DadbodOutputBuilder:new(),
  --        require("projector.outputs").DapOutputBuilder:new(),
  --      },
  --    })
  --  end,
  --},
}
