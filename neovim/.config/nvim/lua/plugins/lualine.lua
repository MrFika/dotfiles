return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  opts = {
    options = {
      theme = "catppuccin",
    },
    global_status = true,
    extensions= {
      "nvim-tree",
      "mason",
      "lazy",
      "quickfix",
      "ctrlspace"
    }
  },
}
