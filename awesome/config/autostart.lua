local awful = require("awful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then findme = cmd:sub(0, firstspace - 1) end
  awful.spawn.with_shell(string.format(
                             'pgrep -u $USER -x %s > /dev/null || (%s)',
                             findme, cmd), false)
end

run_once("picom")           -- Compositor
run_once("lxsessions")      -- PolKit
run_once("nm-applet")       -- NetworkManager
run_once("flameshot")       -- Screenshot tool2
run_once("redshift-gtk")    -- Redshift tool
run_once("clight")          -- Brightness