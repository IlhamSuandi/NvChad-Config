local ensure_installed = {
  "stylua",
  "lua-language-server",
  "typescript-language-server",
  "pyright",
}

-- Function to check if all ensure_installed LSP servers are installed
local function are_all_servers_installed()
  local registry = require "mason-registry"
  for _, server in ipairs(ensure_installed) do
    if not registry.is_installed(server) then
      return false
    end
  end
  return true
end

-- Create an autocommand to run MasonInstallAll if necessary
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if not are_all_servers_installed() then
      vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
    end
  end,
})
