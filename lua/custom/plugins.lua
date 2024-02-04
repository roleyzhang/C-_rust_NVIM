--local cmp = require "cmp"

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    -- opts = {
    --   ensure_installed = {
    --   },
    -- },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "VeryLazy",
    -- opts = {
    --   ensure_installed = {
    --   },
    -- },
  },
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  --  opts = function ()
  --    return require "custom.configs.null-ls"
  --  end,
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    --opts = function ()
    --  return require "custom.configs.null-ls"
    --end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require('chatgpt').setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      }
    },
  },
  {
    "mfussenegger/nvim-dap",
     config = function(_, _)
       require("core.utils").load_mappings("dap")
     end
  },
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    --opts = function ()
    --  return require "custom.configs.plenary"
    --end,
  },
  {
    "Shatur/neovim-cmake",
    event = "VeryLazy",
    dependencies = {
    "nvim-lua/plenary.nvim",
    },
    opts = function ()
      return require "custom.configs.cmake"
    end,
  },
  {
    'saecki/crates.nvim',
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      -- require('cmp').setup.buffer({
      --   sources = { { name = "crates" }}
      -- })
      crates.show()
      -- require("core.utils").load_mappings("crates")
    end,
  },
--  {
--    "theHamsta/nvim-dap-virtual-text",
--    lazy = false,
--    config = function(_, opts)
--      require("nvim-dap-virtual-text").setup()
--    end
--  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      -- M.completion.completeopt = "menu,menuone,noselect"
      -- M.mapping["<CR>"] = cmp.mapping.confirm {
      --   behavior = cmp.ConfirmBehavior.Insert,
      --   select = false,
      -- }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
  'phaazon/hop.nvim',
  lazy = false,
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
  }
  }
return plugins
