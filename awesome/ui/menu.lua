local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful") -- for awesome.icon

local M = {}  -- menu
local _M = {} -- module

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

M.awesome = {
  { "Hotkeys",         function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "Manual",          RC.vars.terminal .. " -e man awesome" },
  { "Edit config",     RC.vars.editor_gui .. " " .. awful.util.getdir("config") },
  { "Restart", awesome.restart },
  { "Quit",    function() awesome.quit() end }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "Awesome", M.awesome, beautiful.awesome_subicon },
    { "Terminal", RC.vars.terminal },
    { "Browser", "brave" },
    { "Files", "thunar"},
--  { "Logout", "pkill -KILL -u " .. RC.vars.username },
    { "Reboot", "reboot" },
    { "Shutdown", "shutdown now" },

  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
