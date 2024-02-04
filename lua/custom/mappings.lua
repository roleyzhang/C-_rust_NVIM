local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["gd"] = {
      "<cmd> lua vim.lsp.buf.definition()<CR>",
      "jumps to the definition of the symbol under the cursor"
    },
    ["<leader>lh"] = {
      "<cmd> lua vim.lsp.buf.hover()<CR>",
      "information about the symbol under the cursos in a floating window"
    },
    ["gi"] = {
      "<cmd> lua vim.lsp.buf.implementation()<CR>",
      "lists all the implementations for the symbol under the cursor in the quickfix window"
    },
    ["<leader>rn"] = {
      "<cmd> lua vim.lsp.util.rename()<CR>",
      "renaname old_fname to new_fname"
    },
    ["<leader>ca"] = {
      "<cmd> lua vim.lsp.buf.code_action()<CR>",
      "selects a code action available at the current cursor position"
    },
    ["gr"] = {
      "<cmd> lua vim.lsp.buf.references()<CR>",
      "lists all the references to the symbl under the cursor in the quickfix window"
    },
    ["<leader>ld"] = {
      "<cmd> lua vim.diagnostic.open_float()<CR>"
    },
    ["[d"] = {
      "<cmd> lua vim.diagnostic.goto_prev()<CR>"
    },
    ["]d"] = {
      "<cmd> lua vim.diagnostic.goto_next()<CR>"
    },
    ["<leader>lq"] = {
      "<cmd> lua vim.diagnostic.setloclist()<CR>"
    },
    ["<leader>lf"] = {
      "<cmd> lua vim.lsp.buf.format()<CR>"
    }
  }
}

M.crates = {
 -- plugin = true,
 n = {
   ["<leader>rcu"] = {
     function ()
       require('crates').upgrade_all_crates()
     end,
     "update crates"
   }
 }
}

M.hop = {
 -- plugin = true,
 n = {
   ["<leader>\\"] = {
     function ()
        -- local directions = require('hop.hint').HintDirection
       -- require('hop').hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false})
       require('hop').hint_char1({ current_line_only = false})
     end,
     "update crates"
   }
 }
}

return M
