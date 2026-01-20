local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- フォント
config.font_size = 15.0
config.font = wezterm.font_with_fallback {
    -- "Ubuntu Mono",
    -- "HackLineNF",
    "HackGen Console",
    "JetBrains Mono",
}

-- タブが1つしかない場合にはタブバーを表示しない
config.hide_tab_bar_if_only_one_tab = true

-- タブの+ボタンを削除
config.show_new_tab_button_in_tab_bar = false

-- キーバインドの読み込み
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

-- and finally, return the configuration to wezterm
return config
