dap = require'dap'

vim.keymap.set("n", "<F5>", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<F9>", function() dap.continue() end)
vim.keymap.set("n", "<F10>", function() dap.step_over() end)
vim.keymap.set("n", "<F11>", function() dap.step_into() end)
