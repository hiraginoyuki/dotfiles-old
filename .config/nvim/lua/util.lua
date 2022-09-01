local util = {}

function util.assign(assignee)
  return function(obj)
    for key, value in pairs(obj) do
      assignee[key] = value
    end
  end
end

function util.augroup(name)
  return function(specs)
    local group = vim.api.nvim_create_augroup(name, { clear = true })
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

function util.command(name)
  return function(command)
    vim.api.nvim_create_user_command(name, command, {})
  end
end

return util
