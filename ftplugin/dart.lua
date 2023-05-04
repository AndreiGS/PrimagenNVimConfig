vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

local dapG = require('dap')

dapG.adapters.flutter = {
  type = 'executable',
  command = 'flutter',
  args = {'attach'},
  env = {
    FLUTTER_AOT = '0',
    FLUTTER_TOOL_ARGS = '-d <DEVICE_ID>',
  },
}

dapG.configurations.flutter = {
  {
    type = 'flutter',
    request = 'attach',
    name = 'Attach to Flutter app',
    flutterMode = 'debug',
    program = '${workspaceFolder}/lib/main.dart',
    cwd = '${workspaceFolder}',
    -- args = '--flavor <FLAVOR>',
    device = '<DEVICE_ID>',
  },
}

function select_device()
  local dap = require('dap')
  print(dap.list_debuggers())
  -- get a list of running devices
  local devices = dap.list_debuggers()['flutter'].list_available_capabilities().devices

  -- create a menu of devices to choose from
  local menu_items = {}
  for _, device in ipairs(devices) do
    local label = string.format('%s (%s)', device.name, device.id)
    table.insert(menu_items, {label = label, value = device.id})
  end

  -- prompt the user to select a device
  local selection = vim.fn.inputlist(menu_items)

  -- if the user selected a device, return its ID
  if selection > 0 then
    return menu_items[selection].value
  else
    return nil
  end
end

function dap.continue_with_device()
  local dap = require('dap')
  local device_id = select_device()

  if device_id then
    dap.continue({configuration = 'flutter', device = device_id})
  else
    print('No device selected.')
  end
end

vim.keymap.set("n", "<F9>", function() dap.continue_with_device() end)
