-- https://wezfurlong.org/wezterm/config/files.html

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

function ime(config)
   config.use_ime = true
end

-- 色や見た目関係の設定
function visual(config)
   config.color_scheme = 'Dark Violet'
   config.window_background_image = "/home/toshi/Pictures/wallpaper/v_miku00638_black.png"
   config.font_size = 14
   return config
end

ime(config)
visual(config)
-- and finally, return the configuration to wezterm
return config
