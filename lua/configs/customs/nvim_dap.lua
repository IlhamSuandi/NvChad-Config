local dap = require "dap"
local dapui = require "dapui"
local map = vim.keymap.set

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch dart",
    dartSdkPath = "/usr/bin/flutter/bin/dart", -- ensure this is correct
    flutterSdkPath = "/usr/bin/flutter/bin/flutter", -- ensure this is correct
    program = "/home/zee/code/mazi_beauty/mazi_beauty_fe/lib/main.dart", -- ensure this is correct
    cwd = "/home/zee/code/mazi_beauty/mazi_beauty_fe/",
  },
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/usr/bin/flutter/bin/dart", -- ensure this is correct
    flutterSdkPath = "/usr/bin/flutter/bin/flutter", -- ensure this is correct
    program = "/home/zee/code/mazi_beauty/mazi_beauty_fe/lib/main.dart", -- ensure this is correct
    cwd = "/home/zee/code/mazi_beauty/mazi_beauty_fe/",
  },
}

-- Dart CLI adapter (recommended)
dap.adapters.dart = {
  type = "executable",
  command = "dart", -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
  args = { "debug_adapter" },
  -- windows users will need to set 'detached' to false
  options = {
    detached = false,
  },
}
dap.adapters.flutter = {
  type = "executable",
  command = "flutter", -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
  args = { "debug_adapter" },
  -- windows users will need to set 'detached' to false
  options = {
    detached = false,
  },
}

dapui.setup()
map("n", "<leader>dt", dap.toggle_breakpoint, { desc = "debug toggle breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "debug continue" })
