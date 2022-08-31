local util = {}

function util.set(opts)
  for key, value in pairs(opts) do
    vim.opt[key] = value
  end
end

function util.augroup(name)
  local group = vim.api.nvim_create_augroup(name, { clear = true })
  return function(specs)
    for event, spec in pairs(specs) do
      spec.options.group = group
      vim.api.nvim_create_autocmd(spec.events, spec.options)
    end
  end
end

function util.autocmd(events)
  return function(options)
    return { events=events, options=options }
  end
end

return util
