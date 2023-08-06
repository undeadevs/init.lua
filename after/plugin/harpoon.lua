require("harpoon").setup()

vim.keymap.set("n", "<leader>.", function()
  require("harpoon.mark").add_file()
end, { desc = "[<leader>.] Add file to harpoon" })

vim.keymap.set("n", "<leader>n", function()
  require("harpoon.ui").nav_next()
end, { desc = "[<leader>n] Jump to next file in harpoon list" })

vim.keymap.set("n", "<leader>N", function()
  require("harpoon.ui").nav_prev()
end, { desc = "[<leader>N] Jump to prev file in harpoon list" })

vim.keymap.set("n", "<leader>oh", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "[O]pen [H]arpoon menu" })

vim.keymap.set("n", "<leader>1h", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "[h<NUM>] Jump to 1st file in harpoon list" })

vim.keymap.set("n", "<leader>2h", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "[h<NUM>] Jump to 2nd file in harpoon list" })

vim.keymap.set("n", "<leader>3h", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "[h<NUM>] Jump to 3rd file in harpoon list" })

vim.keymap.set("n", "<leader>4h", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "[h<NUM>] Jump to 4th file in harpoon list" })
