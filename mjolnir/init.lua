local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local itunes = require "mjolnir.lb.itunes"

hotkey.bind({"cmd", "alt", "ctrl"}, 'space', itunes.displayCurrentTrack)

hotkey.bind({"cmd", "alt"}, 'up', function ()
  local win = window.focusedwindow()
  local scr = win:screen():frame()
  local f = win:frame()
  f.x = 0
  f.y = 0
  f.w = scr.w
  f.h = scr.h
  win:setframe(f)
end)

hotkey.bind({"cmd", "alt"}, "left", function ()
  local win = window.focusedwindow()
  local scr = win:screen():frame()
  local f = win:frame()
  f.x = 0
  f.y = 0
  f.w = scr.w / 2
  f.h = scr.h
  win:setframe(f)
end)

hotkey.bind({"cmd", "alt"}, "right", function ()
  local win = window.focusedwindow()
  local scr = win:screen():frame()
  local f = win:frame()
  f.x = scr.w / 2
  f.y = 0
  f.w = scr.w / 2
  f.h = scr.h
  win:setframe(f)
end)
