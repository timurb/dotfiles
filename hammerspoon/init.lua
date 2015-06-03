local application = require "hs.application"
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local fnutils = require "hs.fnutils"
local alert = require "hs.alert"
local itunes = require "hs.itunes"
local battery = require "hs.battery"
local alert = require "hs.alert"

hotkey.bind({"cmd", "alt", "ctrl"}, 'space', itunes.displayCurrentTrack)

hotkey.bind({"cmd", "alt", "ctrl"}, 'R', function()
  hs.reload()
  hs.alert.show("Config loaded")
end)

hotkey.bind({"cmd", "alt", "ctrl"}, 'B', function ()
  local percentage = battery.percentage()
  local time_mins = battery.timeRemaining()

  if time_mins == -1 then
    time_string = "Calculating"
  elseif time_mins == -2 then
    time_string = "On Power"
  else
    time_hours = math.floor(time_mins / 60)
    time_mins = math.floor(time_mins % 60)
    time_string = string.format("%s:%s", time_hours, time_mins)
  end

  alert.show(string.format("%s%%, %s", percentage, time_string))

end)

hotkey.bind({"cmd", "alt"}, 'up', function ()
  local win = window.focusedWindow()
  local scr = win:screen():frame()
  local f = win:frame()
  f.x = 0
  f.y = 0
  f.w = scr.w
  f.h = scr.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt"}, "left", function ()
  local win = window.focusedWindow()
  local scr = win:screen():frame()
  local f = win:frame()

  if (f.x ~= 0) or (f.w > scr.w / 2) then
    f.w = math.floor(scr.w / 2)
  elseif f.w > scr.w / 3 then
    f.w = math.floor(scr.w / 3)
  else
    f.w = math.floor(scr.w / 4)
  end

  f.h = scr.h

  f.x = 0
  f.y = 0

  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt"}, "right", function ()
  local win = window.focusedWindow()
  local scr = win:screen():frame()
  local f = win:frame()

  if (f.x + f.w ~= scr.w) or (f.w > scr.w / 2) then   -- account for possible roundups
    f.x = math.floor(scr.w / 2)
    f.w = math.floor(scr.w / 2)
  elseif f.w > scr.w / 3 then
    f.x = scr.w - math.floor(scr.w / 3)
    f.w = math.floor(scr.w / 3)
  else
    f.x = scr.w - math.floor(scr.w / 4)
    f.w = math.floor(scr.w / 4)
  end

  f.y = 0
  f.h = scr.h
  win:setFrame(f)
end)
