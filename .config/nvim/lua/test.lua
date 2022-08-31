function hoge(foo)
  return function(bar)
    print(foo, bar)
  end
end

hoge 'a' 'b'
