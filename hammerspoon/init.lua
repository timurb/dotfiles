local application = require "hs.application"
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local fnutils = require "hs.fnutils"
local alert = require "hs.alert"
local itunes = require "hs.itunes"

hotkey.bind({"cmd", "alt", "ctrl"}, 'space', itunes.displayCurrentTrack)

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
  f.x = 0
  f.y = 0
  f.w = scr.w / 2
  f.h = scr.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt"}, "right", function ()
  local win = window.focusedWindow()
  local scr = win:screen():frame()
  local f = win:frame()
  f.x = scr.w / 2
  f.y = 0
  f.w = scr.w / 2
  f.h = scr.h
  win:setFrame(f)
end)
