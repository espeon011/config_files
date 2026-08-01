# vim keybind
bleopt default_keymap=vi
function blerc/kyemap-vi-load-hook {
  bleopt keymap_vi_mode_string_nmap=$'\e[1m-- NORMAL --\e[m'
}
blehook/eval-after-load keymap_vi blerc/kyemap-vi-load-hook

# ↓ ble.sh の高速化のための設定 (by Claude) ↓

# ファイル名の存在確認による着色を無効化 (stat が遅い Windows では効果大)
# bleopt highlight_filename=
# 完全に切りたくないならタイムアウト/上限を下げる
bleopt highlight_timeout_async=5000
bleopt highlight_timeout_sync=50
bleopt highlight_eval_word_limit=200

# 補完候補の着色オフ
# bleopt complete_menu_color=off

# 裏で走る自動補完を止める (打鍵中の引っかかりが消える)
# bleopt complete_auto_complete=
# bleopt complete_menu_filter=
# 切りたくない場合は遅延を入れるだけでもかなり変わる
bleopt complete_auto_delay=500

# 補完の候補数・タイムアウト制限
bleopt complete_limit_auto=1000
bleopt complete_limit_auto_menu=100
bleopt complete_timeout_auto=5000
bleopt complete_timeout_compvar=200
bleopt complete_polling_cycle=50
bleopt complete_menu_maxlines=10
bleopt complete_menu_style=dense
