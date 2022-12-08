local util = {}

function util.dbg(expr)
  print(expr)
  return expr
end

function util.assign(assignee)
  return function(obj)
    for key, value in pairs(obj) do
      assignee[key] = value
    end
  end
end

function util.in_order(plugins)
  return function(opts)
    local result = {}
    for i, plugin in ipairs(plugins) do
      if type(plugin) == 'table' then
        result[i] = plugin
      else
        result[i] = { plugin } 
      end
      if i ~= 1 then
        result[i].after = result[i-1][1]:gsub('.+/', '')
      end
    end
    util.assign(result[#plugins])(opts)
    return result
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
    return function(opts)
      vim.api.nvim_create_user_command(name, command, opts)
    end
  end
end

function util.alias(name)
  return function(command)
    vim.api.nvim_create_user_command(name, command, {})
  end
end

return util
