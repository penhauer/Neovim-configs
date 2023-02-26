
_G.myutil = {}

function myutil.is_available(plugin)
  a, b = pcall(require, plugin)
  print(a, b)
end


return myutil
