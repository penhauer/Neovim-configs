function start()
  local bufnr = vim.api.nvim_win_get_buf(0)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local M = require("vim.treesitter")
  return M.get_node_at_pos(bufnr, cursor[1] - 1, cursor[2], { ignore_injections = false })
end

function get_current_cursor()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return cursor
end


function cursor_in_visual()
  local cursor = get_current_cursor()
  local selection = get_current_visual_selection()
  local ss, sf = selection[1], selection[2]
  return point_in_range(ss, sf, cursor)
end


function get_current_visual_selection()
  -- escape so the the current selection turns to previous selection
  	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)

  local vs = vim.api.nvim_buf_get_mark(0, "<") -- visual start
  local vf = vim.api.nvim_buf_get_mark(0, ">") -- visual end
  return { vs, vf }
end


function point_in_range(range_s, range_f, point)
  local pl, pc = point[1], point[2]     -- point line, piont column
  local sl, sc = range_s[1], range_s[2] -- start line, start column
  local fl, fc = range_f[1], range_f[2] -- finish line, finish column

  print(pl, pc, "in ", sl, sc, fl, fc)

  if pl < sl or (pl == sl and pc < sc) then
    print("returning false")
    return false
  end
  if pl > fl or (pl == fl and pc > fc) then
    print("returning false")
    return false
  end
  return true
end


function range_in_range(r1_s, r1_f, r2_s, r2_f)
  if not point_in_range(r1_s, r1_f, r2_s) or not point_in_range(r1_s, r1_f, r2_f) then
    print("not range in range")
    return false
  end
  return true
end

function get_node_ranges(node)
  -- (0,0)-based
    local ns_l, ns_c, nf_l, nf_c = node:range() -- node start - node finish
    -- make it (1,0)-indexed and range inclusive
    return { { ns_l + 1, ns_c }, { nf_l + 1, nf_c - 1 } }
end

function hendel()
  -- mode should be retrieved before get visual selection
  -- because mode would change to normal when called
  mode = vim.api.nvim_get_mode().mode

  print("-----------------------")
  print(times)
  times = times + 1

  local selection = get_current_visual_selection()
  local vs, vf = selection[1], selection[2]
  print("visual select", vs[1], vs[2], vf[1], vf[2])




  print("current mode is ", mode)
  if mode ~= "v" and mode ~= "V" and mode ~= "^V" then
    node = start()
    local x = get_current_cursor()
    vs = x
    vf = x
    print("visual select changed into", vs[1], vs[2], vf[1], vf[2])
  end




  while true do
    print("running")
    local ff = get_node_ranges(node)
    local ns = ff[1]
    local nf = ff[2]
    print("Node range", ns[1], ns[2], nf[1], nf[2])
    if not range_in_range(ns, nf, vs, vf) then
      print("getting to parent node")
      node = node:parent()
    else
      break
    end
  end

  local ranges = get_node_ranges(node)
  local ns = ranges[1]
  local nf = ranges[2]

  -- print(ns, nf)
  print("selecting")
  print(ns[1], ns[2])
  print(nf[1], nf[2])


  vim.api.nvim_win_set_cursor(0, ns)
  vim.cmd("normal v")
  vim.api.nvim_win_set_cursor(0, nf)
end

vim.api.nvim_set_keymap("v", "<leader>m", "",
  {
    callback = function()
      hendel()
    end
  }
)

vim.api.nvim_set_keymap("n", "<leader>m", "",
  {
    callback = function()
      hendel()
    end
  }
)


local function get_visual_selection()
    -- Yank current visual selection into the 'v' register
    --
    -- Note that this makes no effort to preserve this register
    vim.cmd('noau normal! "vy"')

    return vim.fn.getreg('v')
end


times = 1
function test()
  print("---------------------")
  print(times)
  times = times + 1
  local selection = get_current_visual_selection()
  local vs, vf = selection[1], selection[2]


  local zz = get_visual_selection()
  print(zz)
  print("visual select", vs[1], vs[2], vf[1], vf[2])
end

vim.api.nvim_set_keymap("n", "<leader>i", "",
  {
    callback = function()
      test()
    end
  }
)

vim.api.nvim_set_keymap("v", "<leader>i", "",
  {
    callback = function()
      test()
    end
  }
)
