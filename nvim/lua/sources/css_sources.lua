local cmp = require("cmp")
local source = {}

source.new = function()
  return setmetatable({}, { __index = source })
end

source.get_keyword_pattern = function()
  return [[\-\-space\-\?\k*]]
end

source.complete = function(self, request, callback)
  local cwd = vim.fn.getcwd()
  local items = {}

  -- Check if we are in the "life-ledger" directory
  if cwd:match("life%-ledger") then
    items = {
      { label = "--space-2",   documentation = "2px" },
      { label = "--space-4",   documentation = "4px" },
      { label = "--space-6",   documentation = "6px" },
      { label = "--space-8",   documentation = "8px" },
      { label = "--space-12",  documentation = "12px" },
      { label = "--space-16",  documentation = "16px" },
      { label = "--space-20",  documentation = "20px" },
      { label = "--space-24",  documentation = "24px" },
      { label = "--space-32",  documentation = "32px" },
      { label = "--space-40",  documentation = "40px" },
      { label = "--space-48",  documentation = "48px" },
      { label = "--space-64",  documentation = "64px" },
      { label = "--space-80",  documentation = "80px" },
      { label = "--space-96",  documentation = "96px" },
      { label = "--space-128", documentation = "128px" },
      { label = "--space-160", documentation = "160px" },
    }
  end

  callback({ items = items, isIncomplete = false })
end

return source
