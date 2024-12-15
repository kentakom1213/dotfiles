local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 14.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- タブが1つしかない場合にはタブバーを表示しない
config.hide_tab_bar_if_only_one_tab = true

-- タブの+ボタンを削除
config.show_new_tab_button_in_tab_bar = false

-- and finally, return the configuration to wezterm
return config
