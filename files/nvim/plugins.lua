local plugins = {
  {
    "ledger/vim-ledger",
    ft = { "ledger" },
  },
  {
  "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },
}

return plugins
