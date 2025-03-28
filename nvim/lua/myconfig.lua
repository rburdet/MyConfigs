local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}



local dap, dapui = require('dap'), require('dapui')
local dap_vscode = require("dap.ext.vscode")
local dapgo = require('dap-go')
dapui.setup()
dapgo.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end


-- Include the next few lines until the comment only if you feel you need it
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

for _, language in ipairs(js_based_languages) do
end

-- require("dap-vscode-js").setup({
--   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--   debugger_path ="/Users/rodburde/vscode-js-debug", -- Path to vscode-js-debug installation.
--   -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
--   log_file_path = "(stdpath cache)/dap_vscode_js.log", -- Path for file logging
--   -- log_file_level = true, -- Logging level for output to file. Set to false to disable file logging.
--   log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
-- })
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {"/Users/rodburde/vscode-js-debug/out/src/dapDebugServer.js", "${port}"},
  },
}

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require'dap.utils'.pick_process,
    cwd = "${workspaceFolder}",
  }
}
end


-- dap_vscode.type_to_filetypes["node"] = js_based_languages
-- 
-- 
-- 
-- dap.adapters["pwa-node"] = {
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = "node",
--     args = {"/Users/rodburde/vscode-js-debug/out/src/vsDebugServer.js", "${port}"},
--   },
-- }
-- 
-- if not dap.adapters["node"] then
--   dap.adapters["node"] = function(cb, config)
--     if config.type == "node" then
--       config.type = "pwa-node"
--     end
--     local nativeAdapter = dap.adapters["pwa-node"]
--     if type(nativeAdapter) == "function" then
--       nativeAdapter(cb, config)
--     else
--       cb(nativeAdapter)
--     end
--   end
-- end
-- 
-- 
-- for _, language in ipairs(js_based_languages) do
--   dap.configurations[language] = {
--     -- Debug single nodejs files
--     {
--       name = "Launch file",
--       type = "pwa-node",
--       request = "launch",
--       program = "${file}",
--       cwd = "${workspaceFolder}",
--       args = {"${file}"},
--       sourceMaps = true,
--       sourceMapPathOverrides = {
--         ["./*"] = "${workspaceFolder}/src/*",
--       },
--     },
--     -- Debug nodejs processes (make sure to add --inspect when you run the process)
--     {
--       name = "Attach",
--       type = "pwa-node",
--       request = "attach",
--       processId = require("dap.utils").pick_process,
--       cwd = "${workspaceFolder}",
--       sourceMaps = true,
--     },
--     {
--       name = "Debug Jest Tests",
--       type = "pwa-node",
--       request = "launch",
--       runtimeExecutable = "node",
--       runtimeArgs = {"${workspaceFolder}/node_modules/.bin/jest", "--runInBand"},
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       console = "integratedTerminal",
--       internalConsoleOptions = "neverOpen",
--       -- args = {'${file}', '--coverage', 'false'},
--       -- sourceMaps = true,
--       -- skipFiles = {'node_internals/**', 'node_modules/**'},
--     },
--     {
--       name = "Debug Vitest Tests",
--       type = "pwa-node",
--       request = "launch",
--       cwd = vim.fn.getcwd(),
--       program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
--       args = {"run", "${file}"},
--       autoAttachChildProcesses = true,
--       smartStep = true,
--       skipFiles = {"<node_internals>/**", "node_modules/**"},
--     },
--     -- Debug web applications (client side)
--     {
--       name = "Launch & Debug Chrome",
--       type = "pwa-chrome",
--       request = "launch",
--       url = function()
--         local co = coroutine.running()
--         return coroutine.create(function()
--           vim.ui.input({prompt = "Enter URL: ", default = "http://localhost:3000"}, function(url)
--             if url == nil or url == "" then
--               return
--             else
--               coroutine.resume(co, url)
--             end
--           end)
--         end)
--       end,
--       webRoot = vim.fn.getcwd(),
--       protocol = "inspector",
--       sourceMaps = true,
--       userDataDir = false,
--       resolveSourceMapLocations = {
--         "${workspaceFolder}/**",
--         "!**/node_modules/**",
--       },
-- 
--       -- From https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/plugins/dap.lua
--       -- To test how it behaves
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       console = "integratedTerminal",
--       internalConsoleOptions = "neverOpen",
--       sourceMapPathOverrides = {
--         ["./*"] = "${workspaceFolder}/src/*",
--       },
--     },
--     {
--       name = "----- ↑ launch.json configs (if available) ↑ -----",
--       type = "",
--       request = "launch",
--     },
--   }
-- end





vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F3>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F2>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>q', function()
require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>Q', function() require('dap').set_breakpoint()
end)
vim.keymap.set('n', '<Leader>lp', function()
require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

vim.keymap.set('n', '<Leader>w', function() dapui.open() end)
vim.keymap.set('n', '<Leader>W', function() dapui.close() end)

